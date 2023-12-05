import 'package:one_minute_english/src/repo/model/word.dart';
import 'package:one_minute_english/src/repo/model/words_controller.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/select_words_to_learn_page/view/widgets/my_play_sound_button.dart';
import 'package:one_minute_english/src/screens/start_screen/controller/start_screen_controller.dart';
import 'package:one_minute_english/src/utils/app_language/app_language.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_color_button.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_text_widget.dart';

class DifficultWordDialog extends ConsumerStatefulWidget {
  final Word word;
  final String themeLabel;
  const DifficultWordDialog(
      {super.key, required this.word, required this.themeLabel});

  @override
  ConsumerState createState() => _DifficultWordDialogState();
}

class _DifficultWordDialogState extends ConsumerState<DifficultWordDialog> {
  static const soundImgList = [
    'assets/ui_images/main_app/icons/slow.png',
    'assets/ui_images/main_app/icons/play_sound_2.png'
  ];
  static const bottomButtonImgs = [
    'assets/ui_images/main_app/progress/warning.png',
    'assets/ui_images/main_app/progress/delete.png'
  ];
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final langIndex = ref.watch(startScreenProvider).chosenLanguageIndex;
    final lang = AppLanguage.listOfLanguages[langIndex];
    final words = ref.watch(wordsProvider);
    final listOfDifficultWords = words.words;
    final player = AudioPlayer();
    final List<Function> bottomButtonFunctions = [() {}, () {}];
    final List<String> bottomButtonsText = [
      lang[LangKey.reportBug]!,
      lang[LangKey.deleteWord]!
    ];
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(myParameters.pixelWidth * 10)),
      backgroundColor: MyColors.backColorDarkTheme,
      insetPadding: EdgeInsets.zero,
      child: SizedBox(
        height: myParameters.pixelHeight * 837,
        width: myParameters.pixelWidth * 380,
        child: Column(
          children: [
            buildTopTextAndCloseRow(myParameters, lang, context),
            buildWordAndTranslationContainer(myParameters),
            buildSoundButtonsRow(myParameters, player),
            MyColorButtonWidget(func: () {}, text: lang[LangKey.alreadyKnow]!),
            buildTranscriptionAndThemeContainer(lang, myParameters, widget.word.theme),
            buildBottomButtons(
                myParameters, bottomButtonFunctions, bottomButtonsText)
          ],
        ),
      ),
    );
  }

  SizedBox buildBottomButtons(MyParameters myParameters,
      List<Function> bottomButtonFunctions, List<String> bottomButtonsText) {
    return SizedBox(
      child: Column(
        children: List.generate(
            bottomButtonImgs.length,
            (index) => buildBottomButton(
                myParameters,
                bottomButtonFunctions[index],
                bottomButtonImgs[index],
                bottomButtonsText[index])),
      ),
    );
  }

  Padding buildTopTextAndCloseRow(MyParameters myParameters,
      Map<LangKey, String> lang, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: myParameters.pixelHeight * 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 47,
          ),
          MyTextWidget(
            text: lang[LangKey.difficultWord]!,
            fontSize: 14,
            color: MyColors.redColor,
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close_rounded,
                color: MyColors.greyColor,
              ))
        ],
      ),
    );
  }

  InkWell buildBottomButton(
      MyParameters myParameters, Function onTap, String imgPath, String text) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: myParameters.pixelWidth * 380,
        height: myParameters.pixelHeight * 60,
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(color: MyColors.greyColor!.withOpacity(0.2)))),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: myParameters.pixelWidth * 15,
                  right: myParameters.pixelWidth * 30),
              child: Image.asset(
                imgPath,
                height: myParameters.pixelHeight * 30,
                width: myParameters.pixelWidth * 30,
              ),
            ),
            MyTextWidget(
              text: text,
              fontWeight: FontWeight.w900,
            )
          ],
        ),
      ),
    );
  }

  Padding buildTranscriptionAndThemeContainer(
      Map<LangKey, String> lang, MyParameters myParameters, String theme) {
    return Padding(
      padding: EdgeInsets.only(
          top: myParameters.pixelHeight * 140,
          bottom: myParameters.pixelHeight * 170),
      child: SizedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextWidget(
                  text:
                      '${lang[LangKey.transcription]}: /${widget.word.transcription}/',
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
                SizedBox(
                  height: myParameters.pixelHeight * 8,
                ),
                MyTextWidget(
                  text: '${lang[LangKey.theme]}: $theme',
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildWordAndTranslationContainer(MyParameters myParameters) {
    return SizedBox(
      child: Column(
        children: [
          MyTextWidget(
            text: widget.word.word,
            fontWeight: FontWeight.w900,
            fontSize: 25,
          ),
          SizedBox(
            height: myParameters.pixelHeight * 20,
          ),
          MyTextWidget(
            text: widget.word.translation,
            fontSize: 18,
          )
        ],
      ),
    );
  }

  Padding buildSoundButtonsRow(MyParameters myParameters, AudioPlayer player) {
    return Padding(
      padding: EdgeInsets.only(
          top: myParameters.pixelHeight * 50,
          bottom: myParameters.pixelHeight * 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSoundButton(player, myParameters, 30, soundImgList[0], true),
          SizedBox(
            width: myParameters.pixelWidth * 15,
          ),
          buildSoundButton(player, myParameters, 52, soundImgList[1], false),
        ],
      ),
    );
  }

  InkWell buildSoundButton(AudioPlayer player, MyParameters myParameters,
      double size, String imgPath, bool isSlow) {
    return InkWell(
      onTap: () {
        if (isSlow) {
          player.setPlaybackRate(0.6);
        } else {
          player.setPlaybackRate(1);
        }
        player.play(AssetSource(widget.word.soundPath));
      },
      child: Container(
        height: myParameters.pixelWidth * size,
        width: myParameters.pixelWidth * size,
        decoration: BoxDecoration(
          border: Border.all(color: MyColors.greyColor!),
          shape: BoxShape.circle,
        ),
        child: Center(
            child: Padding(
          padding: EdgeInsets.all(isSlow
              ? 5 * myParameters.pixelWidth
              : 10 * myParameters.pixelWidth),
          child: Image.asset(
            imgPath,
            color: MyColors.greyColor,
          ),
        )),
      ),
    );
  }
}
