import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../models/project.dart';
import '../widgets/project_card.dart';
import '../widgets/responsive_page.dart';
import '../widgets/section_header.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  String _query = '';
  String _selectedSkill = 'All';

  List<String> get _skills {
    final values =
        PortfolioData.projects
            .expand((project) => project.skills)
            .toSet()
            .toList()
          ..sort();

    return ['All', ...values];
  }

  List<Project> get _filteredProjects {
    return PortfolioData.projects.where((project) {
      final query = _query.trim().toLowerCase();
      final matchesSearch =
          query.isEmpty ||
          project.title.toLowerCase().contains(query) ||
          project.description.toLowerCase().contains(query) ||
          project.skills.any((skill) => skill.toLowerCase().contains(query));

      final matchesSkill =
          _selectedSkill == 'All' || project.skills.contains(_selectedSkill);

      return matchesSearch && matchesSkill;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final crossAxisCount = width >= 920 ? 2 : 1;
    final projects = _filteredProjects;

    return ResponsivePage(
      children: [
        const SectionHeader(
          title: 'Projects',
          subtitle: 'Search, filter, favorite, and open project details.',
        ),
        TextField(
          onChanged: (value) => setState(() => _query = value),
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search projects by name, skill, or description',
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (final skill in _skills) ...[
                ChoiceChip(
                  label: Text(skill),
                  selected: _selectedSkill == skill,
                  onSelected: (_) => setState(() => _selectedSkill = skill),
                ),
                const SizedBox(width: 8),
              ],
            ],
          ),
        ),
        const SizedBox(height: 18),
        if (projects.isEmpty)
          const Card(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Center(child: Text('No projects matched your search.')),
            ),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: width >= 920 ? 0.92 : 0.82,
            ),
            itemBuilder: (context, index) {
              return ProjectCard(project: projects[index]);
            },
          ),
      ],
    );
  }
}
