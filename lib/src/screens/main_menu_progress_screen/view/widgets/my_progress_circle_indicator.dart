import 'package:one_minute_english/main.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';

import '../../../../utils/app_language/app_language.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/my_parameters.dart';

class MyProgressCircleIndicator extends StatelessWidget {
  final int langIndex;
  final double value;
  final Jiffy selectedDate;
  const MyProgressCircleIndicator(
      {super.key,
      required this.langIndex,
      required this.value,
      required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final lang = AppLanguage.listOfLanguages[langIndex];
    final monthsLabels = [
      lang[LangKey.january],
      lang[LangKey.february],
      lang[LangKey.march],
      lang[LangKey.april],
      lang[LangKey.may],
      lang[LangKey.june],
      lang[LangKey.july],
      lang[LangKey.august],
      lang[LangKey.september],
      lang[LangKey.october],
      lang[LangKey.november],
      lang[LangKey.december],
    ];
    return SizedBox(
      height: myParameters.pixelHeight * 205,
      width: myParameters.pixelWidth * 168,
      child: Stack(alignment: Alignment.center, children: [
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            '${selectedDate.date} ${monthsLabels[selectedDate.month - 1]}',
            style: TextStyle(
                color: isDarkTheme
                    ? MyColors.whiteColor
                    : MyColors.textLiteGreyColor,
                fontWeight: FontWeight.w700,
                fontFamily: MyConstants.fontLabel,
                fontSize: myParameters.pixelWidth * 20),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Transform.rotate(
            angle: 0.6,
            child: CircularPercentIndicator(
                circularStrokeCap: CircularStrokeCap.round,
                lineWidth: myParameters.pixelWidth * 25,
                percent: value,
                backgroundColor: MyColors.mainColor,
                progressColor: MyColors.greenColor,
                radius: myParameters.pixelWidth * 84),
          ),
        ),
        Positioned(
          bottom: myParameters.pixelHeight * 50,
          // left: myParameters.pixelWidth*84,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '4',
                style: TextStyle(
                    color: isDarkTheme
                        ? MyColors.whiteColor
                        : MyColors.textLiteGreyColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: MyConstants.fontLabel,
                    fontSize: myParameters.pixelWidth * 45),
              ),
              Text(
                lang[LangKey.words]!,
                style: TextStyle(
                    color: isDarkTheme
                        ? MyColors.whiteColor
                        : MyColors.textMoreLiteGreyColor,
                    fontWeight: FontWeight.w800,
                    fontFamily: MyConstants.fontLabel,
                    fontSize: myParameters.pixelWidth * 18),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
