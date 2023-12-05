import 'package:one_minute_english/main.dart';
import 'package:one_minute_english/src/screens/main_app_menu_screen/controller/main_app_menu_controller.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/main_menu_education_screen_view.dart';
import 'package:one_minute_english/src/screens/main_menu_progress_screen/view/main_menu_progress_screen_view.dart';
import 'package:one_minute_english/src/screens/main_menu_settings/view/settings_view.dart';
import 'package:one_minute_english/src/utils/constants.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';

import '../../../utils/app_language/app_language.dart';
import '../../../utils/my_parameters.dart';
import '../../start_screen/controller/start_screen_controller.dart';

class MainAppMenuScreenView extends ConsumerStatefulWidget {
  const MainAppMenuScreenView({super.key});

  final route = 'main app menu page';

  @override
  ConsumerState createState() => _MainAppMenuScreenViewState();
}

class _MainAppMenuScreenViewState extends ConsumerState<MainAppMenuScreenView> {
  static const icons = [
    'assets/ui_images/main_app/icons/bulb.png',
    'assets/ui_images/main_app/icons/progress.png',
    'assets/ui_images/main_app/icons/settings.png'
  ];
  List<Widget> menuPages = [
    const MainMenuEducationScreenView(),
    const MainMenuProgressScreenView(),
    const SettingsView()
  ];

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final langIndex = ref.watch(startScreenProvider).chosenLanguageIndex;
    final lang = AppLanguage.listOfLanguages[langIndex];
    final menuIndex = ref.watch(mainAppMenuProvider).menuIndex;

    final menuLabels = [
      lang[LangKey.education],
      lang[LangKey.progress],
      lang[LangKey.settings]
    ];
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: PageView.builder(
                  controller: pageController,
                  itemCount: menuPages.length,
                  onPageChanged: (int index) {
                    MainAppMenuController.onTapMenuItem(ref, index);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return menuPages[index];
                  })),
          buildBottomMenu(myParameters, menuIndex, menuLabels)
        ],
      ),
    );
  }

  Container buildBottomMenu(
      MyParameters myParameters, int menuIndex, List<String?> menuLabels) {
    return Container(
      width: myParameters.width,
      height: myParameters.pixelHeight * 89,
      decoration: BoxDecoration(
          color:
              isDarkTheme ? MyColors.backColorDarkTheme : MyColors.whiteColor,
          boxShadow: [
            BoxShadow(
                blurRadius: 7,
                color: MyColors.greyColorLite!.withOpacity(isDarkTheme ? 0 : 1))
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(myParameters.pixelWidth * 30),
              topRight: Radius.circular(myParameters.pixelWidth * 30))),
      child: Row(
        children: List.generate(
            menuPages.length,
            (index) => InkWell(
                  onTap: () {
                    pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                    MainAppMenuController.onTapMenuItem(ref, index);
                  },
                  child: SizedBox(
                    width: myParameters.pixelWidth * 140,
                    height: myParameters.pixelHeight * 53,
                    child: Column(
                      children: [
                        Image.asset(
                          icons[index],
                          color: index == menuIndex
                              ? MyColors.mainColor
                              : isDarkTheme
                                  ? MyColors.textLiteGreyColor
                                  : MyColors.blackColor87,
                          height: myParameters.pixelHeight * 26,
                          width: myParameters.pixelWidth * 26,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: myParameters.pixelHeight * 10),
                          child: Text(
                            menuLabels[index]!,
                            style: TextStyle(
                                color: index == menuIndex
                                    ? MyColors.mainColor
                                    : isDarkTheme
                                        ? MyColors.textLiteGreyColor
                                        : MyColors.blackColor87,
                                fontFamily: MyConstants.fontLabel,
                                fontSize: myParameters.pixelWidth * 14),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
