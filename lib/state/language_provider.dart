import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

final languageProvider = StateNotifierProvider<LanguageNotifier, String>((ref) {
  return LanguageNotifier();
});

class LanguageNotifier extends StateNotifier<String> {
  LanguageNotifier() : super("en") {
    _load();
  }

  void _load() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getString("lang") ?? "en";
  }

  void setLanguage(String lang) async {
    final prefs = await SharedPreferences.getInstance();
    state = lang;
    prefs.setString("lang", lang);
  }
}
