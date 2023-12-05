import 'package:one_minute_english/src/screens/main_app_menu_screen/view/main_app_menu_screen_view.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/transitions/my_transitions.dart';
class SelectWordsController {
  static void onTapCloseButton(BuildContext context) {
    MyPageTransitions.slideTransition(context, const MainAppMenuScreenView());
  }

}