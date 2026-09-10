// HANDLES THE LIGHT/DARK THEME TOGGLE STATE AND PERSISTENCE
// This file does not have an opinion on typography, spacing, colors, etc.; it just defines the theme mode state & persistence.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light) {
    _load();
  }

  void _load() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool("isDark") ?? false;
    state = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void toggle() async {
    final prefs = await SharedPreferences.getInstance();
    final newMode = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    state = newMode;
    prefs.setBool("isDark", newMode == ThemeMode.dark);
  }
}
