import 'package:one_minute_english/src/repo/model/words_controller.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/my_virtual_keyboard/controller/my_keyboard_controller.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_text_widget.dart';

class MyVirtualKeyboardView extends ConsumerStatefulWidget {
  const MyVirtualKeyboardView({super.key});

  @override
  ConsumerState<MyVirtualKeyboardView> createState() =>
      _MyVirtualKeyboardState();
}

class _MyVirtualKeyboardState extends ConsumerState<MyVirtualKeyboardView> {
  static const List<String> englishKeyboardLayout = [
    'q',
    'w',
    'e',
    'r',
    't',
    'y',
    'u',
    'i',
    'o',
    'p',
    'a',
    's',
    'd',
    'f',
    'g',
    'h',
    'j',
    'k',
    'l',
    'z',
    'x',
    'c',
    'v',
    'b',
    'n',
    'm'
  ];
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);

    final lettersRow1 = englishKeyboardLayout.sublist(0, 10);
    final lettersRow2 = englishKeyboardLayout.sublist(10, 19);
    final lettersRow3 = englishKeyboardLayout.sublist(19, 26);
    final keyboard = ref.watch(keyboardProvider);
    final words = ref.watch(wordsProvider);
    final String currentWord =
        words.selectedToLearn[words.currentLearningWordIndex].word;
    List<int> highlightLetters = [];
    final inputWordLetterIndex = keyboard.inputWordLetterIndex;

    for (int i = 0; i < currentWord.length; i++) {
      String currentLetter = currentWord[i];
      int letterIndex = englishKeyboardLayout.indexOf(currentLetter);
      if (letterIndex != -1) {
        highlightLetters.add(letterIndex);
      }
    }
    debugPrint(highlightLetters.toString());
    for (final element in inputWordLetterIndex) {
      if (highlightLetters.contains(element)) {
        highlightLetters.remove(element);
      }
    }
    debugPrint(highlightLetters.toString());

    final List<String> inputWord = [];
    return SizedBox(
        child: Column(
      children: [
        buildKeyboardLettersRow(lettersRow1, highlightLetters, 0),
        buildKeyboardLettersRow(lettersRow2, highlightLetters, 10),
        buildKeyboardLettersRow(lettersRow3, highlightLetters, 19),
        buildKeyBoardBottomRow(myParameters)
      ],
    ));
  }

  Padding buildKeyBoardBottomRow(MyParameters myParameters) {
    return Padding(
      padding: EdgeInsets.only(top: myParameters.pixelHeight * 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: myParameters.pixelWidth * 3),
            child: InkWell(
              onTap: () {
                MyKeyboardController.onTapSpace(ref);
              },
              child: Container(
                height: myParameters.pixelHeight * 42,
                width: myParameters.pixelWidth * 230,
                decoration: BoxDecoration(
                    color: MyColors.greyColor,
                    borderRadius:
                        BorderRadius.circular(myParameters.pixelWidth * 5)),
                child: const Center(child: MyTextWidget(text: 'space')),
              ),
            ),
          ),
          SizedBox(
            width: myParameters.pixelWidth * 47,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: myParameters.pixelWidth * 3),
            child: InkWell(
              onTap: () {
                MyKeyboardController.onTapRemoveLetter(ref);
              },
              child: Container(
                  height: myParameters.pixelHeight * 42,
                  width: myParameters.pixelWidth * 42,
                  decoration: BoxDecoration(
                      color: MyColors.greyColorDarkTheme,
                      borderRadius:
                          BorderRadius.circular(myParameters.pixelWidth * 5)),
                  child: Icon(
                    Icons.backspace_outlined,
                    size: myParameters.pixelWidth * 23,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Row buildKeyboardLettersRow(
      List<String> lettersRow1, List<int> highlightLetters, int indexShift) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          lettersRow1.length,
          (index) => InkWell(
              onTap: () {
                if (highlightLetters.contains(index + indexShift)) {
                  MyKeyboardController.onTapLetter(
                      ref,
                      englishKeyboardLayout[index + indexShift],
                      index + indexShift);
                }
              },
              child: MyKeyboardKey(
                  letter: lettersRow1[index],
                  isIlluminated:
                      highlightLetters.contains(index + indexShift)))),
    );
  }
}

class MyKeyboardKey extends StatelessWidget {
  final String letter;
  final bool isIlluminated;

  const MyKeyboardKey(
      {super.key, required this.letter, required this.isIlluminated});

  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: myParameters.pixelWidth * 3,
          vertical: myParameters.pixelHeight * 6),
      child: Container(
        width: myParameters.pixelWidth * 37,
        height: myParameters.pixelHeight * 34,
        decoration: BoxDecoration(
            color: isIlluminated ? MyColors.mainColor : MyColors.greyColor,
            borderRadius: BorderRadius.circular(myParameters.pixelWidth * 5)),
        child: Center(
          child: MyTextWidget(
            text: letter,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
