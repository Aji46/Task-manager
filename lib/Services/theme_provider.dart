import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(_loadTheme());

  static ThemeMode _loadTheme() {
    final box = Hive.box('settings');
    bool isDarkMode = box.get('isDarkMode', defaultValue: false);
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() {
    final box = Hive.box('settings');
    if (state == ThemeMode.light) {
      state = ThemeMode.dark;
      box.put('isDarkMode', true);
    } else {
      state = ThemeMode.light;
      box.put('isDarkMode', false);
    }
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});
