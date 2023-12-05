import 'package:shared_preferences/shared_preferences.dart';

class SharPrefs {
  Future<void> saveSelectedLanguage(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selectedLanguageIndex', value);
  }

  Future<int> loadSelectedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('selectedLanguageIndex') ?? 1;
  }

  Future<void> saveSelectedThemes(List<int> listOfSelectedThemes) async {
    final prefs = await SharedPreferences.getInstance();
    final stringList =
        listOfSelectedThemes.map((themeId) => themeId.toString()).toList();
    await prefs.setStringList('selectedThemes', stringList);
  }

  Future<List<int>> loadSelectedThemes() async {
    final prefs = await SharedPreferences.getInstance();
    final stringList = prefs.getStringList('selectedThemes') ?? [];
    final listOfSelectedThemes =
        stringList.map((theme) => int.parse(theme)).toList();
    return listOfSelectedThemes;
  }

  Future<void> saveSkipStartScreen(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('skipStartScreen', value);
  }

  Future<bool> loadSkipStartScreen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('skipStartScreen') ?? false;
  }

  Future<void> saveLevelIsSelected(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('levelIsSelected', value);
  }

  Future<bool> loadLevelIsSelected() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('levelIsSelected') ?? false;
  }
}
