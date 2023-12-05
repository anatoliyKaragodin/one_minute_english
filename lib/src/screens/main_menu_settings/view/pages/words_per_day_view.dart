import 'package:one_minute_english/main.dart';
import 'package:one_minute_english/src/screens/main_menu_settings/controller/settings_controller.dart';
import 'package:one_minute_english/src/screens/start_screen/controller/start_screen_controller.dart';
import 'package:one_minute_english/src/utils/app_language/app_language.dart';
import 'package:one_minute_english/src/utils/constants.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_text_widget.dart';

class WordsPerDayView extends ConsumerStatefulWidget {
  const WordsPerDayView({super.key});

  @override
  ConsumerState createState() => _WordsPerDayViewState();
}

class _WordsPerDayViewState extends ConsumerState<WordsPerDayView> {
  static const numberOfWords = [4, 8, 10, 15, 20, 30];

  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final lang = ref.watch(startScreenProvider).chosenLanguageIndex;
    final settings = ref.watch(settingsProvider);
    final colors = [
      MyColors.greenColor,
      MyColors.pinkColor,
      MyColors.orangeColor,
      MyColors.blueColor,
      MyColors.pinkColor,
      MyColors.orangeColor,
    ];
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                  top: myParameters.pixelHeight * 77,
                  bottom: myParameters.pixelHeight * 10),
              child: buildTopColumn(myParameters, lang),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: myParameters.pixelWidth * 20),
            child: SizedBox(
              height: myParameters.pixelHeight * 582,
              child: Column(
                children: List.generate(
                    numberOfWords.length,
                    (index) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: myParameters.pixelHeight * 10),
                          child: InkWell(
                            onTap: () {
                              SettingsController.onTapWordsNumberIndex(
                                  ref, index);
                            },
                            child: Container(
                              height: myParameters.pixelHeight * 77,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      myParameters.pixelWidth * 10),
                                  color: isDarkTheme
                                      ? MyColors.backColorDarkTheme
                                      : colors[index]),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: myParameters.pixelWidth * 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyTextWidget(
                                      text:
                                          '${numberOfWords[index]} ${AppLanguage.listOfLanguages[lang][LangKey.words]!}'
                                              .toLowerCase(),
                                      fontSize: 22,
                                      color: MyColors.whiteColor,
                                    ),
                                    Container(
                                        height: myParameters.pixelHeight * 26,
                                        width: myParameters.pixelHeight * 26,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: settings.wordsNumberIndex ==
                                                    index
                                                ? MyColors.mainColor
                                                : isDarkTheme
                                                    ? MyColors
                                                        .backColorDarkTheme
                                                    : colors[index],
                                            border: Border.all(
                                                color: MyColors.whiteColor!,
                                                width: myParameters.pixelWidth *
                                                    4)),
                                        child: Padding(
                                          padding: EdgeInsets.all(isDarkTheme
                                              ? myParameters.pixelWidth * 4
                                              : 0),
                                          child: settings.wordsNumberIndex ==
                                                  index
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: MyColors.whiteColor,
                                                  ),
                                                )
                                              : const SizedBox(),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
              ),
            ),
          )
        ],
      ),
    );
  }

  Column buildTopColumn(MyParameters myParameters, int lang) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  SettingsController.onTapIndexPage(ref, 0);
                },
                icon: Icon(
                  Icons.close_rounded,
                  color: MyColors.greyColor!,
                )),
            SizedBox(
              width: myParameters.pixelWidth * 229,
              child: Text(
                AppLanguage.listOfLanguages[lang][LangKey.wordsPerDay]!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: MyConstants.fontLabel,
                    fontSize: myParameters.pixelWidth * 22,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              width: myParameters.pixelWidth * 50,
            )
          ],
        ),
        SizedBox(
          width: myParameters.pixelWidth * 230,
          child: Text(
            AppLanguage.listOfLanguages[lang]
                [LangKey.chooseHowManyWordsYouWantToLearn]!,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: MyConstants.fontLabel,
                fontSize: myParameters.pixelWidth * 16,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
