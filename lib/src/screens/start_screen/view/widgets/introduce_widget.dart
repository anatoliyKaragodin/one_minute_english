import 'package:one_minute_english/main.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';

import '../../../../utils/app_language/app_language.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/my_parameters.dart';
import '../../controller/start_screen_controller.dart';

class IntroduceWidget extends ConsumerStatefulWidget {
  const IntroduceWidget({super.key});

  @override
  ConsumerState<IntroduceWidget> createState() => _IntroduceWidgetState();
}

class _IntroduceWidgetState extends ConsumerState<IntroduceWidget> {
  static const imgList = [
    'assets/ui_images/start_screen_imgs/img1.png',
    'assets/ui_images/start_screen_imgs/img2.png',
    'assets/ui_images/start_screen_imgs/img3.png',
    'assets/ui_images/start_screen_imgs/img4.png'
  ];
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final startScreenState = ref.watch(startScreenProvider);
    final pageOpacity = startScreenState.pageOpacity;
    final pageIndex = startScreenState.startPageIndex;
    final language = ref.watch(startScreenProvider).chosenLanguageIndex;
    final textList = [
      AppLanguage.listOfLanguages[language][LangKey.introduceText1],
      AppLanguage.listOfLanguages[language][LangKey.introduceText2],
      AppLanguage.listOfLanguages[language][LangKey.introduceText3],
      AppLanguage.listOfLanguages[language][LangKey.introduceText4],
    ];
    return buildIntroduce(
        myParameters, pageOpacity, pageIndex, textList, language);
  }

  Positioned buildIntroduce(MyParameters myParameters, double pageOpacity,
      int pageIndex, List<String?> textList, int language) {
    return Positioned(
      height: myParameters.pixelHeight * 750,
      width: myParameters.width,
      child: AnimatedOpacity(
        opacity: pageOpacity,
        duration: const Duration(milliseconds: 500),
        child: Column(
          children: [
            buildImg(myParameters, pageIndex),
            buildText(myParameters, pageIndex, textList),
            buildSkipButton(myParameters, language),
            buildDotsRow(myParameters, pageIndex)
          ],
        ),
      ),
    );
  }

  Padding buildDotsRow(MyParameters myParameters, int pageIndex) {
    return Padding(
      padding: EdgeInsets.only(top: myParameters.pixelHeight * 15),
      child: SizedBox(
        width: myParameters.pixelWidth * 124,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              4,
              (index) => Container(
                    width: myParameters.pixelWidth * 15,
                    height: myParameters.pixelHeight * 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: pageIndex - 1 == index
                          ? MyColors.mainColor
                          : isDarkTheme
                              ? MyColors.whiteColor
                              : MyColors.blackColor87,
                    ),
                  )),
        ),
      ),
    );
  }

  InkWell buildSkipButton(MyParameters myParameters, int language) {
    return InkWell(
      onTap: () {
        StartScreenController.onSkipTap(context);
      },
      child: SizedBox(
        height: myParameters.pixelHeight * 36,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppLanguage.listOfLanguages[language][LangKey.skipButton]!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: MyConstants.fontLabel,
                    fontSize: myParameters.pixelWidth * 20,
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: myParameters.pixelWidth * 30),
                      child: Divider(
                        color: isDarkTheme
                            ? MyColors.whiteColor
                            : MyColors.blackColor87,
                        thickness: myParameters.pixelHeight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center buildText(
      MyParameters myParameters, int pageIndex, List<String?> textList) {
    return Center(
      child: SizedBox(
        width: myParameters.pixelWidth * 250,
        height: myParameters.pixelHeight * 170,
        child: Text(
          textList[pageIndex - 1]!,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: MyConstants.fontLabel,
              fontSize: myParameters.pixelWidth * 18,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }

  Padding buildImg(MyParameters myParameters, int pageIndex) {
    return Padding(
      padding: EdgeInsets.only(top: myParameters.pixelHeight * 186),
      child: Image.asset(
        imgList[pageIndex - 1],
        height: myParameters.pixelHeight * 317,
        width: myParameters.pixelWidth * 485,
      ),
    );
  }
}
