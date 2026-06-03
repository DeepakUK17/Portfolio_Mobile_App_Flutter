import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/project.dart';
import '../screens/project_detail_screen.dart';
import '../services/app_state.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appState = context.watch<AppState>();
    final isFavorite = appState.isFavorite(project);

    return Card(
      clipBehavior: Clip.antiAlias,
      color: colorScheme.surfaceContainerHigh,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProjectDetailScreen(project: project),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(project.imagePath, fit: BoxFit.cover),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton.filledTonal(
                      tooltip: isFavorite
                          ? 'Remove from favorites'
                          : 'Add to favorites',
                      onPressed: () => appState.toggleFavorite(project),
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(project.year),
                  const SizedBox(height: 10),
                  Text(
                    project.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      for (final skill in project.skills.take(4))
                        Chip(label: Text(skill)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
