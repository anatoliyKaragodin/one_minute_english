import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_minute_english/src/screens/subscrubtion_screen/model/subscription_sceen.dart';

class SubscriptionScreenModel extends StateNotifier<SubscriptionScreen> {
  SubscriptionScreenModel()
      : super(const SubscriptionScreen(chosenSubIndex: 0));

  void setSubIndex(int index) {
    state = state.copyWith(chosenSubIndex: index);
  }
}
