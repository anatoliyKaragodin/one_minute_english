import 'package:one_minute_english/src/repo/model/word.dart';
import 'package:one_minute_english/src/repo/model/words.dart';
import 'package:one_minute_english/src/repo/model/words_model.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/training_words_view.dart';
import 'package:one_minute_english/src/screens/main_menu_settings/controller/settings_controller.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/transitions/my_transitions.dart';

final wordsProvider = StateNotifierProvider<WordsModel, Words>((ref) {
  return WordsModel();
});

class WordsController {
  static const numberOfWords = [4, 8, 10, 15, 20, 30];

  static void addAlreadyKnowWord(WidgetRef ref, Word word) {
    ref.read(wordsProvider.notifier).addAlreadyKnownWord(word);
  }

  static void addToLearnWord(WidgetRef ref, Word word, BuildContext context) {
    final words = ref.read(wordsProvider);
    final settings = ref.watch(settingsProvider);
    if (words.selectedToLearn.length <
        numberOfWords[settings.wordsNumberIndex]) {
      final isLastWord =words.selectedToLearn.length -
          numberOfWords[settings.wordsNumberIndex] ==
          -1;
      if (isLastWord) {
        MyPageTransitions.slideTransition(context, const TrainingWordsView());
      }
      ref.read(wordsProvider.notifier).addToLearnWord(word, isLastWord);
    }
  }
}
