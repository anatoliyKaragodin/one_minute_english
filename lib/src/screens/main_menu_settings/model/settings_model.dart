import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:one_minute_english/src/screens/main_menu_settings/model/settings.dart';

class SettingsModel extends StateNotifier<Settings> {
  SettingsModel()
      : super(Settings(
            listeningOn: true,
            pronunciationOn: true,
            answerSoundOn: true,
            rating: 5,
            notificationsIsOn: true,
            pageIndex: 0,
            wordsNumberIndex: 0,
            currentDate: Jiffy.now(),
            selectedDate: Jiffy.now())) {
    initState();
  }

  void initState() {}

  void changeTrainingsSettings(int index) {
    if (index == 0) {
      state = state.copyWith(listeningOn: !state.listeningOn);
    } else if (index == 1) {
      state = state.copyWith(pronunciationOn: !state.pronunciationOn);
    } else {
      state = state.copyWith(answerSoundOn: !state.answerSoundOn);
    }
  }

  void setRating(int rating) {
    state = state.copyWith(rating: rating);
  }

  void changeNotificationsIsOn() {
    state = state.copyWith(notificationsIsOn: !state.notificationsIsOn);
  }

  void setPageIndex(int pageIndex) {
    state = state.copyWith(pageIndex: pageIndex);
  }

  void setWordsNumberIndex(int index) {
    state = state.copyWith(wordsNumberIndex: index);
  }
}
