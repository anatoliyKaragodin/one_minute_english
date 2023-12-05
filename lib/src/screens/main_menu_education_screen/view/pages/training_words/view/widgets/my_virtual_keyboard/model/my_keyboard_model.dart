import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/my_virtual_keyboard/model/my_keyboard.dart';
import 'package:one_minute_english/src/utils/library.dart';

class MyVirtualKeyboardModel extends StateNotifier<MyKeyboard> {
  MyVirtualKeyboardModel()
      : super(const MyKeyboard(
            inputWord: '', inputWordLettersList: [], inputWordLetterIndex: []));

  void addLetter(String letter, int letterIndex) {
    List<String> newLetterList = List.from(state.inputWordLettersList);
    newLetterList.add(letter);
    addLetterIndex(letterIndex);
    state = state.copyWith(inputWordLettersList: newLetterList);
    updateStringInputWord();
  }

  void addLetterIndex(int index) {
    List<int> newLetterIndexList = List.from(state.inputWordLetterIndex);
    newLetterIndexList.add(index);
    state = state.copyWith(inputWordLetterIndex: newLetterIndexList);
  }

  void removeLetter() {
    List<String> newLetterList = List.from(state.inputWordLettersList);
    if (newLetterList.isNotEmpty) {
      newLetterList.removeLast();
      state = state.copyWith(inputWordLettersList: newLetterList);
      removeLetterIndex();
      updateStringInputWord();
    }
  }

  void removeLetterIndex() {
    List<int> newLetterIndexList = List.from(state.inputWordLetterIndex);
    newLetterIndexList.removeLast();
    state = state.copyWith(inputWordLetterIndex: newLetterIndexList);
  }

  void addSpace() {
    List<String> newLetterList = List.from(state.inputWordLettersList);
    if (newLetterList.last != '') {
      newLetterList.add('');
      state = state.copyWith(inputWordLettersList: newLetterList);
      updateStringInputWord();
    }
  }

  void updateStringInputWord() {
    var wordList = state.inputWordLettersList;
    var stringWord = wordList.join('');
    debugPrint('INPUT WORD IN MODEL: $stringWord');
    state = state.copyWith(inputWord: stringWord);
  }

  void resetAll() {
    state = const MyKeyboard(
        inputWord: '', inputWordLettersList: [], inputWordLetterIndex: []);
  }
}
