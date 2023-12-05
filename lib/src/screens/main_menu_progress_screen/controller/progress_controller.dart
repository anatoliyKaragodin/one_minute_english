import 'package:one_minute_english/src/repo/model/word.dart';
import 'package:one_minute_english/src/screens/main_menu_progress_screen/model/progress.dart';
import 'package:one_minute_english/src/screens/main_menu_progress_screen/model/progress_model.dart';
import 'package:one_minute_english/src/screens/main_menu_progress_screen/view/pages/difficult_words/difficult_words_page.dart';
import 'package:one_minute_english/src/screens/main_menu_progress_screen/view/pages/difficult_words/widgets/difficult_words_dialog.dart';
import 'package:one_minute_english/src/screens/main_menu_progress_screen/view/widgets/my_schedule_dialog.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/transitions/my_transitions.dart';

final progressProvider = StateNotifierProvider<ProgressModel, Progress>((ref) {
  return ProgressModel();
});

class ProgressController {
  static void onTapDate(WidgetRef ref, int index) {
    ref.read(progressProvider.notifier).setDate(index);
  }

  static void onTapMoveMonth(WidgetRef ref, bool isForward) {
    ref.read(progressProvider.notifier).changeMonth(isForward);
  }

  static void onTapSchedule(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const MyScheduleDialog();
        });
  }

  static onTapNextInSchedule(BuildContext context) {
    Navigator.pop(context);
  }

  static void onTapDifficultWords(BuildContext context) {
    MyPageTransitions.slideTransition(context, const DifficultWordsView());
  }

  static void onTapDifficultWordDialog(
      WidgetRef ref, BuildContext context, Word word) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return DifficultWordDialog(word: word, themeLabel: 'Тема',);
        });
  }
}
