import 'package:one_minute_english/src/repo/shared_preferences/shared_preferences.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/screens/start_screen/model/start_screen.dart';

class StartScreenModel extends StateNotifier<StartScreen> {
  StartScreenModel()
      : super(const StartScreen(
            logoOpacity: 0,
            nextButtonOpacity: 0,
            chosenLanguageIndex: 1,
            startPageIndex: 0,
            pageOpacity: 0)) {
    initState();
  }

  void initState() async {
    loadChosenLanguage();
    await Future.delayed(const Duration(milliseconds: 500));
    changeLogoOpacity();
    await Future.delayed(const Duration(milliseconds: 3000));
    changeLogoOpacity();
    await Future.delayed(const Duration(milliseconds: 500));
    changePageOpacity();
    await Future.delayed(const Duration(milliseconds: 500));
    changeNextButtonOpacity();
  }

  void changeLogoOpacity() {
    double logoOpacity = state.logoOpacity == 0 ? 1 : 0;
    state = state.copyWith(logoOpacity: logoOpacity);
  }

  void changePageOpacity() {
    double pageOpacity = state.pageOpacity == 0 ? 1 : 0;
    state = state.copyWith(pageOpacity: pageOpacity);
  }

  void setChosenLangIndex(int index) {
    state = state.copyWith(chosenLanguageIndex: index);
    SharPrefs().saveSelectedLanguage(index);
  }

  void increasePageIndex() {
    state = state.copyWith(startPageIndex: state.startPageIndex + 1);
  }

  void changeNextButtonOpacity() {
    double nextButtonOpacity = state.nextButtonOpacity == 0 ? 1 : 0;
    state = state.copyWith(nextButtonOpacity: nextButtonOpacity);
  }

  void loadChosenLanguage() async {
    var chosenLangIndex = await SharPrefs().loadSelectedLanguage();
    state = state.copyWith(chosenLanguageIndex: chosenLangIndex);
  }
}
