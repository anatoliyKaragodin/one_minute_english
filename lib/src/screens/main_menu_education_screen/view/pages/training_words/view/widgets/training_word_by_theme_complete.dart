import 'package:one_minute_english/src/repo/model/words_controller.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/controller/training_words_controller.dart';
import 'package:one_minute_english/src/screens/start_screen/controller/start_screen_controller.dart';
import 'package:one_minute_english/src/utils/app_language/app_language.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_color_button.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_text_widget.dart';

class TrainingWordByThemeComplete extends ConsumerStatefulWidget {
  const TrainingWordByThemeComplete({super.key});

  @override
  ConsumerState<TrainingWordByThemeComplete> createState() =>
      _TrainingWordByThemeCompleteState();
}

class _TrainingWordByThemeCompleteState
    extends ConsumerState<TrainingWordByThemeComplete> {
  final route = 'training word by theme complete page';

  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final langIndex = ref.watch(startScreenProvider).chosenLanguageIndex;
    final lang = AppLanguage.listOfLanguages[langIndex];
    final words = ref.watch(wordsProvider);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: myParameters.pixelHeight * 74),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildTopTextContainer(lang, myParameters),
            SizedBox(
              height: myParameters.pixelHeight * 213,
              child: Column(
                children: [
                  Expanded(
                      child: Image.asset(
                          'assets/ui_images/levels_and_themes/city.png')),
                  MyTextWidget(
                    text: 'В городе',
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: myParameters.pixelHeight * 50),
              child: MyColorButtonWidget(
                  func: () {
                    TrainingWordsController.onTapNextInComplWordsByTheme(context);
                  }, text: lang[LangKey.nextButton]!),
            )
          ],
        ),
      ),
    );
  }

  SizedBox buildTopTextContainer(
      Map<LangKey, String> lang, MyParameters myParameters) {
    return SizedBox(
      child: Column(
        children: [
          MyTextWidget(
            text: lang[LangKey.wellDone]!,
            fontSize: 26,
            fontWeight: FontWeight.w900,
          ),
          SizedBox(
            height: myParameters.pixelHeight * 17,
          ),
          MyTextWidget(
            text: lang[LangKey.wordsStudiedByTheme]!,
            fontSize: 22,
            fontWeight: FontWeight.w900,
          )
        ],
      ),
    );
  }
}
