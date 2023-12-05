import 'package:one_minute_english/src/screens/main_menu_settings/controller/settings_controller.dart';
import 'package:one_minute_english/src/screens/start_screen/controller/start_screen_controller.dart';
import 'package:one_minute_english/src/utils/app_language/app_language.dart';
import 'package:one_minute_english/src/utils/constants.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_color_button.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_text_widget.dart';

class FeedbackView extends ConsumerStatefulWidget {
  const FeedbackView({super.key});
  final route = 'feedback page';
  @override
  ConsumerState createState() => _FeedbackViewState();
}

class _FeedbackViewState extends ConsumerState<FeedbackView> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final langIndex = ref.watch(startScreenProvider).chosenLanguageIndex;
    final lang = AppLanguage.listOfLanguages[langIndex];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: myParameters.pixelWidth * 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                buildCloseIcon(myParameters),
                buildImage(myParameters),
                buildText(myParameters, lang),
                buildTextInput(myParameters, lang),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: myParameters.pixelHeight * 50),
              child: MyColorButtonWidget(
                  func: () => null, text: lang[LangKey.send]!),
            )
          ],
        ),
      ),
    );
  }

  SizedBox buildTextInput(
      MyParameters myParameters, Map<LangKey, String> lang) {
    return SizedBox(
      width: myParameters.pixelWidth * 390,
      height: myParameters.pixelHeight * 70,
      child: TextField(
        cursorColor: MyColors.mainColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.mainColor),
            borderRadius: BorderRadius.circular(myParameters.pixelWidth * 10),
          ),
          hintText: lang[LangKey.yourMessage],
          hintStyle: TextStyle(
              fontFamily: MyConstants.fontLabel,
              fontSize: myParameters.pixelWidth * 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(myParameters.pixelWidth * 10),
          ),
        ),
      ),
    );
  }

  Padding buildText(MyParameters myParameters, Map<LangKey, String> lang) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: myParameters.pixelHeight * 40),
      child: SizedBox(
          width: myParameters.pixelWidth * 225,
          child: MyTextWidget(text: lang[LangKey.whatWouldYouLikeToChange]!)),
    );
  }

  Align buildImage(MyParameters myParameters) {
    return Align(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/ui_images/main_app/settings/feedback.png',
        height: myParameters.pixelHeight * 126,
        width: myParameters.pixelWidth * 126,
      ),
    );
  }

  Align buildCloseIcon(MyParameters myParameters) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(top: myParameters.pixelHeight * 77),
        child: IconButton(
            onPressed: () {
              SettingsController.onTapIndexPage(ref, 0);
            },
            icon: Icon(
              Icons.close_rounded,
              color: MyColors.greyColor!,
            )),
      ),
    );
  }
}
