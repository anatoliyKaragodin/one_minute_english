import 'package:one_minute_english/src/repo/model/my_theme.dart';
import 'package:one_minute_english/src/repo/model/words.dart';
import 'package:one_minute_english/src/utils/app_language/app_language.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/library.dart';

class WordsConstants {
  static const themesImgs = [
    'assets/ui_images/levels_and_themes/select_all.png',
    'assets/ui_images/levels_and_themes/lvl_A1.png',
    'assets/ui_images/levels_and_themes/lvl_A2.png',
    'assets/ui_images/levels_and_themes/lvl_B1.png',
    'assets/ui_images/levels_and_themes/lvl_B2.png',
    'assets/ui_images/levels_and_themes/food.png',
    'assets/ui_images/levels_and_themes/professions.png',
    'assets/ui_images/levels_and_themes/clothe.png',
    'assets/ui_images/levels_and_themes/sport.png',
    'assets/ui_images/levels_and_themes/family.png',
    'assets/ui_images/levels_and_themes/home.png',
    'assets/ui_images/levels_and_themes/city.png',
    'assets/ui_images/levels_and_themes/colors.png',
    'assets/ui_images/levels_and_themes/trips.png',
    'assets/ui_images/levels_and_themes/countries.png',
    'assets/ui_images/levels_and_themes/weather.png',
    'assets/ui_images/levels_and_themes/months.png',
    'assets/ui_images/levels_and_themes/animals.png',
  ];
  final colors = [
    MyColors.greenColor,
    MyColors.orangeColor,
    MyColors.blueColor,
    MyColors.pinkColor
  ];
  late final List<Color> themeColors;
  late final List<MyTheme> allThemes;

  WordsConstants() {
    themeColors = [
      colors[0],
      colors[1],
      colors[2],
      colors[0],
      colors[3],
      colors[2],
      colors[3],
      colors[1],
      colors[0],
      colors[1],
      colors[2],
      colors[3],
      colors[1],
      colors[0],
      colors[2],
      colors[3],
      colors[1],
      colors[0],
    ];
  }

  final themesLabels = [
    '',
    'Beginner',
    'Elementary',
    'Intermediate',
    'Upper-Intermediate',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  List<MyTheme> initializeThemesList() {
    List<MyTheme> list = [];
    list = List<MyTheme>.generate(18, (index) {
      return MyTheme(
        label: themesLabels[index],
        color: themeColors[index],
        imgPath: themesImgs[index],
        allWordsCount: 200,
        learnedWords: 0,
      );
    });
    return list;
  }

  final initState = const Words(
    words: [],
    selectedToLearn: [],
    alreadyKnown: [],
    selectedThemes: [],
    allThemes: [],
    currentWord: 0,
    currentLearningWordIndex: 0,
    currentTrainingPage: 0,
    selectedWordIndex: 100,
    inputWordLetterList: [],
    repaeting: [],
    difficult: []
  );

}
