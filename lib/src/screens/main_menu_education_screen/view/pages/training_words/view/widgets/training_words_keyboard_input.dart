import 'package:one_minute_english/src/repo/model/word.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/my_virtual_keyboard/controller/my_keyboard_controller.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/my_virtual_keyboard/view/my_virtual_keyboard_view.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_text_widget.dart';

class TrainingWordsKeyboardInputWidget extends ConsumerStatefulWidget {
  final Word? word;
  const TrainingWordsKeyboardInputWidget({super.key, this.word});

  @override
  ConsumerState<TrainingWordsKeyboardInputWidget> createState() =>
      _TrainingWordsKeyboardInputWidgetState();
}

class _TrainingWordsKeyboardInputWidgetState
    extends ConsumerState<TrainingWordsKeyboardInputWidget> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final List<String> inputWord =
        ref.watch(keyboardProvider).inputWordLettersList;
    return widget.word!=null?Column(
      children: [
        buildTranslationAndImgContainer(myParameters),
        buildWordGrid(myParameters, inputWord),
        const MyVirtualKeyboardView(),
      ],
    ):const SizedBox();
  }

  SizedBox buildWordGrid(MyParameters myParameters, List<String> inputWord) {
    return SizedBox(
      width: myParameters.width,
      height: myParameters.pixelHeight * 160,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: myParameters.pixelWidth * 20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: myParameters.pixelWidth * 20,
            mainAxisSpacing: myParameters.pixelHeight * 20,
            childAspectRatio: 38 / 42),
        itemCount: inputWord.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: MyColors.greyColor!.withOpacity(
                inputWord[index] == '' ? 0 : 1,
              ),
              borderRadius: BorderRadius.circular(myParameters.pixelWidth * 5),
            ),
            child: Center(
              child: MyTextWidget(
                text: inputWord[index],
                fontSize: 26,
              ),
            ),
          );
        },
      ),
    );
  }

  Padding buildTranslationAndImgContainer(MyParameters myParameters) {
    return Padding(
      padding: EdgeInsets.only(
          top: myParameters.pixelHeight * 80,
          bottom: myParameters.pixelHeight * 20),
      child: Container(
        height: myParameters.pixelHeight * 216,
        width: myParameters.pixelWidth * 286,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(myParameters.pixelWidth * 10),
            border: Border.all(color: MyColors.greyColor!)),
        child: Padding(
          padding: EdgeInsets.all(myParameters.pixelWidth * 20),
          child: Column(
            children: [
              MyTextWidget(
                text: widget.word!.translation,
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
              Expanded(child: SvgPicture.asset(widget.word!.imgPath))
            ],
          ),
        ),
      ),
    );
  }
}
