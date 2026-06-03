import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/project.dart';
import '../services/app_state.dart';
import '../services/link_launcher_service.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final isFavorite = appState.isFavorite(project);

    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
        actions: [
          IconButton(
            tooltip: isFavorite ? 'Remove favorite' : 'Add favorite',
            onPressed: () => appState.toggleFavorite(project),
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(project.imagePath, fit: BoxFit.cover),
          ),
          const SizedBox(height: 20),
          Text(
            project.title,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 6),
          Text(project.year),
          const SizedBox(height: 16),
          Text(project.description),
          const SizedBox(height: 18),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final skill in project.skills) Chip(label: Text(skill)),
            ],
          ),
          const SizedBox(height: 22),
          FilledButton.icon(
            onPressed: () =>
                LinkLauncherService.openUrl(context, project.githubUrl),
            icon: const Icon(Icons.code),
            label: const Text('Open GitHub'),
          ),
          if (project.liveDemoUrl != null) ...[
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () =>
                  LinkLauncherService.openUrl(context, project.liveDemoUrl!),
              icon: const Icon(Icons.open_in_new),
              label: const Text('Open Live Demo'),
            ),
          ],
        ],
      ),
    );
  }
}
