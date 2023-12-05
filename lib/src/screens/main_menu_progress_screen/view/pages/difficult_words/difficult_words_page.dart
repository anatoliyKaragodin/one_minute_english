import 'package:one_minute_english/src/repo/model/word.dart';
import 'package:one_minute_english/src/repo/model/words_controller.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/select_words_to_learn_page/view/widgets/my_play_sound_button.dart';
import 'package:one_minute_english/src/screens/main_menu_progress_screen/controller/progress_controller.dart';
import 'package:one_minute_english/src/screens/start_screen/controller/start_screen_controller.dart';
import 'package:one_minute_english/src/utils/app_language/app_language.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_color_button.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_text_widget.dart';

class DifficultWordsView extends ConsumerStatefulWidget {
  const DifficultWordsView({super.key});
  final route = 'difficult words page';

  @override
  ConsumerState createState() => _DifficultWordsViewState();
}

class _DifficultWordsViewState extends ConsumerState<DifficultWordsView> {
  static const soundImg = 'assets/ui_images/main_app/icons/play_sound.png';

  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final langIndex = ref.watch(startScreenProvider).chosenLanguageIndex;
    final lang = AppLanguage.listOfLanguages[langIndex];
    final words = ref.watch(wordsProvider);
    final listOfDifficultWords = words.words;
    final player = AudioPlayer();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: myParameters.pixelHeight * 66),
            child: SizedBox(
              width: myParameters.width,
              child: Column(
                children: [
                  buildTopRow(lang),
                  if (listOfDifficultWords.isNotEmpty)
                    SizedBox(
                        height: myParameters.pixelHeight * 680,
                        child: ListView.builder(
                            padding: EdgeInsets.only(
                                top: myParameters.pixelHeight * 20),
                            itemCount: listOfDifficultWords.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: myParameters.pixelHeight * 100,
                                width: myParameters.width,
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: MyColors.greyColor!
                                                .withOpacity(0.5)),
                                        bottom: index ==
                                                listOfDifficultWords.length - 1
                                            ? BorderSide(
                                                color: MyColors.greyColor!
                                                    .withOpacity(0.5))
                                            : BorderSide.none)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: myParameters.pixelWidth * 20),
                                      child: Row(
                                        children: [
                                          buildSoundButton(
                                              player,
                                              listOfDifficultWords,
                                              index,
                                              myParameters),
                                          SizedBox(
                                            width: myParameters.pixelWidth * 30,
                                          ),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                MyTextWidget(
                                                  text: listOfDifficultWords[
                                                          index]
                                                      .word,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                                SizedBox(
                                                  height:
                                                      myParameters.pixelHeight *
                                                          8,
                                                ),
                                                MyTextWidget(
                                                  text: listOfDifficultWords[
                                                          index]
                                                      .translation,
                                                  fontSize: 14,
                                                ),
                                              ]),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        ProgressController
                                            .onTapDifficultWordDialog(
                                                ref,
                                                context,
                                                listOfDifficultWords[index]);
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        size: myParameters.pixelWidth * 20,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }))
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: myParameters.pixelHeight * 50),
            child: MyColorButtonWidget(
                func: () {}, text: lang[LangKey.trainingWords]!),
          )
        ],
      ),
    );
  }

  InkWell buildSoundButton(AudioPlayer player, List<Word> listOfDifficultWords,
      int index, MyParameters myParameters) {
    return InkWell(
      onTap: () {
        player.play(AssetSource(listOfDifficultWords[index].soundPath));
      },
      child: SizedBox(
        height: myParameters.pixelWidth * 32,
        width: myParameters.pixelWidth * 32,
        child: Center(
            child: Image.asset(
          soundImg,
          color: MyColors.mainColor,
        )),
      ),
    );
  }

  Row buildTopRow(Map<LangKey, String> lang) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close_rounded,
              color: MyColors.greyColor,
            )),
        MyTextWidget(
          text: lang[LangKey.difficult]!,
          fontSize: 14,
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_rounded,
              color: MyColors.greyColor,
            ))
      ],
    );
  }
}
