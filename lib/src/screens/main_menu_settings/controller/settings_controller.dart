import 'package:one_minute_english/src/screens/main_menu_settings/model/settings_model.dart';
import 'package:one_minute_english/src/utils/library.dart';

import '../model/settings.dart';

final settingsProvider = StateNotifierProvider<SettingsModel, Settings>((ref) {
  return SettingsModel();
});

class SettingsController {
  static void onTrainingsSwitchTap(WidgetRef ref, int index) {
    ref.read(settingsProvider.notifier).changeTrainingsSettings(index);
  }

  static onRatingTap(WidgetRef ref, int rating) {
    ref.read(settingsProvider.notifier).setRating(rating);
  }

  static onTapNotificationsSwitch(WidgetRef ref) {
    ref.read(settingsProvider.notifier).changeNotificationsIsOn();
  }

  static onTapIndexPage(WidgetRef ref, int index) {
    ref.read(settingsProvider.notifier).setPageIndex(index);
  }

  static void onTapWordsNumberIndex(WidgetRef ref, int index) {
    ref.read(settingsProvider.notifier).setWordsNumberIndex(index);
  }
}
