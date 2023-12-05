import 'package:one_minute_english/src/screens/choose_level_and_themes_screen/view/widgtes/list_of_themes_widget.dart';
import 'package:one_minute_english/src/screens/main_menu_settings/controller/settings_controller.dart';
import 'package:one_minute_english/src/screens/start_screen/controller/start_screen_controller.dart';
import 'package:one_minute_english/src/utils/app_language/app_language.dart';
import 'package:one_minute_english/src/utils/constants.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_color_button.dart';

class ChooseThemesSettingsView extends ConsumerStatefulWidget {
  const ChooseThemesSettingsView({super.key});

  final route = 'choose themes settings page';

  @override
  ConsumerState createState() => _ChooseThemesSettingsView();
}

class _ChooseThemesSettingsView
    extends ConsumerState<ChooseThemesSettingsView> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final lang = ref.watch(startScreenProvider).chosenLanguageIndex;
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                  top: myParameters.pixelHeight * 77,
                  bottom: myParameters.pixelHeight * 10),
              child: Column(
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
                          AppLanguage.listOfLanguages[lang]
                              [LangKey.themesForLearning]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: MyConstants.fontLabel,
                              fontSize: myParameters.pixelWidth * 22,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      SizedBox(
                        width: myParameters.pixelWidth * 50,
                      )
                    ],
                  ),
                  Text(
                    AppLanguage.listOfLanguages[lang][LangKey.selectThemes]!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: MyConstants.fontLabel,
                        fontSize: myParameters.pixelWidth * 16,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          ),
          ListOfThemesWidget(
            lang: lang,
            height: 590,
          ),
          Padding(
            padding: EdgeInsets.only(top: myParameters.pixelHeight * 20),
            child: MyColorButtonWidget(
                func: () => SettingsController.onTapIndexPage(ref, 3),
                text: AppLanguage.listOfLanguages[lang][LangKey.nextButton]!),
          )
        ],
      ),
    );
  }
}
