import 'package:one_minute_english/main.dart';
import 'package:one_minute_english/src/repo/model/word.dart';
import 'package:one_minute_english/src/repo/model/words.dart';
import 'package:one_minute_english/src/repo/model/words_controller.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/controller/training_words_controller.dart';
import 'package:one_minute_english/src/screens/start_screen/controller/start_screen_controller.dart';
import 'package:one_minute_english/src/utils/app_language/app_language.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_color_button.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_text_widget.dart';

class TrainingWordsTranslationResultDialog extends ConsumerStatefulWidget {
  final int answerIndex;
  final int yourIndex;
  const TrainingWordsTranslationResultDialog(
      {super.key, required this.answerIndex, required this.yourIndex});

  @override
  ConsumerState createState() => _TrainingWordsTranslationResultDialogState();
}

class _TrainingWordsTranslationResultDialogState
    extends ConsumerState<TrainingWordsTranslationResultDialog> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final langIndex = ref.watch(startScreenProvider).chosenLanguageIndex;
    final lang = AppLanguage.listOfLanguages[langIndex];
    final words = ref.watch(wordsProvider);
    final bool answerIsRight = widget.yourIndex == widget.answerIndex;
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(myParameters.pixelWidth * 30)),
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      backgroundColor:
          isDarkTheme ? MyColors.backColorDarkTheme : MyColors.whiteColor,
      child: SizedBox(
        height: myParameters.pixelHeight * 444,
        child: Padding(
          padding: EdgeInsets.only(
              top: myParameters.pixelHeight * 30,
              left: myParameters.pixelWidth * 20,
              right: myParameters.pixelWidth * 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  MyTextWidget(
                    text: lang[LangKey.payAttention]!,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ],
              ),
              buildAnswerContainer(
                  lang,
                  myParameters,
                  words.selectedToLearn[widget.yourIndex],
                  answerIsRight,
                  lang[LangKey.yourAnswer]!),
              buildAnswerContainer(
                  lang,
                  myParameters,
                  words.selectedToLearn[widget.answerIndex],
                  true,
                  lang[LangKey.correctAnswer]!),
              Padding(
                padding: EdgeInsets.only(bottom: myParameters.pixelHeight * 50),
                child: MyColorButtonWidget(
                    padding: 0,
                    func: () { TrainingWordsController.onTapContinueButton(ref, context, widget.answerIndex==widget.yourIndex);},
                    text: lang[LangKey.continueButton]!),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column buildAnswerContainer(Map<LangKey, String> lang,
      MyParameters myParameters, Word word, bool answerIsRight, String text) {
    final player = AudioPlayer();

    return Column(
      children: [
        Row(
          children: [
            MyTextWidget(
              text: text,
              color: MyColors.greyColor,
              fontSize: 14,
              fontWeight: FontWeight.w900,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: myParameters.pixelHeight * 20),
          child: Container(
            height: myParameters.pixelHeight * 63,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(myParameters.pixelWidth * 10),
                border: Border.all(color: MyColors.greyColor!)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: myParameters.pixelWidth * 20,
                  vertical: myParameters.pixelHeight * 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextWidget(
                        text: word.translation,
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: answerIsRight
                            ? MyColors.greenColor
                            : MyColors.pinkColor,
                      ),
                      MyTextWidget(
                        text: word.word,
                        fontSize: 14,
                        color: MyColors.greyColor,
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      player.play(AssetSource(word.soundPath));
                    },
                    child: Image.asset(
                      'assets/ui_images/main_app/icons/play_sound_2.png',
                      width: myParameters.pixelWidth * 27,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
