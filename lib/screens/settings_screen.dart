import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/portfolio_data.dart';
import '../models/portfolio_note.dart';
import '../services/app_state.dart';
import '../widgets/responsive_page.dart';
import '../widgets/section_header.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsivePage(
      children: const [
        SectionHeader(
          title: 'Settings',
          subtitle: 'Theme preference, favorite projects, and local notes.',
        ),
        _ThemeSettingsCard(),
        SizedBox(height: 16),
        _FavoriteProjectsCard(),
        SizedBox(height: 16),
        _NotesCard(),
      ],
    );
  }
}

class _ThemeSettingsCard extends StatelessWidget {
  const _ThemeSettingsCard();

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SegmentedButton<ThemeMode>(
                selected: {appState.themeMode},
                onSelectionChanged: (selection) {
                  appState.setThemeMode(selection.first);
                },
                segments: const [
                  ButtonSegment(
                    value: ThemeMode.system,
                    icon: Icon(Icons.brightness_auto_outlined),
                    label: Text('Device'),
                  ),
                  ButtonSegment(
                    value: ThemeMode.light,
                    icon: Icon(Icons.light_mode_outlined),
                    label: Text('Light'),
                  ),
                  ButtonSegment(
                    value: ThemeMode.dark,
                    icon: Icon(Icons.dark_mode_outlined),
                    label: Text('Dark'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Device mode follows your phone. Light and dark override it.',
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteProjectsCard extends StatelessWidget {
  const _FavoriteProjectsCard();

  @override
  Widget build(BuildContext context) {
    final favoriteTitles = context.watch<AppState>().favoriteProjectTitles;
    final favorites = PortfolioData.projects
        .where((project) => favoriteTitles.contains(project.title))
        .toList();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Favorite Projects',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            if (favorites.isEmpty)
              const Text('Tap the heart on a project to save it here.')
            else
              for (final project in favorites)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.favorite),
                  title: Text(project.title),
                  subtitle: Text(project.year),
                ),
          ],
        ),
      ),
    );
  }
}

class _NotesCard extends StatelessWidget {
  const _NotesCard();

  @override
  Widget build(BuildContext context) {
    final notes = context.watch<AppState>().notes;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Local Notes',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                FilledButton.icon(
                  onPressed: () => _showNoteSheet(context),
                  icon: const Icon(Icons.add),
                  label: const Text('Add'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'This small CRUD area is stored locally with shared_preferences.',
            ),
            const SizedBox(height: 10),
            if (notes.isEmpty)
              const Text('No notes yet.')
            else
              for (final note in notes)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.note_alt_outlined),
                  title: Text(note.title),
                  subtitle: Text(note.body),
                  trailing: Wrap(
                    spacing: 4,
                    children: [
                      IconButton(
                        tooltip: 'Edit note',
                        onPressed: () => _showNoteSheet(context, note: note),
                        icon: const Icon(Icons.edit_outlined),
                      ),
                      IconButton(
                        tooltip: 'Delete note',
                        onPressed: () =>
                            context.read<AppState>().deleteNote(note),
                        icon: const Icon(Icons.delete_outline),
                      ),
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }

  void _showNoteSheet(BuildContext context, {PortfolioNote? note}) {
    final titleController = TextEditingController(text: note?.title);
    final bodyController = TextEditingController(text: note?.body);
    final formKey = GlobalKey<FormState>();

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.viewInsetsOf(sheetContext).bottom + 20,
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  note == null ? 'Add Note' : 'Edit Note',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Enter title'
                      : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: bodyController,
                  maxLines: 3,
                  decoration: const InputDecoration(labelText: 'Body'),
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Enter body'
                      : null,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () async {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }

                      final appState = context.read<AppState>();
                      if (note == null) {
                        await appState.addNote(
                          titleController.text.trim(),
                          bodyController.text.trim(),
                        );
                      } else {
                        await appState.updateNote(
                          note,
                          titleController.text.trim(),
                          bodyController.text.trim(),
                        );
                      }

                      if (sheetContext.mounted) {
                        Navigator.of(sheetContext).pop();
                      }
                    },
                    child: Text(note == null ? 'Create Note' : 'Save Changes'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
