import 'dart:async';

import 'package:one_minute_english/src/screens/start_screen/controller/start_screen_controller.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';

import '../../../../utils/constants.dart';

class LanguageChooseWidget extends ConsumerStatefulWidget {
  const LanguageChooseWidget({super.key});

  @override
  ConsumerState createState() => _LanguageChooseWidgetState();
}

class _LanguageChooseWidgetState extends ConsumerState<LanguageChooseWidget> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final startScreenState = ref.watch(startScreenProvider);
    final pageOpacity = startScreenState.pageOpacity;
    final langIndex = startScreenState.chosenLanguageIndex;
    final languageLabels = [
      'Español',
      'Русский',
      'Deutsch',
      'French',
      'Italian',
      'Türkce',
      'Portuguese'
    ];
    final languageImgs = [
      'assets/ui_images/languages/spanish.png',
      'assets/ui_images/languages/russian.png',
      'assets/ui_images/languages/german.png',
      'assets/ui_images/languages/french.png',
      'assets/ui_images/languages/italian.png',
      'assets/ui_images/languages/turkish.png',
      'assets/ui_images/languages/portuguese.png'
    ];
    return buildLanguageChoose(
        myParameters, languageLabels, languageImgs, pageOpacity, langIndex);
  }

  Positioned buildLanguageChoose(
      MyParameters myParameters,
      List<String> languageLabels,
      List<String> languageImgs,
      double pageOpacity,
      int langIndex) {
    return Positioned(
      top: myParameters.pixelHeight * 73,
      height: myParameters.pixelHeight * 656,
      width: myParameters.width,
      child: AnimatedOpacity(
        opacity: pageOpacity,
        duration: const Duration(milliseconds: 500),
        child: Column(
          children: [
            Center(
              child: Text(
                'Choose Your',
                style: TextStyle(
                    color: MyColors.textLiteGreyColor,
                    fontFamily: MyConstants.fontLabel,
                    fontSize: myParameters.pixelWidth * 18),
              ),
            ),
            SizedBox(
              height: myParameters.pixelHeight * 10,
            ),
            Center(
              child: Text(
                'NATIVE LANGUAGE',
                style: TextStyle(
                    color: MyColors.mainColor,
                    fontFamily: MyConstants.fontLabel,
                    fontSize: myParameters.pixelWidth * 25),
              ),
            ),
            SizedBox(
              height: myParameters.pixelHeight * 25,
            ),
            Column(
                children: List.generate(
                    languageLabels.length,
                    (index) => InkWell(
                          onTap: () {
                            StartScreenController.onLanguageTap(ref, index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: MyColors.textLiteGreyColor
                                      .withOpacity(0.6),
                                  width: 1.0,
                                ),
                                bottom: index == languageLabels.length - 1
                                    ? BorderSide(
                                        color: MyColors.textLiteGreyColor
                                            .withOpacity(0.6),
                                        width: 1.0,
                                      )
                                    : BorderSide.none,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: myParameters.pixelWidth * 20,
                                  vertical: myParameters.pixelHeight * 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          languageImgs[index],
                                          height: myParameters.pixelHeight * 50,
                                        ),
                                        SizedBox(
                                          width: myParameters.pixelWidth * 20,
                                        ),
                                        Text(languageLabels[index],
                                            style: TextStyle(
                                                fontFamily:
                                                    MyConstants.fontLabel,
                                                fontWeight: langIndex == index
                                                    ? FontWeight.w900
                                                    : FontWeight.normal,
                                                fontSize:
                                                    myParameters.pixelWidth *
                                                        18)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: myParameters.pixelWidth * 30,
                                    height: myParameters.pixelHeight * 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: langIndex == index
                                          ? MyColors.mainColor
                                          : MyColors.textLiteGreyColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )))
          ],
        ),
      ),
    );
  }
}
