import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/portfolio_note.dart';

class LocalStorageService {
  static const String _themeModeKey = 'theme_mode';
  static const String _favoriteProjectsKey = 'favorite_projects';
  static const String _notesKey = 'portfolio_notes';

  Future<void> saveThemeMode(String themeMode) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_themeModeKey, themeMode);
  }

  Future<String?> loadThemeMode() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_themeModeKey);
  }

  Future<void> saveFavoriteProjects(List<String> projectTitles) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setStringList(_favoriteProjectsKey, projectTitles);
  }

  Future<List<String>> loadFavoriteProjects() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getStringList(_favoriteProjectsKey) ?? <String>[];
  }

  Future<void> saveNotes(List<PortfolioNote> notes) async {
    final preferences = await SharedPreferences.getInstance();
    final encodedNotes = notes
        .map((note) => jsonEncode(note.toJson()))
        .toList();
    await preferences.setStringList(_notesKey, encodedNotes);
  }

  Future<List<PortfolioNote>> loadNotes() async {
    final preferences = await SharedPreferences.getInstance();
    final encodedNotes = preferences.getStringList(_notesKey) ?? <String>[];

    return encodedNotes.map((encodedNote) {
      final json = jsonDecode(encodedNote) as Map<String, dynamic>;
      return PortfolioNote.fromJson(json);
    }).toList();
  }
}
