import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/my_virtual_keyboard/model/my_keyboard.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/my_virtual_keyboard/model/my_keyboard_model.dart';
import 'package:one_minute_english/src/utils/library.dart';

final keyboardProvider = StateNotifierProvider<MyVirtualKeyboardModel, MyKeyboard>((ref) {
  return MyVirtualKeyboardModel();
});


class MyKeyboardController {
  static void onTapLetter(WidgetRef ref, String letter, int letterIndex) {
    ref.read(keyboardProvider.notifier).addLetter(letter, letterIndex);
  }

  static void onTapRemoveLetter(WidgetRef ref) {
    ref.read(keyboardProvider.notifier).removeLetter();
  }

  static void onTapSpace(WidgetRef ref) {
    ref.read(keyboardProvider.notifier).addSpace();
  }
}