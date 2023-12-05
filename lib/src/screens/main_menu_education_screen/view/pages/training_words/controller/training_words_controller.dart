import 'package:one_minute_english/src/repo/model/words_controller.dart';
import 'package:one_minute_english/src/screens/main_app_menu_screen/view/main_app_menu_screen_view.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/select_words_to_learn_page/view/select_words_to_learn.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/my_virtual_keyboard/controller/my_keyboard_controller.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/my_virtual_keyboard/view/widgets/input_word_result_dialog.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/training_complete_page.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/training_word_by_theme_complete.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/training_words_translation_result._dialog.dart';
import 'package:one_minute_english/src/screens/start_screen/controller/start_screen_controller.dart';
import 'package:one_minute_english/src/utils/app_language/app_language.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/transitions/my_transitions.dart';

class TrainingWordsController {
  static void onTapTranslation(
      BuildContext context, int index, int currentWordIndex, WidgetRef ref) {
    ref.read(wordsProvider.notifier).setSelectedWordIndex(index);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return TrainingWordsTranslationResultDialog(
            answerIndex: currentWordIndex,
            yourIndex: index,
          );
        });
  }

  static void onTapCloseButton(BuildContext context) {
    MyPageTransitions.slideTransition(context, const MainAppMenuScreenView());
  }

  static void onTapStartTrainingNewWords(BuildContext context, WidgetRef ref) {
    MyPageTransitions.slideTransition(context, const SelectWordsToLearnPage());
  }

  static void onTapNextButton(WidgetRef ref, BuildContext context) {
    final words = ref.read(wordsProvider);

    final pageIndex = words.currentTrainingPage;
    final currentWord = words.selectedToLearn[words.currentLearningWordIndex];
    debugPrint('PAGE INDEX: $pageIndex');
    debugPrint('WORD INDEX: ${words.currentLearningWordIndex}');

    /// Read words page
    if (pageIndex == 0) {
      ref.read(wordsProvider.notifier).setNextPageIndex();
    }

    /// Select translation page
    else if (pageIndex == 1) {
    }

    /// Select sound translation
    else if (pageIndex == 2) {
      final isRightAnswer =
          words.selectedWordIndex == words.currentLearningWordIndex;
      if (!isRightAnswer) {
        ref.read(wordsProvider.notifier).setWordIsLearnedFlag(false);
      }
      ref.read(wordsProvider.notifier).setNextPageIndex();
    }

    /// Input translation page
    else if (pageIndex == 3) {
      final keyboardWord = ref.read(keyboardProvider).inputWord;
      final currentWord =
          words.selectedToLearn[words.currentLearningWordIndex].word;
      debugPrint(keyboardWord);
      debugPrint(currentWord);

      final isRightAnswer = currentWord.toLowerCase().trimLeft().trimRight() ==
          keyboardWord.toLowerCase().trimLeft().trimRight();
      if (!isRightAnswer) {
        ref.read(wordsProvider.notifier).setWordIsLearnedFlag(false);
      }

      /// New word or complete training
      if (words.currentLearningWordIndex < words.selectedToLearn.length - 1) {
        ref.read(wordsProvider.notifier).setNextCurrentLearningWordIndex();
        ref.read(wordsProvider.notifier).resetNextPageIndexToOne();
        ref.read(keyboardProvider.notifier).resetAll();
      } else {
        ref.read(keyboardProvider.notifier).resetAll();

        MyPageTransitions.slideTransition(
            context, const TrainingWordByThemeComplete());
      }
    }

    ///
  }

  static void onTapContinueButton(
      WidgetRef ref, BuildContext context, bool isRightAnswer) {
    Navigator.pop(context);
    if (!isRightAnswer) {
      ref.read(wordsProvider.notifier).setWordIsLearnedFlag(false);
    }
    ref.read(wordsProvider.notifier).setSelectedWordIndex(100);
    ref.read(wordsProvider.notifier).setNextPageIndex();
  }

  static void onTapNextInComplWordsByTheme(BuildContext context) {
    MyPageTransitions.slideTransition(context, const TrainingComplete());
  }

  static void onTapCompleteTraining(BuildContext context, WidgetRef ref) {
    ref.read(wordsProvider.notifier).resetSelectedToLearnWordsList();
    ref.read(wordsProvider.notifier).resetCurrentPageIndex();
    ref.read(wordsProvider.notifier).resetCurrentWord();
    ref.read(wordsProvider.notifier).resetCurrentWordToLearnIndex();
    MyPageTransitions.slideTransition(context, const MainAppMenuScreenView());
  }

  static void onSelectSoundTranslation(int index, WidgetRef ref) {
    debugPrint('SELECTED INDEX: $index');
    ref.read(wordsProvider.notifier).setSelectedWordIndex(index);
  }
}
