import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/app_shell.dart';
import 'services/app_state.dart';
import 'services/local_storage_service.dart';
import 'utils/app_constants.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.appState});

  final AppState? appState;

  @override
  Widget build(BuildContext context) {
    final providedState = appState;

    if (providedState != null) {
      return ChangeNotifierProvider<AppState>.value(
        value: providedState,
        child: const _PortfolioApp(),
      );
    }

    return ChangeNotifierProvider<AppState>(
      create: (_) {
        final state = AppState(LocalStorageService());
        unawaited(state.load());
        return state;
      },
      child: const _PortfolioApp(),
    );
  }
}

class _PortfolioApp extends StatelessWidget {
  const _PortfolioApp();

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<AppState>().themeMode;

    return MaterialApp(
      title: AppConstants.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeMode,
      home: const AppShell(),
    );
  }
}
