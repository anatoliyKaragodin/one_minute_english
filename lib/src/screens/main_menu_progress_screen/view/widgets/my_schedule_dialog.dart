import 'package:one_minute_english/main.dart';
import 'package:one_minute_english/src/screens/main_menu_progress_screen/controller/progress_controller.dart';
import 'package:one_minute_english/src/screens/main_menu_progress_screen/view/widgets/my_calendar.dart';
import 'package:one_minute_english/src/screens/start_screen/controller/start_screen_controller.dart';
import 'package:one_minute_english/src/utils/app_language/app_language.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_color_button.dart';

class MyScheduleDialog extends ConsumerStatefulWidget {
  const MyScheduleDialog({super.key});

  @override
  ConsumerState createState() => _MyScheduleDialogState();
}

class _MyScheduleDialogState extends ConsumerState<MyScheduleDialog> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);

    final langIndex = ref.watch(startScreenProvider).chosenLanguageIndex;
    final lang = AppLanguage.listOfLanguages[langIndex];
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(myParameters.pixelWidth * 30)),
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      backgroundColor:
          isDarkTheme ? MyColors.backColorDarkTheme : MyColors.whiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const MyCalendar(),
          Padding(
            padding: EdgeInsets.only(bottom: myParameters.pixelHeight * 50),
            child: MyColorButtonWidget(
                func: () => ProgressController.onTapNextInSchedule(context),
                text: lang[LangKey.nextButton]!),
          )
        ],
      ),
    );
  }
}
