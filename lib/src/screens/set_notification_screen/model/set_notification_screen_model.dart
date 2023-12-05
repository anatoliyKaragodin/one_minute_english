import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_minute_english/src/screens/set_notification_screen/model/set_notification_screen.dart';

class SetNotificationScreenModel extends StateNotifier<SetNotificationScreen> {
  SetNotificationScreenModel()
      : super(const SetNotificationScreen(hours: 00, minutes: 00));

  void setTime(int hours, int minutes) {
    state = state.copyWith(hours: hours, minutes: minutes);
    debugPrint('${hours.toString()} ${minutes.toString()}');
  }
}
