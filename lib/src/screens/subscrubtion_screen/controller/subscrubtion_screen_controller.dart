import 'package:one_minute_english/src/screens/main_app_menu_screen/view/main_app_menu_screen_view.dart';
import 'package:one_minute_english/src/screens/subscrubtion_screen/model/subscription_sceen.dart';
import 'package:one_minute_english/src/screens/subscrubtion_screen/model/subscription_screen_model.dart';
import 'package:one_minute_english/src/screens/subscrubtion_screen/view/widgets/subscription_dialog_widget.dart';
import 'package:one_minute_english/src/screens/subscrubtion_screen/view/subscription_screen_view_2.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/transitions/my_transitions.dart';

final subscriptionScreenProvider =
    StateNotifierProvider<SubscriptionScreenModel, SubscriptionScreen>((ref) {
  return SubscriptionScreenModel();
});

class SubscriptionScreenController {
  static onNextTapScreen1(BuildContext context) {
    MyPageTransitions.slideTransition(context, const SubscriptionScreenView2());
  }

  static void onTapCloseButton(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return const SubscriptionDialogWidget();
        });
  }

  static void onDialogTapCloseButton(BuildContext context) {
    Navigator.pop(context);
  }

  static void onSubTap(WidgetRef ref, int index) {
    ref.read(subscriptionScreenProvider.notifier).setSubIndex(index);
  }

  static onUse7daysTap(BuildContext context) {
    MyPageTransitions.slideTransition(context, const MainAppMenuScreenView());
  }
}
