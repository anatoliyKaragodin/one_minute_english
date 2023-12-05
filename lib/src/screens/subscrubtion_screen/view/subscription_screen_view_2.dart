import 'package:one_minute_english/main.dart';
import 'package:one_minute_english/src/screens/subscrubtion_screen/controller/subscrubtion_screen_controller.dart';
import 'package:one_minute_english/src/utils/constants.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_color_button.dart';

import '../../../utils/app_language/app_language.dart';
import '../../../utils/my_parameters.dart';
import '../../start_screen/controller/start_screen_controller.dart';

class SubscriptionScreenView2 extends ConsumerStatefulWidget {
  const SubscriptionScreenView2({super.key});

  @override
  ConsumerState createState() => _SubscriptionScreenView2State();
}

class _SubscriptionScreenView2State
    extends ConsumerState<SubscriptionScreenView2> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final subIndex = ref.watch(subscriptionScreenProvider).chosenSubIndex;
    final langIndex = ref.watch(startScreenProvider).chosenLanguageIndex;
    final lang = AppLanguage.listOfLanguages[langIndex];
    final texts = [
      lang[LangKey.oneMonth],
      lang[LangKey.twelveMonths],
    ];
    final subTexts = ['\$14,99', '\$79,99'];
    final priceTexts = [
      '\$14,99 / ${lang[LangKey.monthShort]}',
      '\$6.67 / ${lang[LangKey.monthShort]}'
    ];

    return Scaffold(
      body: Column(
        children: [
          buildCloseIcon(myParameters),
          buildIconText(myParameters, lang),
          buildPricesColumn(
              myParameters, texts, subTexts, priceTexts, lang, subIndex),
          buildSubTypeBottomText(myParameters, lang),
          buildContinueButton(lang),
          buildTermsOfUseButton(myParameters, lang),
          buildRestorePurchasesButton(myParameters, lang)
        ],
      ),
    );
  }

  InkWell buildRestorePurchasesButton(
      MyParameters myParameters, Map<LangKey, String> lang) {
    return InkWell(
      onTap: () {},
      child: Text(
        lang[LangKey.restorePurchases]!,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: myParameters.pixelWidth * 14,
            color: isDarkTheme ? MyColors.whiteColor : MyColors.blackColor87,
            fontWeight: FontWeight.w900,
            fontFamily: MyConstants.fontLabel),
      ),
    );
  }

  InkWell buildTermsOfUseButton(
      MyParameters myParameters, Map<LangKey, String> lang) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(
            top: myParameters.pixelHeight * 45,
            bottom: myParameters.pixelHeight * 30),
        child: Text(
          lang[LangKey.termsOfUse]!,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: myParameters.pixelWidth * 14,
              color: isDarkTheme ? MyColors.whiteColor : MyColors.blackColor87,
              fontWeight: FontWeight.w900,
              fontFamily: MyConstants.fontLabel),
        ),
      ),
    );
  }

  MyColorButtonWidget buildContinueButton(Map<LangKey, String> lang) =>
      MyColorButtonWidget(
          func: () => null, text: lang[LangKey.continueButton]!);

  Padding buildSubTypeBottomText(
      MyParameters myParameters, Map<LangKey, String> lang) {
    return Padding(
      padding: EdgeInsets.only(
          top: myParameters.pixelHeight * 25,
          bottom: myParameters.pixelHeight * 33),
      child: SizedBox(
        width: myParameters.pixelWidth * 350,
        height: myParameters.pixelHeight * 67,
        child: Text(
          lang[LangKey.chooseSubscriptionOptionAfter7daysOfFreePeriod]!,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: myParameters.pixelWidth * 14,
              color: MyColors.textLiteGreyColor,
              fontWeight: FontWeight.w900,
              fontFamily: MyConstants.fontLabel),
        ),
      ),
    );
  }

  Padding buildPricesColumn(
      MyParameters myParameters,
      List<String?> texts,
      List<String?> subTexts,
      List<String> priceTexts,
      Map<LangKey, String> lang,
      int subIndex) {
    return Padding(
      padding: EdgeInsets.only(top: myParameters.pixelHeight * 75),
      child: SizedBox(
        height: myParameters.pixelHeight * 239,
        width: myParameters.pixelWidth * 341,
        child: Column(
            children: List.generate(
                2,
                (index) => SizedBox(
                      height: myParameters.pixelHeight * 119,
                      width: myParameters.pixelWidth * 360,
                      child: Stack(
                        children: [
                          Positioned(
                            top: myParameters.pixelHeight * 10,
                            child: InkWell(
                              onTap: () {
                                SubscriptionScreenController.onSubTap(
                                    ref, index);
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    height: myParameters.pixelHeight * 100,
                                    width: myParameters.pixelWidth * 335,
                                    decoration: BoxDecoration(
                                        color: index == 0
                                            ? MyColors.whiteColor
                                            : Theme.of(context)
                                                .scaffoldBackgroundColor,
                                        borderRadius: BorderRadius.circular(
                                          myParameters.pixelWidth * 10,
                                        ),
                                        border: Border.all(
                                            color: MyColors.mainColor
                                                .withOpacity(
                                                    index == 1 ? 1 : 0),
                                            width: myParameters.pixelWidth * 3),
                                        boxShadow: [
                                          BoxShadow(
                                            color: MyColors.textLiteGreyColor
                                                .withOpacity(0.5),
                                            blurRadius: index == subIndex
                                                ? myParameters.pixelWidth * 4
                                                : 0,
                                          ),
                                        ]),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              myParameters.pixelWidth * 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                texts[index]!,
                                                style: TextStyle(
                                                    color: index == 0
                                                        ? MyColors.blackColor87
                                                        : MyColors
                                                            .textLiteGreyColor,
                                                    fontFamily:
                                                        MyConstants.fontLabel,
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: myParameters
                                                            .pixelWidth *
                                                        18),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: myParameters
                                                            .pixelHeight *
                                                        5),
                                                child: Text(
                                                  subTexts[index]!,
                                                  style: TextStyle(
                                                      color: index == 0
                                                          ? MyColors
                                                              .blackColor87
                                                          : MyColors
                                                              .textLiteGreyColor,
                                                      fontFamily:
                                                          MyConstants.fontLabel,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: myParameters
                                                              .pixelWidth *
                                                          13),
                                                ),
                                              )
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                priceTexts[index],
                                                style: TextStyle(
                                                    color: index == 0
                                                        ? MyColors.blackColor87
                                                        : MyColors
                                                            .textLiteGreyColor,
                                                    fontFamily:
                                                        MyConstants.fontLabel,
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: myParameters
                                                            .pixelWidth *
                                                        18),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (index == 1)
                                    Container(
                                      height: myParameters.pixelHeight * 27,
                                      width: myParameters.pixelWidth * 136,
                                      decoration: BoxDecoration(
                                          color: MyColors.mainColor,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  myParameters.pixelWidth * 10),
                                              bottomRight: Radius.circular(
                                                  myParameters.pixelWidth *
                                                      10))),
                                      child: Center(
                                          child: Text(
                                        lang[LangKey.popular]!,
                                        style: TextStyle(
                                            fontSize:
                                                myParameters.pixelWidth * 16,
                                            fontWeight: FontWeight.w900,
                                            color: MyColors.whiteColor,
                                            fontFamily: MyConstants.fontLabel),
                                      )),
                                    )
                                ],
                              ),
                            ),
                          ),
                          if (index == subIndex)
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                height: myParameters.pixelHeight * 28,
                                width: myParameters.pixelWidth * 28,
                                decoration: BoxDecoration(
                                    color: MyColors.mainColor,
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: IconButton(
                                      padding: const EdgeInsets.all(0),
                                      onPressed: null,
                                      icon: Icon(Icons.check_rounded,
                                          color: MyColors.whiteColor,
                                          size: myParameters.pixelWidth * 18)),
                                ),
                              ),
                            )
                        ],
                      ),
                    ))),
      ),
    );
  }

  SizedBox buildIconText(MyParameters myParameters, Map<LangKey, String> lang) {
    return SizedBox(
      child: Column(
        children: [
          Image.asset(
            'assets/ui_images/sub/crown.png',
            height: myParameters.pixelHeight * 58,
            width: myParameters.pixelWidth * 58,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: myParameters.pixelHeight * 23,
                bottom: myParameters.pixelHeight * 15),
            child: Text(
              lang[LangKey.after28days]!,
              style: TextStyle(
                  fontSize: myParameters.pixelWidth * 30,
                  fontWeight: FontWeight.w900,
                  fontFamily: MyConstants.fontLabel),
            ),
          ),
          SizedBox(
            width: myParameters.pixelWidth * 270,
            child: Text(
              lang[LangKey.youWillNotWasteTimeLookingForTheRightWord]!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: myParameters.pixelWidth * 16,
                  color: MyColors.textLiteGreyColor,
                  fontWeight: FontWeight.w900,
                  fontFamily: MyConstants.fontLabel),
            ),
          ),
        ],
      ),
    );
  }

  Row buildCloseIcon(MyParameters myParameters) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: myParameters.pixelHeight * 70,
              right: myParameters.pixelWidth * 43),
          child: Container(
            height: myParameters.pixelHeight * 30,
            width: myParameters.pixelWidth * 30,
            decoration: BoxDecoration(
                color:
                    isDarkTheme ? MyColors.whiteColor : MyColors.blackColor87,
                shape: BoxShape.circle),
            child: Center(
              child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    SubscriptionScreenController.onTapCloseButton(context);
                  },
                  icon: Icon(
                    Icons.close_rounded,
                    color:
                        isDarkTheme ? MyColors.greyColor : MyColors.whiteColor,
                    size: myParameters.pixelWidth * 22,
                  )),
            ),
          ),
        )
      ],
    );
  }
}
