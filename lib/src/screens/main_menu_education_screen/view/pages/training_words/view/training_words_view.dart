import 'package:one_minute_english/src/repo/model/words_controller.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/controller/training_words_controller.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/my_virtual_keyboard/controller/my_keyboard_controller.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/training_words_keyboard_input.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/training_words_read_words_widget.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/training_words_select_translation_widget.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/training_words_sound_translation_widget.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/training_words_top_container.dart';
import 'package:one_minute_english/src/screens/main_menu_settings/controller/settings_controller.dart';
import 'package:one_minute_english/src/screens/start_screen/controller/start_screen_controller.dart';
import 'package:one_minute_english/src/utils/app_language/app_language.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_color_button.dart';

class TrainingWordsView extends ConsumerStatefulWidget {
  const TrainingWordsView({super.key});
  final route = 'training words page';

  @override
  ConsumerState createState() => _TrainingWordsViewState();
}

class _TrainingWordsViewState extends ConsumerState<TrainingWordsView> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final langIndex = ref.watch(startScreenProvider).chosenLanguageIndex;
    final lang = AppLanguage.listOfLanguages[langIndex];
    final words = ref.watch(wordsProvider);
    final settings = ref.watch(settingsProvider);
    final progress =
        (words.currentLearningWordIndex + words.currentTrainingPage / 3) /
            words.selectedToLearn.length;
    final keyboardWord = ref.watch(keyboardProvider).inputWord;
    debugPrint('--------------MAIN TRAINING PAGE INPUT WORD: $keyboardWord');
    bool showNextButton = false;
    if(words.currentTrainingPage == 0) {
      showNextButton = true;
    }
    else if (words.currentTrainingPage == 2 && words.selectedWordIndex != 100) {
      showNextButton = true;
    } else if (words.currentTrainingPage == 3 && keyboardWord.isNotEmpty) {
      showNextButton = true;
    }
    final centerWidgetsList = [
      TrainingWordsReadWordsWidget(
          text: lang[LangKey.readTheseWordsCarefully]!,
          listOfWords: words.selectedToLearn),
      TrainingWordsSelectTranslationWidget(
        listOfWords: words.selectedToLearn,
        text: lang[LangKey.selectTranslation]!,
        currentWordIndex: words.currentLearningWordIndex,
      ),
      TrainingWordsSoundTranslationWidget(
        listOfWords: words.selectedToLearn,
        text: lang[LangKey.chooseTranslationForWord]!,
        currentWordIndex: words.currentLearningWordIndex,
      ),
      TrainingWordsKeyboardInputWidget(
        word: words.selectedToLearn.isNotEmpty
            ? words.selectedToLearn[words.currentLearningWordIndex]
            : null,
      )
    ];

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TrainingWordsTopContainer(
            text: lang[LangKey.training]!,
            progress: progress <= 1 ? progress : 1,
          ),
          Expanded(child:
              PageView.builder(itemBuilder: (BuildContext context, int index) {
            return centerWidgetsList[words.currentTrainingPage];
          })),
          if (showNextButton)
            Padding(
              padding: EdgeInsets.only(bottom: myParameters.pixelHeight * 50),
              child: MyColorButtonWidget(
                  func: () {
                    {
                      TrainingWordsController.onTapNextButton(ref, context);
                    }
                  },
                  text: lang[LangKey.nextButton]!),
            )
        ],
      ),
    );
  }
}
