import 'package:one_minute_english/src/screens/set_notification_screen/controller/set_notification_screen_controller.dart';
import 'package:one_minute_english/src/screens/set_notification_screen/view/widgets/my_time_notification_widget.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_color_button.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../../utils/app_language/app_language.dart';
import '../../../utils/constants.dart';
import '../../../utils/my_parameters.dart';
import '../../start_screen/controller/start_screen_controller.dart';

class SetNotificationScreenView extends ConsumerStatefulWidget {
  const SetNotificationScreenView({super.key});

  @override
  ConsumerState createState() => _SetNotificationScreenViewState();
}

class _SetNotificationScreenViewState
    extends ConsumerState<SetNotificationScreenView> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final langIndex = ref.watch(startScreenProvider).chosenLanguageIndex;
    final lang = AppLanguage.listOfLanguages[langIndex];
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildText(myParameters, lang),
          Padding(
              padding: EdgeInsets.only(bottom: myParameters.pixelHeight * 70),
              child: const MyTimeNotificationCarouselWidget()),
          Padding(
            padding: EdgeInsets.only(bottom: myParameters.pixelHeight * 50),
            child: MyColorButtonWidget(
                func: () => SetNotificationScreenController.onTapNextButton(
                    ref, context),
                text: lang[LangKey.nextButton]!),
          )
        ],
      ),
    );
  }

  Padding buildText(MyParameters myParameters, Map<LangKey, String> lang) {
    return Padding(
      padding: EdgeInsets.only(top: myParameters.pixelHeight * 136),
      child: SizedBox(
        height: myParameters.pixelHeight * 137,
        width: myParameters.pixelWidth * 383,
        child: Column(
          children: [
            Text(
              lang[LangKey.createNewGoodHabit]!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: MyConstants.fontLabel,
                  fontSize: myParameters.pixelWidth * 25,
                  fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: EdgeInsets.only(top: myParameters.pixelHeight * 27),
              child: SizedBox(
                width: myParameters.pixelWidth * 228,
                child: Text(
                  lang[LangKey.turnOnRemindersToPracticeEnglish]!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: MyColors.textLiteGreyColor,
                      fontFamily: MyConstants.fontLabel,
                      fontSize: myParameters.pixelWidth * 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
