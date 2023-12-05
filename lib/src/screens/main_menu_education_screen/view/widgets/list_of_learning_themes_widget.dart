import 'package:one_minute_english/main.dart';
import 'package:one_minute_english/src/screens/choose_level_and_themes_screen/controller/choose_level_and_themes_controller.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_line_indicator_widget.dart';

import '../../../../utils/app_language/app_language.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/my_colors.dart';
import '../../../../utils/my_parameters.dart';

class ListOfLearningThemesWidget extends ConsumerStatefulWidget {
  final int lang;
  const ListOfLearningThemesWidget({
    super.key,
    required this.lang,
  });

  @override
  ConsumerState createState() => _ListOfLearningThemesWidgetState();
}

class _ListOfLearningThemesWidgetState
    extends ConsumerState<ListOfLearningThemesWidget> {
  static const themesImgs = [
    'assets/ui_images/levels_and_themes/select_all.png',
    'assets/ui_images/levels_and_themes/lvl_A1.png',
    'assets/ui_images/levels_and_themes/lvl_A2.png',
    'assets/ui_images/levels_and_themes/lvl_B1.png',
    'assets/ui_images/levels_and_themes/lvl_B2.png',
    'assets/ui_images/levels_and_themes/lvl_C1.png',
    'assets/ui_images/levels_and_themes/food.png',
    'assets/ui_images/levels_and_themes/professions.png',
    'assets/ui_images/levels_and_themes/clothe.png',
    'assets/ui_images/levels_and_themes/sport.png',
    'assets/ui_images/levels_and_themes/family.png',
    'assets/ui_images/levels_and_themes/home.png',
    'assets/ui_images/levels_and_themes/city.png',
    'assets/ui_images/levels_and_themes/colors.png',
    'assets/ui_images/levels_and_themes/trips.png',
    'assets/ui_images/levels_and_themes/countries.png',
    'assets/ui_images/levels_and_themes/weather.png',
    'assets/ui_images/levels_and_themes/months.png',
    'assets/ui_images/levels_and_themes/animals.png',
    'assets/ui_images/levels_and_themes/irregular_verbs.png',
    'assets/ui_images/levels_and_themes/phrasal_verbs.png',
  ];
  final colors = [
    MyColors.greenColor,
    MyColors.orangeColor,
    MyColors.blueColor,
    MyColors.pinkColor
  ];

  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final listOfThemes =
        ref.watch(chooseLevelAndThemesProvider).listOfSelectedThemes;
    final List<int> sortedList = List.from(listOfThemes);
    sortedList.removeWhere((element) => element == 0);
    sortedList.sort();
    final themeColors = [
      colors[0],
      colors[1],
      colors[2],
      colors[0],
      colors[3],
      colors[1],
      colors[2],
      colors[3],
      colors[1],
      colors[0],
      colors[1],
      colors[2],
      colors[3],
      colors[1],
      colors[0],
      colors[2],
      colors[3],
      colors[1],
      colors[0],
      colors[3],
      colors[1],
    ];
    final themesLabels = [
      AppLanguage.listOfLanguages[widget.lang][LangKey.selectAll],
      'Beginner',
      'Elementary',
      'Intermediate',
      'Upper-Intermediate',
      'Advanced',
      AppLanguage.listOfLanguages[widget.lang][LangKey.foodAndDrinks],
      AppLanguage.listOfLanguages[widget.lang][LangKey.professions],
      AppLanguage.listOfLanguages[widget.lang][LangKey.cloth],
      AppLanguage.listOfLanguages[widget.lang][LangKey.sport],
      AppLanguage.listOfLanguages[widget.lang][LangKey.familyAndFriends],
      AppLanguage.listOfLanguages[widget.lang][LangKey.home],
      AppLanguage.listOfLanguages[widget.lang][LangKey.city],
      AppLanguage.listOfLanguages[widget.lang][LangKey.colors],
      AppLanguage.listOfLanguages[widget.lang][LangKey.trips],
      AppLanguage.listOfLanguages[widget.lang][LangKey.countries],
      AppLanguage.listOfLanguages[widget.lang][LangKey.weather],
      AppLanguage.listOfLanguages[widget.lang][LangKey.months],
      AppLanguage.listOfLanguages[widget.lang][LangKey.animals],
      AppLanguage.listOfLanguages[widget.lang][LangKey.irregularVerbs],
      AppLanguage.listOfLanguages[widget.lang][LangKey.phrasalVerbs],
    ];
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: sortedList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildThemeMainContainer(myParameters, index,
              themeColors[sortedList[index]], themesLabels, sortedList);
        });
  }

  Padding buildThemeMainContainer(MyParameters myParameters, int index,
      Color color, List<String?> themesLabels, List<int> sortedList) {
    return Padding(
      padding: EdgeInsets.only(
          left: myParameters.pixelWidth * 20,
          right: myParameters.pixelWidth * 20,
          top: index != 0 ? myParameters.pixelHeight * 22 : 0,
          bottom: myParameters.pixelHeight * 22),
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            Container(
              height: myParameters.pixelHeight * 136,
              decoration: BoxDecoration(
                  color: isDarkTheme
                      ? MyColors.backColorDarkTheme
                      : MyColors.whiteColor,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: myParameters.pixelWidth * 4,
                        color: MyColors.textLiteGreyColor
                            .withOpacity(isDarkTheme ? 0 : 0.6))
                  ],
                  borderRadius:
                      BorderRadius.circular(myParameters.pixelWidth * 10)),
              child: buildImage(myParameters, index, sortedList),
            ),
            buildTextAndSelect(
                myParameters, themesLabels[sortedList[index]]!, color)
          ],
        ),
      ),
    );
  }

  Row buildImage(MyParameters myParameters, int index, List<int> sortedList) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: myParameters.pixelWidth * 30),
          child: SizedBox(
            height: myParameters.pixelHeight * 80,
            width: myParameters.pixelWidth * 80,
            child: Image.asset(themesImgs[sortedList[index]]),
          ),
        ),
      ],
    );
  }

  Positioned buildTextAndSelect(
      MyParameters myParameters, String themeLabel, Color color) {
    return Positioned(
      left: myParameters.pixelWidth * 136,
      child: Container(
        height: myParameters.pixelHeight * 136,
        width: myParameters.pixelWidth * (390 - 136),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(myParameters.pixelWidth * 10),
                bottomRight: Radius.circular(myParameters.pixelWidth * 10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildThemeLabel(myParameters, themeLabel),
            Padding(
              padding: EdgeInsets.only(
                  left: myParameters.pixelWidth * 20,
                  right: myParameters.pixelWidth * 20,
                  bottom: myParameters.pixelHeight * 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const MyLineIndicatorWidget(
                    value: 0.2,
                  ),
                  Text(
                    '20/100',
                    style: TextStyle(
                        color: MyColors.whiteColor,
                        fontFamily: MyConstants.fontLabel,
                        fontSize: myParameters.pixelWidth * 14,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding buildThemeLabel(MyParameters myParameters, String themeLabel) {
    return Padding(
      padding: EdgeInsets.only(
          left: myParameters.pixelWidth * 20,
          top: myParameters.pixelHeight * 32),
      child: SizedBox(
        width: myParameters.pixelWidth * 180,
        child: Text(
          themeLabel,
          style: TextStyle(
              color: MyColors.whiteColor,
              fontFamily: MyConstants.fontLabel,
              fontSize: myParameters.pixelWidth * 14,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
