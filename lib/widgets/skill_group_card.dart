import 'package:flutter/material.dart';

class SkillGroupCard extends StatelessWidget {
  const SkillGroupCard({super.key, required this.title, required this.skills});

  final String title;
  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      color: colorScheme.surfaceContainerHigh,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final skill in skills)
                  Chip(
                    label: Text(skill),
                    avatar: Icon(
                      Icons.check_circle_outline,
                      color: colorScheme.primary,
                      size: 18,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
