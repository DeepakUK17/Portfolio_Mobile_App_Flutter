import 'package:flutter/material.dart';

import '../models/portfolio_note.dart';
import '../models/project.dart';
import 'local_storage_service.dart';

class AppState extends ChangeNotifier {
  AppState(this._storageService);

  final LocalStorageService _storageService;

  ThemeMode _themeMode = ThemeMode.system;
  Set<String> _favoriteProjectTitles = <String>{};
  List<PortfolioNote> _notes = <PortfolioNote>[];
  bool _isLoaded = false;

  ThemeMode get themeMode => _themeMode;
  Set<String> get favoriteProjectTitles => _favoriteProjectTitles;
  List<PortfolioNote> get notes => List.unmodifiable(_notes);
  bool get isLoaded => _isLoaded;

  Future<void> load() async {
    final savedThemeMode = await _storageService.loadThemeMode();
    final savedFavorites = await _storageService.loadFavoriteProjects();
    final savedNotes = await _storageService.loadNotes();

    _themeMode = _themeModeFromString(savedThemeMode);
    _favoriteProjectTitles = savedFavorites.toSet();
    _notes = savedNotes;
    _isLoaded = true;
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    _themeMode = themeMode;
    notifyListeners();
    await _storageService.saveThemeMode(themeMode.name);
  }

  bool isFavorite(Project project) {
    return _favoriteProjectTitles.contains(project.title);
  }

  Future<void> toggleFavorite(Project project) async {
    if (isFavorite(project)) {
      _favoriteProjectTitles.remove(project.title);
    } else {
      _favoriteProjectTitles.add(project.title);
    }

    notifyListeners();
    await _storageService.saveFavoriteProjects(_favoriteProjectTitles.toList());
  }

  Future<void> addNote(String title, String body) async {
    final now = DateTime.now();
    final note = PortfolioNote(
      id: now.microsecondsSinceEpoch.toString(),
      title: title,
      body: body,
      createdAt: now,
      updatedAt: now,
    );

    _notes = <PortfolioNote>[note, ..._notes];
    notifyListeners();
    await _storageService.saveNotes(_notes);
  }

  Future<void> updateNote(PortfolioNote note, String title, String body) async {
    _notes = _notes
        .map(
          (item) => item.id == note.id
              ? item.copyWith(
                  title: title,
                  body: body,
                  updatedAt: DateTime.now(),
                )
              : item,
        )
        .toList();

    notifyListeners();
    await _storageService.saveNotes(_notes);
  }

  Future<void> deleteNote(PortfolioNote note) async {
    _notes = _notes.where((item) => item.id != note.id).toList();
    notifyListeners();
    await _storageService.saveNotes(_notes);
  }

  ThemeMode _themeModeFromString(String? value) {
    return switch (value) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }
}
