import 'package:one_minute_english/src/repo/model/words_controller.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/select_words_to_learn_page/view/widgets/list_of_themes.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/select_words_to_learn_page/view/widgets/my_word_container.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/select_words_to_learn_page/view/widgets/top_close_and_selected_words.dart';
import 'package:one_minute_english/src/screens/main_menu_settings/controller/settings_controller.dart';
import 'package:one_minute_english/src/screens/start_screen/controller/start_screen_controller.dart';
import 'package:one_minute_english/src/utils/app_language/app_language.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_color_button.dart';

class SelectWordsToLearnPage extends ConsumerStatefulWidget {
  const SelectWordsToLearnPage({super.key});

  final route = 'select words to learn page';

  @override
  ConsumerState createState() => _SelectWordsToLearnPageState();
}

class _SelectWordsToLearnPageState
    extends ConsumerState<SelectWordsToLearnPage> {
  static const numberOfWords = [4, 8, 10, 15, 20, 30];
  final colors = [
    MyColors.greenColor,
    MyColors.orangeColor,
    MyColors.blueColor,
    MyColors.pinkColor
  ];

  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final langIndex = ref.watch(startScreenProvider).chosenLanguageIndex;
    final lang = AppLanguage.listOfLanguages[langIndex];
    final words = ref.watch(wordsProvider);
    final settings = ref.watch(settingsProvider);
    final listOfThemes = words.allThemes.sublist(5, words.allThemes.length);

    return Scaffold(
      body: words.words.isNotEmpty
          ? Column(
              children: [
                TopCloseAndSelectWords(
                  lang: lang,
                  wordsCount: words.selectedToLearn.length,
                  allWordsCount: numberOfWords[settings.wordsNumberIndex],
                ),
                ListOfThemes(
                    lang: lang,
                    wordsCount: words.selectedToLearn.length,
                    allWordsCount: numberOfWords[settings.wordsNumberIndex],
                    listOfThemes: listOfThemes,
                    listOfUsedThemes: words.selectedThemes),
                Padding(
                  padding: EdgeInsets.only(
                      top: myParameters.pixelHeight * 89,
                      bottom: myParameters.pixelHeight * 68),
                  child: MyWordContainer(
                    word: words.words[words.currentWord],
                    color: words.words[words.currentWord].color,
                    onlyWord: false,
                  ),
                ),
                SizedBox(
                  height: myParameters.pixelHeight * 138,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyColorButtonWidget(
                        func: () {
                          WordsController.addAlreadyKnowWord(
                              ref, words.words[words.currentWord]);
                        },
                        text: lang[LangKey.alreadyKnow]!,
                        color: MyColors.whiteColor,
                      ),
                      MyColorButtonWidget(
                          func: () {
                            WordsController.addToLearnWord(
                                ref, words.words[words.currentWord], context);
                          },
                          text: lang[LangKey.learn]!),
                    ],
                  ),
                )
              ],
            )
          : Container(),
    );
  }
}
