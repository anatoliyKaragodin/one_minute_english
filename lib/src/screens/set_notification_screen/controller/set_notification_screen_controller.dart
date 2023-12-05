import 'package:one_minute_english/src/screens/set_notification_screen/model/set_notification_screen.dart';
import 'package:one_minute_english/src/screens/set_notification_screen/model/set_notification_screen_model.dart';
import 'package:one_minute_english/src/screens/subscrubtion_screen/view/subscribtion_screen_view.dart';
import 'package:one_minute_english/src/services/notifications_service.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/transitions/my_transitions.dart';

final setNotificationProvider =
    StateNotifierProvider<SetNotificationScreenModel, SetNotificationScreen>(
        (ref) {
  return SetNotificationScreenModel();
});

class SetNotificationScreenController {
  static void onSetTime(WidgetRef ref, String time) {
    String firstTwoDigits = time.substring(0, 2);
    String lastTwoDigits = time.substring(3);

    int hours = int.parse(firstTwoDigits);
    int minutes = int.parse(lastTwoDigits);
    ref.read(setNotificationProvider.notifier).setTime(hours, minutes);
  }

  static onTapNextButton(WidgetRef ref, BuildContext context) async {
    MyPageTransitions.slideTransition(context, const SubscriptionScreenView());
    final time = ref.read(setNotificationProvider);
    NotificationsService().scheduleNotification(time.hours, time.minutes);
  }
}
