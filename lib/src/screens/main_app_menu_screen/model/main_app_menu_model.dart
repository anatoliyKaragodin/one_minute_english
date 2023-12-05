import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_minute_english/src/screens/main_app_menu_screen/model/main_app_menu.dart';

class MainAppMenuModel extends StateNotifier<MainAppMenu> {
  MainAppMenuModel() : super(const MainAppMenu(menuIndex: 0));

  void setMenuIndex(int index) {
    state = state.copyWith(menuIndex: index);
  }
}
