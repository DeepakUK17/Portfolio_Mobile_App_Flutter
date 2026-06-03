import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/app_state.dart';
import '../utils/app_constants.dart';
import 'certificates_screen.dart';
import 'contact_screen.dart';
import 'home_screen.dart';
import 'projects_screen.dart';
import 'settings_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ProjectsScreen(),
    CertificatesScreen(),
    ContactScreen(),
    SettingsScreen(),
  ];

  final List<String> _titles = const [
    'Home',
    'Projects',
    'Certificates',
    'Contact',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    final useRail = MediaQuery.sizeOf(context).width >= 760;
    final themeMode = context.watch<AppState>().themeMode;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedIndex == 0 ? AppConstants.appTitle : _titles[_selectedIndex],
        ),
        actions: [
          IconButton(
            tooltip: 'Switch theme',
            onPressed: () => _toggleTheme(context, themeMode),
            icon: Icon(_themeIcon(themeMode)),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Row(
        children: [
          if (useRail)
            NavigationRail(
              selectedIndex: _selectedIndex,
              labelType: NavigationRailLabelType.all,
              onDestinationSelected: _selectPage,
              destinations: _destinations
                  .map(
                    (destination) => NavigationRailDestination(
                      icon: Icon(destination.icon),
                      selectedIcon: Icon(destination.selectedIcon),
                      label: Text(destination.label),
                    ),
                  )
                  .toList(),
            ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: KeyedSubtree(
                key: ValueKey(_selectedIndex),
                child: _screens[_selectedIndex],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: useRail
          ? null
          : NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: _selectPage,
              destinations: [
                for (final destination in _destinations)
                  NavigationDestination(
                    icon: Icon(destination.icon),
                    selectedIcon: Icon(destination.selectedIcon),
                    label: destination.label,
                  ),
              ],
            ),
    );
  }

  void _selectPage(int index) {
    setState(() => _selectedIndex = index);
  }

  IconData _themeIcon(ThemeMode themeMode) {
    return switch (themeMode) {
      ThemeMode.light => Icons.light_mode_outlined,
      ThemeMode.dark => Icons.dark_mode_outlined,
      ThemeMode.system => Icons.brightness_auto_outlined,
    };
  }

  Future<void> _toggleTheme(BuildContext context, ThemeMode themeMode) async {
    final nextMode = switch (themeMode) {
      ThemeMode.system => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.light,
      ThemeMode.light => ThemeMode.system,
    };

    await context.read<AppState>().setThemeMode(nextMode);
  }
}

class _NavItem {
  const _NavItem(this.label, this.icon, this.selectedIcon);

  final String label;
  final IconData icon;
  final IconData selectedIcon;
}

const List<_NavItem> _destinations = [
  _NavItem('Home', Icons.home_outlined, Icons.home),
  _NavItem('Projects', Icons.work_outline, Icons.work),
  _NavItem(
    'Certificates',
    Icons.workspace_premium_outlined,
    Icons.workspace_premium,
  ),
  _NavItem('Contact', Icons.mail_outline, Icons.mail),
  _NavItem('Settings', Icons.settings_outlined, Icons.settings),
];
