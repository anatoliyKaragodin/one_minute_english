import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/training_words_repaet_or_new_learn.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/transitions/my_transitions.dart';

class MainMenuEducationController {
  static onTapLearnNewWords(BuildContext context) {
    MyPageTransitions.slideTransition(
        context, const TrainingWordsRepeatOrNewWordsLearn());
  }
}
