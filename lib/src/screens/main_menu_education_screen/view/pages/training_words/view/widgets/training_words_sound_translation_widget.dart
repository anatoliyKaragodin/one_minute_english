import 'package:one_minute_english/src/repo/model/word.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/controller/training_words_controller.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_text_widget.dart';

class TrainingWordsSoundTranslationWidget extends ConsumerStatefulWidget {
  final String text;
  final List<Word> listOfWords;
  final int currentWordIndex;
  const TrainingWordsSoundTranslationWidget(
      {super.key,
      required this.text,
      required this.currentWordIndex,
      required this.listOfWords});

  @override
  ConsumerState<TrainingWordsSoundTranslationWidget> createState() =>
      _TrainingWordsSoundTranslationWidgetState();
}

class _TrainingWordsSoundTranslationWidgetState
    extends ConsumerState<TrainingWordsSoundTranslationWidget> {
  final player = AudioPlayer();
  int wordSoundIndex = 3;
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: myParameters.pixelHeight * 66,
              bottom: myParameters.pixelHeight * 97),
          child: MyTextWidget(
            text: widget.text,
            fontSize: 18,
          ),
        ),
        Column(
          children: List.generate(
            3,
            (index) => buildPlaySoundContainer(
                myParameters, widget.listOfWords[index], index),
          ),
        ),
        buildBottomTextWord(myParameters),
      ],
    );
  }

  Padding buildPlaySoundContainer(MyParameters myParameters, Word word, index) {
    return Padding(
      padding: EdgeInsets.only(bottom: myParameters.pixelHeight * 20),
      child: InkWell(
        onTap: () {
          wordSoundIndex = index;
          setState(() {});
          player.play(AssetSource(word.soundPath));
          TrainingWordsController.onSelectSoundTranslation(index, ref);
        },
        child: Container(
          height: myParameters.pixelHeight * 84,
          width: myParameters.pixelWidth * 313,
          decoration: BoxDecoration(
              color: word.color,
              borderRadius:
                  BorderRadius.circular(myParameters.pixelWidth * 10)),
          child: Padding(
            padding: EdgeInsets.all(myParameters.pixelWidth * 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/ui_images/main_app/icons/play_sound.png',
                  width: myParameters.pixelWidth * 32,
                  color: MyColors.whiteColor!
                      .withOpacity(wordSoundIndex == index ? 1 : 0.6),
                ),
                Image.asset(
                  'assets/ui_images/main_app/icons/soundwave.png',
                  width: myParameters.pixelWidth * 231,
                  color: MyColors.whiteColor!
                      .withOpacity(wordSoundIndex == index ? 1 : 0.6),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildBottomTextWord(MyParameters myParameters) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: MyColors.greyColor!),
              borderRadius:
                  BorderRadius.circular(myParameters.pixelWidth * 10)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: myParameters.pixelHeight * 20,
                horizontal: myParameters.pixelWidth * 40),
            child: Center(
              child: MyTextWidget(
                text: widget.listOfWords[widget.currentWordIndex].translation,
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
