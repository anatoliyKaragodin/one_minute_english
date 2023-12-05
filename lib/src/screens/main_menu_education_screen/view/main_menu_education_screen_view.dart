import 'package:one_minute_english/main.dart';
import 'package:one_minute_english/src/repo/model/words_controller.dart';
import 'package:one_minute_english/src/screens/main_app_menu_screen/controller/main_app_menu_controller.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/controller/main_menu_education_controller.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/widgets/list_of_learning_themes_widget.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_color_button.dart';

import '../../../utils/app_language/app_language.dart';
import '../../../utils/constants.dart';
import '../../../utils/my_parameters.dart';
import '../../start_screen/controller/start_screen_controller.dart';

class MainMenuEducationScreenView extends ConsumerStatefulWidget {
  const MainMenuEducationScreenView({super.key});

  @override
  ConsumerState createState() => _MainMenuEducationScreenViewState();
}

class _MainMenuEducationScreenViewState
    extends ConsumerState<MainMenuEducationScreenView> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final langIndex = ref.watch(startScreenProvider).chosenLanguageIndex;
    final lang = AppLanguage.listOfLanguages[langIndex];
    final words = ref.watch(wordsProvider);
    return Column(
      children: [
        buildTopContainer(myParameters, lang),
        buildMyProgressText(myParameters, lang),
        Expanded(
            child: ListOfLearningThemesWidget(
          lang: langIndex,
        ))
      ],
    );
  }

  Padding buildMyProgressText(
      MyParameters myParameters, Map<LangKey, String> lang) {
    return Padding(
      padding: EdgeInsets.only(
          left: myParameters.pixelWidth * 20,
          bottom: myParameters.pixelHeight * 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          lang[LangKey.myProgressByThemes]!,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: MyConstants.fontLabel,
              fontSize: myParameters.pixelWidth * 20),
        ),
      ),
    );
  }

  Padding buildTopContainer(
      MyParameters myParameters, Map<LangKey, String> lang) {
    return Padding(
      padding: EdgeInsets.only(
          top: myParameters.pixelHeight * 87,
          left: myParameters.pixelWidth * 20,
          right: myParameters.pixelWidth * 20,
          bottom: myParameters.pixelHeight * 37),
      child: Container(
        height: myParameters.pixelHeight * 197,
        width: myParameters.pixelWidth * 390,
        decoration: BoxDecoration(
            color:
                isDarkTheme ? MyColors.backColorDarkTheme : MyColors.whiteColor,
            borderRadius: BorderRadius.circular(myParameters.pixelWidth * 10),
            boxShadow: [
              BoxShadow(
                  color: MyColors.textLiteGreyColor
                      .withOpacity(isDarkTheme ? 0 : 0.6),
                  blurRadius: myParameters.pixelWidth * 6)
            ]),
        child: Stack(
          children: [
            buildTextsAndButtonColumn(myParameters, lang),
            buildImage(myParameters)
          ],
        ),
      ),
    );
  }

  Positioned buildImage(MyParameters myParameters) {
    return Positioned(
        bottom: myParameters.pixelHeight * -2,
        right: 0,
        child: Image.asset(
          'assets/ui_images/main_app/woman.png',
          height: myParameters.pixelHeight * 138,
          width: myParameters.pixelWidth * 143,
        ));
  }

  Padding buildTextsAndButtonColumn(
      MyParameters myParameters, Map<LangKey, String> lang) {
    return Padding(
      padding: EdgeInsets.only(
          left: myParameters.pixelWidth * 20,
          top: myParameters.pixelHeight * 11,
          bottom: myParameters.pixelHeight * 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lang[LangKey.day1]!,
            style: TextStyle(
                fontFamily: MyConstants.fontLabel,
                fontSize: myParameters.pixelWidth * 14),
          ),
          Text(
            lang[LangKey.tasksForToday]!,
            style: TextStyle(
                fontFamily: MyConstants.fontLabel,
                fontSize: myParameters.pixelWidth * 24,
                fontWeight: FontWeight.w900),
          ),
          SizedBox(
            width: myParameters.pixelWidth * 162,
            child: Text(
              lang[LangKey.helloLetsLearnFirstWords]!,
              style: TextStyle(
                  fontFamily: MyConstants.fontLabel,
                  fontSize: myParameters.pixelWidth * 14),
            ),
          ),
          MyColorButtonWidget(
            func: () => MainMenuEducationController.onTapLearnNewWords(context),
            text: lang[LangKey.learnNewWords]!,
            fontWeight: FontWeight.w400,
            fontSize: myParameters.pixelWidth * 14,
            padding: 0,
            width: myParameters.pixelWidth * 184,
            height: myParameters.pixelHeight * 48.5,
          )
        ],
      ),
    );
  }
}
