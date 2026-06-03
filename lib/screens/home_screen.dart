import 'dart:async';

import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../services/link_launcher_service.dart';
import '../utils/app_constants.dart';
import '../widgets/info_tile.dart';
import '../widgets/responsive_page.dart';
import '../widgets/section_header.dart';
import '../widgets/skill_group_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _roleIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      setState(() {
        _roleIndex = (_roleIndex + 1) % PortfolioData.roles.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isWide = width >= 760;

    return ResponsivePage(
      children: [
        _HeroSection(roleIndex: _roleIndex, isWide: isWide),
        const SizedBox(height: 24),
        _StatsGrid(isWide: isWide),
        const SizedBox(height: 28),
        const SectionHeader(
          title: 'About',
          subtitle: 'A quick introduction from the original portfolio.',
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Text(
              PortfolioData.about,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
        const SizedBox(height: 28),
        const SectionHeader(title: 'Skills'),
        _SkillsGrid(isWide: isWide),
        const SizedBox(height: 28),
        const SectionHeader(title: 'Achievements'),
        _AchievementsList(isWide: isWide),
        const SizedBox(height: 28),
        const SectionHeader(title: 'Education'),
        const _EducationList(),
      ],
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({required this.roleIndex, required this.isWide});

  final int roleIndex;
  final bool isWide;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final textBlock = Column(
      crossAxisAlignment: isWide
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          AppConstants.fullName,
          textAlign: isWide ? TextAlign.start : TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 8),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          child: Chip(
            key: ValueKey(roleIndex),
            avatar: const Icon(Icons.auto_awesome, size: 18),
            label: Text(PortfolioData.roles[roleIndex]),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          PortfolioData.summary,
          textAlign: isWide ? TextAlign.start : TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 18),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: isWide ? WrapAlignment.start : WrapAlignment.center,
          children: [
            FilledButton.icon(
              onPressed: () => LinkLauncherService.openUrl(
                context,
                'mailto:${AppConstants.email}',
              ),
              icon: const Icon(Icons.handshake_outlined),
              label: const Text('Hire Me'),
            ),
            OutlinedButton.icon(
              onPressed: () =>
                  LinkLauncherService.openUrl(context, AppConstants.cvUrl),
              icon: const Icon(Icons.file_download_outlined),
              label: const Text('Download CV'),
            ),
          ],
        ),
      ],
    );

    final imageBlock = Center(
      child: Container(
        width: isWide ? 230 : 170,
        height: isWide ? 230 : 170,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: colorScheme.primary, width: 4),
          boxShadow: [
            BoxShadow(
              color: colorScheme.primary.withValues(alpha: 0.22),
              blurRadius: 30,
              offset: const Offset(0, 18),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(PortfolioData.profileImage, fit: BoxFit.cover),
      ),
    );

    final content = isWide
        ? [
            Expanded(flex: 3, child: textBlock),
            const SizedBox(width: 28),
            Expanded(flex: 2, child: imageBlock),
          ]
        : [imageBlock, const SizedBox(height: 24), textBlock];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(8),
      ),
      child: isWide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: content,
            )
          : Column(children: content),
    );
  }
}

class _StatsGrid extends StatelessWidget {
  const _StatsGrid({required this.isWide});

  final bool isWide;

  @override
  Widget build(BuildContext context) {
    final tiles = [
      const InfoTile(title: 'Projects', value: '9', icon: Icons.work_outline),
      const InfoTile(
        title: 'Certificates',
        value: '30',
        icon: Icons.workspace_premium_outlined,
      ),
      const InfoTile(
        title: 'Education',
        value: '4',
        icon: Icons.school_outlined,
      ),
      const InfoTile(
        title: 'Achievements',
        value: '4',
        icon: Icons.emoji_events_outlined,
      ),
    ];

    return GridView.builder(
      itemCount: tiles.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isWide ? 4 : 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 112,
      ),
      itemBuilder: (context, index) => tiles[index],
    );
  }
}

class _SkillsGrid extends StatelessWidget {
  const _SkillsGrid({required this.isWide});

  final bool isWide;

  @override
  Widget build(BuildContext context) {
    final skillGroups = PortfolioData.skills.entries.toList();

    if (isWide) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final entry in skillGroups) ...[
            Expanded(
              child: SkillGroupCard(title: entry.key, skills: entry.value),
            ),
            if (entry != skillGroups.last) const SizedBox(width: 12),
          ],
        ],
      );
    }

    return Column(
      children: [
        for (final entry in skillGroups) ...[
          SkillGroupCard(title: entry.key, skills: entry.value),
          if (entry != skillGroups.last) const SizedBox(height: 12),
        ],
      ],
    );
  }
}

class _AchievementsList extends StatelessWidget {
  const _AchievementsList({required this.isWide});

  final bool isWide;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: PortfolioData.achievements.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isWide ? 2 : 1,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 132,
      ),
      itemBuilder: (context, index) {
        final achievement = PortfolioData.achievements[index];
        return Card(
          child: ListTile(
            leading: const Icon(Icons.emoji_events_outlined),
            title: Text(achievement.title),
            subtitle: Text(achievement.description),
            trailing: Text(achievement.year),
          ),
        );
      },
    );
  }
}

class _EducationList extends StatelessWidget {
  const _EducationList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final education in PortfolioData.education) ...[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    education.institution,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text('${education.course} | ${education.duration}'),
                  const SizedBox(height: 6),
                  Text(
                    education.grade,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 8),
                  Text(education.description),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}
