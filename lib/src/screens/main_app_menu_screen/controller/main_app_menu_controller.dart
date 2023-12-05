import 'package:one_minute_english/src/screens/main_app_menu_screen/model/main_app_menu.dart';
import 'package:one_minute_english/src/screens/main_app_menu_screen/model/main_app_menu_model.dart';
import 'package:one_minute_english/src/utils/library.dart';

final mainAppMenuProvider =
    StateNotifierProvider<MainAppMenuModel, MainAppMenu>((ref) {
  return MainAppMenuModel();
});

class MainAppMenuController {
  static void onTapMenuItem(WidgetRef ref, int index) {
    ref.read(mainAppMenuProvider.notifier).setMenuIndex(index);
  }
}
