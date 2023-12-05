import 'package:one_minute_english/src/screens/choose_level_and_themes_screen/controller/choose_level_and_themes_controller.dart';
import 'package:one_minute_english/src/utils/library.dart';

import '../../../../utils/app_language/app_language.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/my_colors.dart';
import '../../../../utils/my_parameters.dart';

class ListOfThemesWidget extends ConsumerStatefulWidget {
  final int lang;
  final double? height;
  const ListOfThemesWidget({super.key, required this.lang, this.height});

  @override
  ConsumerState createState() => _ListOfThemesWidgetState();
}

class _ListOfThemesWidgetState extends ConsumerState<ListOfThemesWidget> {
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
    return SizedBox(
      height: myParameters.pixelHeight * (widget.height ?? 670),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 21,
          itemBuilder: (BuildContext context, int index) {
            return buildThemeMainContainer(myParameters, index,
                themeColors[index], listOfThemes.contains(index), themesLabels);
          }),
    );
  }

  Padding buildThemeMainContainer(MyParameters myParameters, int index,
      Color color, bool isSelected, List<String?> themesLabels) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: myParameters.pixelWidth * 36,
          vertical: myParameters.pixelHeight * 10),
      child: InkWell(
        onTap: () {
          ChooseLevelAndThemesController.onTapTheme(ref, index);
        },
        child: Stack(
          children: [
            Container(
              height: myParameters.pixelHeight * 77,
              width: myParameters.pixelWidth * 358,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: myParameters.pixelWidth,
                    color: MyColors.textLiteGreyColor.withOpacity(0.5),
                  ),
                  borderRadius:
                      BorderRadius.circular(myParameters.pixelWidth * 10)),
              child: buildImage(myParameters, index),
            ),
            buildTextAndSelect(
                myParameters, themesLabels[index]!, color, isSelected)
          ],
        ),
      ),
    );
  }

  Row buildImage(MyParameters myParameters, int index) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: myParameters.pixelWidth * 20),
          child: SizedBox(
            height: myParameters.pixelHeight * 45,
            width: myParameters.pixelWidth * 45,
            child: Image.asset(themesImgs[index]),
          ),
        ),
      ],
    );
  }

  Positioned buildTextAndSelect(MyParameters myParameters, String themeLabel,
      Color color, bool isSelected) {
    return Positioned(
      left: myParameters.pixelWidth * 87,
      child: Container(
        height: myParameters.pixelHeight * 77,
        width: myParameters.pixelWidth * (358 - 87),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(myParameters.pixelWidth * 10),
                bottomRight: Radius.circular(myParameters.pixelWidth * 10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildThemeLabel(myParameters, themeLabel),
            buildSelectedCircle(myParameters, isSelected)
          ],
        ),
      ),
    );
  }

  Padding buildThemeLabel(MyParameters myParameters, String themeLabel) {
    return Padding(
      padding: EdgeInsets.only(left: myParameters.pixelWidth * 20),
      child: SizedBox(
        width: myParameters.pixelWidth * 180,
        child: Text(
          themeLabel,
          style: TextStyle(
              color: MyColors.whiteColor,
              fontFamily: MyConstants.fontLabel,
              fontSize: myParameters.pixelWidth * 18,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }

  Padding buildSelectedCircle(
    MyParameters myParameters,
    bool isSelected,
  ) {
    return Padding(
      padding: EdgeInsets.only(right: myParameters.pixelWidth * 20),
      child: Container(
        height: myParameters.pixelHeight * 29,
        width: myParameters.pixelWidth * 29,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: MyColors.whiteColor!.withOpacity(isSelected ? 1 : 0),
            border: Border.all(
                color: MyColors.whiteColor!,
                width: myParameters.pixelWidth * 5)),
      ),
    );
  }
}
