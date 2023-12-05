import 'package:one_minute_english/src/repo/model/words_controller.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/controller/training_words_controller.dart';
import 'package:one_minute_english/src/screens/start_screen/controller/start_screen_controller.dart';
import 'package:one_minute_english/src/utils/app_language/app_language.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_color_button.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_text_widget.dart';

class TrainingComplete extends ConsumerStatefulWidget {
  const TrainingComplete({super.key});
final route = 'training complete page';
  @override
  ConsumerState createState() => _TrainingCompleteState();
}

class _TrainingCompleteState extends ConsumerState<TrainingComplete> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final langIndex = ref.watch(startScreenProvider).chosenLanguageIndex;
    final lang = AppLanguage.listOfLanguages[langIndex];
    final words = ref.watch(wordsProvider);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: myParameters.pixelHeight * 252),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: myParameters.pixelHeight * 350,
              child: Column(
                children: [
                  Expanded(
                      child: Image.asset(
                          'assets/ui_images/main_app/icons/well_done.png')),
                  SizedBox(height: myParameters.pixelHeight*63,),
                  MyTextWidget(
                    text: lang[LangKey.missionComplete]!,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                  SizedBox(height: myParameters.pixelHeight*20,),

                  SizedBox(
                    width: myParameters.pixelWidth*340,
                    child: MyTextWidget(
                      text: lang[LangKey.wordsSentForRepetition]!,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: myParameters.pixelHeight * 50),
              child: MyColorButtonWidget(
                  func: () {
                    TrainingWordsController.onTapCompleteTraining(context, ref);
                  }, text: lang[LangKey.nextButton]!),
            )
          ],
        ),
      ),
    );
  }


}
