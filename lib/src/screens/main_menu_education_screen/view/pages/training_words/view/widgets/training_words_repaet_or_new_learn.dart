import 'package:one_minute_english/src/repo/model/words.dart';
import 'package:one_minute_english/src/repo/model/words_controller.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/controller/training_words_controller.dart';
import 'package:one_minute_english/src/screens/main_menu_settings/controller/settings_controller.dart';
import 'package:one_minute_english/src/screens/start_screen/controller/start_screen_controller.dart';
import 'package:one_minute_english/src/utils/app_language/app_language.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_color_button.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_text_widget.dart';

class TrainingWordsRepeatOrNewWordsLearn extends ConsumerStatefulWidget {
  const TrainingWordsRepeatOrNewWordsLearn({super.key});
  final route = 'repeat or new words page';

  @override
  ConsumerState createState() => _TrainingWordsRepeatOrNewWordsLearnState();
}

class _TrainingWordsRepeatOrNewWordsLearnState
    extends ConsumerState<TrainingWordsRepeatOrNewWordsLearn> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final langIndex = ref.watch(startScreenProvider).chosenLanguageIndex;
    final lang = AppLanguage.listOfLanguages[langIndex];
    final words = ref.watch(wordsProvider);
    final settings = ref.watch(settingsProvider);
    String message = lang[LangKey.youLearnedAndKnowWords]!;
    String formattedMessage = '';
    if (words.allThemes.isNotEmpty) {
      int learnedWordsCount = words.allThemes[1].learnedWords;
      int totalWordsCount = words.allThemes[1].allWordsCount;
      formattedMessage = message
          .replaceAll('{1}', learnedWordsCount.toString())
          .replaceAll('{2}', totalWordsCount.toString());
    }
    return Scaffold(
      body: words.allThemes.isNotEmpty
          ? Padding(
              padding: EdgeInsets.only(top: myParameters.pixelHeight * 66),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            TrainingWordsController.onTapCloseButton(context);
                          },
                          icon: Icon(
                            Icons.close_rounded,
                            color: MyColors.greyColor,
                          )),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: myParameters.pixelHeight * 102,
                        bottom: myParameters.pixelHeight * 129),
                    child: buildThemeContainer(
                        myParameters, words, formattedMessage),
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        MyColorButtonWidget(
                          func: () {},
                          text: lang[LangKey.repeatWords]!,
                          color: MyColors.whiteColor,
                        ),
                        SizedBox(
                          height: myParameters.pixelHeight * 26,
                        ),
                        Stack(
                          children: [
                            MyColorButtonWidget(
                                func: () {
                                  TrainingWordsController
                                      .onTapStartTrainingNewWords(context, ref);
                                },
                                text: lang[LangKey.learnNewWords]!),
                            Positioned(
                              top: myParameters.pixelHeight * 10,
                              right: myParameters.pixelWidth * 75,
                              child: Image.asset(
                                'assets/ui_images/main_app/icons/bulb_second.png',
                                height: myParameters.pixelHeight * 34,
                                width: myParameters.pixelWidth * 34,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: myParameters.pixelHeight * 32),
                          child: SizedBox(
                            width: myParameters.pixelWidth * 320,
                            child: MyTextWidget(
                              text: lang[LangKey.whenYouHaveEnoughWords]!,
                              fontSize: 14,
                              color: MyColors.greyColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          : const SizedBox(),
    );
  }

  SizedBox buildThemeContainer(
      MyParameters myParameters, Words words, String formattedMessage) {
    return SizedBox(
      height: myParameters.pixelHeight * 344,
      child: Column(
        children: [
          MyTextWidget(
            text: words.allThemes[1].label,
            fontWeight: FontWeight.w900,
            fontSize: 22,
          ),
          SizedBox(
            height: myParameters.pixelHeight * 42,
          ),
          Image.asset(
            words.allThemes[1].imgPath,
            height: myParameters.pixelHeight * 126,
          ),
          SizedBox(
            height: myParameters.pixelHeight * 20,
          ),
          buildProgressLine(
              myParameters,
              words.allThemes[1].learnedWords /
                  words.allThemes[1].allWordsCount),
          SizedBox(
            height: myParameters.pixelHeight * 42,
          ),
          MyTextWidget(
            text:
                '${words.allThemes[1].learnedWords}/${words.allThemes[1].allWordsCount}',
            fontSize: 18,
            fontWeight: FontWeight.w900,
          ),
          SizedBox(
            height: myParameters.pixelHeight * 20,
          ),
          SizedBox(
            width: myParameters.pixelWidth * 260,
            child: MyTextWidget(
              text: formattedMessage,
              fontSize: 14,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Stack buildProgressLine(MyParameters myParameters, double progress) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          width: myParameters.pixelWidth * 220,
          height: myParameters.pixelHeight * 12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(myParameters.pixelWidth * 6),
              color: MyColors.whiteColor),
        ),
        Container(
          width: myParameters.pixelWidth * 220 * progress,
          height: myParameters.pixelHeight * 12,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(myParameters.pixelWidth * 6),
              color: MyColors.mainColor),
        )
      ],
    );
  }
}
