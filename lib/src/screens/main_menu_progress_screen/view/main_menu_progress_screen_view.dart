import 'package:one_minute_english/src/screens/main_menu_progress_screen/view/widgets/my_progress_circle_indicator.dart';
import 'package:one_minute_english/src/utils/library.dart';

import '../../../../main.dart';
import '../../../utils/app_language/app_language.dart';
import '../../../utils/constants.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_parameters.dart';
import '../../start_screen/controller/start_screen_controller.dart';
import '../controller/progress_controller.dart';

class MainMenuProgressScreenView extends ConsumerStatefulWidget {
  const MainMenuProgressScreenView({super.key});

  @override
  ConsumerState createState() => _MainMenuProgressScreenViewState();
}

class _MainMenuProgressScreenViewState
    extends ConsumerState<MainMenuProgressScreenView> {
  static const imgs = [
    'assets/ui_images/main_app/progress/idea.png',
    'assets/ui_images/main_app/progress/repeat.png',
    'assets/ui_images/main_app/progress/difficult.png'
  ];

  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final langIndex = ref.watch(startScreenProvider).chosenLanguageIndex;
    final lang = AppLanguage.listOfLanguages[langIndex];
    final progress = ref.watch(progressProvider);
    final selectedDate = progress.selectedDate;
    final texts = [
      lang[LangKey.alreadyKnow],
      lang[LangKey.repeating],
      lang[LangKey.difficult]
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: myParameters.pixelWidth * 30),
      child: Column(
        children: [
          buildTopProgressAndIcon(myParameters, lang),
          buildMyWordsText(lang, myParameters),
          buildTopLearningWordsStatContainer(myParameters, texts),
          buildLookByDateContainer(myParameters, lang),
          MyProgressCircleIndicator(
              langIndex: langIndex, value: 0.1, selectedDate: selectedDate)
        ],
      ),
    );
  }

  Align buildMyWordsText(Map<LangKey, String> lang, MyParameters myParameters) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        lang[LangKey.myWords]!,
        style: TextStyle(
            color: isDarkTheme ? MyColors.whiteColor : MyColors.blackColor87,
            fontWeight: FontWeight.w400,
            fontFamily: MyConstants.fontLabel,
            fontSize: myParameters.pixelWidth * 16),
      ),
    );
  }

  Padding buildTopLearningWordsStatContainer(
      MyParameters myParameters, List<String?> texts) {
    return Padding(
      padding: EdgeInsets.only(
          top: myParameters.pixelWidth * 20,
          bottom: myParameters.pixelHeight * 13),
      child: Container(
        height: myParameters.pixelHeight * 222,
        decoration: BoxDecoration(
            color: MyColors.whiteColor70,
            borderRadius: BorderRadius.circular(myParameters.pixelWidth * 10),
            boxShadow: [
              BoxShadow(
                  color: isDarkTheme
                      ? MyColors.blackColor87!
                      : MyColors.textLiteGreyColor.withOpacity(0.25),
                  blurRadius: 4)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              3,
              (index) => InkWell(
                onTap: (){if(index==2){
                  ProgressController.onTapDifficultWords(context);
                }},
                child: Stack(children: [
                      Positioned(
                        left: -1,
                        top: -1,
                        child: Container(
                          height: myParameters.pixelHeight * 75,
                          width: myParameters.pixelWidth * 85,
                          decoration: BoxDecoration(
                            color: isDarkTheme
                                ? MyColors.backColorDarkTheme
                                : MyColors.whiteColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: index == 2
                                    ? Radius.circular(
                                        myParameters.pixelHeight * 10)
                                    : Radius.zero,
                                topLeft: index == 0
                                    ? Radius.circular(
                                        myParameters.pixelHeight * 10)
                                    : Radius.zero),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(myParameters.pixelWidth * 20),
                            child: Image.asset(
                              imgs[index],
                              height: myParameters.pixelHeight * 40,
                              width: myParameters.pixelWidth * 40,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          children: [
                            Container(
                              height: myParameters.pixelHeight * 73.5,
                              width: myParameters.pixelWidth * (378 - 92),
                              decoration: BoxDecoration(
                                color: MyColors.mainColor,
                                borderRadius: BorderRadius.only(
                                    bottomRight: index == 2
                                        ? Radius.circular(
                                            myParameters.pixelHeight * 10)
                                        : Radius.zero,
                                    topRight: index == 0
                                        ? Radius.circular(
                                            myParameters.pixelHeight * 10)
                                        : Radius.zero),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: myParameters.pixelWidth * 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      texts[index]!,
                                      style: TextStyle(
                                          color: MyColors.whiteColor,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: MyConstants.fontLabel,
                                          fontSize: myParameters.pixelWidth * 16),
                                    ),
                                    Text(
                                      '4',
                                      style: TextStyle(
                                          color: MyColors.whiteColor,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: MyConstants.fontLabel,
                                          fontSize: myParameters.pixelWidth * 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              )),
        ),
      ),
    );
  }

  Padding buildLookByDateContainer(
      MyParameters myParameters, Map<LangKey, String> lang) {
    return Padding(
      padding: EdgeInsets.only(bottom: myParameters.pixelHeight * 22),
      child: Container(
          height: myParameters.pixelHeight * 141,
          decoration: BoxDecoration(
              color: isDarkTheme
                  ? MyColors.backColorDarkTheme
                  : MyColors.whiteColor,
              borderRadius: BorderRadius.circular(myParameters.pixelWidth * 10),
              boxShadow: [
                BoxShadow(
                    color: MyColors.textLiteGreyColor.withOpacity(0.25),
                    blurRadius: 4)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: myParameters.pixelHeight * 16,
                    left: myParameters.pixelWidth * 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lang[LangKey.lookingByDate]!,
                      style: TextStyle(
                          color: isDarkTheme
                              ? MyColors.whiteColor
                              : MyColors.blackColor87,
                          fontWeight: FontWeight.w900,
                          fontFamily: MyConstants.fontLabel,
                          fontSize: myParameters.pixelWidth * 18),
                    ),
                    SizedBox(height: myParameters.pixelHeight * 11),
                    SizedBox(
                      width: myParameters.pixelWidth * 200,
                      child: Text(
                        lang[LangKey.seeHowManyWordsYouHaveLearned]!,
                        style: TextStyle(
                            color: MyColors.textLiteGreyColor,
                            fontWeight: FontWeight.w400,
                            fontFamily: MyConstants.fontLabel,
                            fontSize: myParameters.pixelWidth * 12),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: myParameters.pixelWidth * 43),
                child: Image.asset(
                  'assets/ui_images/main_app/progress/schedule_img.png',
                  height: myParameters.pixelHeight * 87,
                  width: myParameters.pixelWidth * 87,
                ),
              )
            ],
          )),
    );
  }

  Padding buildTopProgressAndIcon(
      MyParameters myParameters, Map<LangKey, String> lang) {
    return Padding(
      padding: EdgeInsets.only(
        top: myParameters.pixelHeight * 66,
        bottom: myParameters.pixelHeight * 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            lang[LangKey.progress]!,
            style: TextStyle(
                color:
                    isDarkTheme ? MyColors.whiteColor : MyColors.blackColor87,
                fontWeight: FontWeight.w900,
                fontFamily: MyConstants.fontLabel,
                fontSize: myParameters.pixelWidth * 22),
          ),
          InkWell(
            onTap: () {
              ProgressController.onTapSchedule(context);
            },
            child: Image.asset(
              'assets/ui_images/main_app/progress/schedule.png',
              height: myParameters.pixelHeight * 31,
              width: myParameters.pixelWidth * 31,
            ),
          )
        ],
      ),
    );
  }
}
