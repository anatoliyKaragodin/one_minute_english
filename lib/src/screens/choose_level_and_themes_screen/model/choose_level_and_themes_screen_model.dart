import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_minute_english/src/repo/shared_preferences/shared_preferences.dart';
import 'package:one_minute_english/src/screens/choose_level_and_themes_screen/model/choose_level_and_themes.dart';

class ChooseLevelAndThemesScreenModel
    extends StateNotifier<ChooseLevelAndThemes> {
  ChooseLevelAndThemesScreenModel()
      : super(const ChooseLevelAndThemes(
            listOfSelectedThemes: [],
            levelIsSelected: false,
            skipStartScreen: false)) {
    initState();
  }

  void initState() async {
    var listOfThemes = await SharPrefs().loadSelectedThemes();
    var levelIsSelected = await SharPrefs().loadLevelIsSelected();
    var skipStartScreen = await SharPrefs().loadSkipStartScreen();
    state = state.copyWith(
        listOfSelectedThemes: listOfThemes,
        levelIsSelected: levelIsSelected,
        skipStartScreen: skipStartScreen);
  }

  void setThemesList(List<int> listOfThemes) {
    state = state.copyWith(listOfSelectedThemes: listOfThemes);
    SharPrefs().saveSelectedThemes(listOfThemes);
  }
}
