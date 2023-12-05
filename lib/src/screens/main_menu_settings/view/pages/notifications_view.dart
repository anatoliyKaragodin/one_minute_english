import 'package:one_minute_english/src/screens/main_menu_settings/controller/settings_controller.dart';
import 'package:one_minute_english/src/screens/main_menu_settings/view/widgets/my_switch.dart';
import 'package:one_minute_english/src/screens/set_notification_screen/view/widgets/my_time_notification_widget.dart';
import 'package:one_minute_english/src/screens/start_screen/controller/start_screen_controller.dart';
import 'package:one_minute_english/src/utils/app_language/app_language.dart';
import 'package:one_minute_english/src/utils/constants.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';

class NotificationsView extends ConsumerStatefulWidget {
  const NotificationsView({super.key});
  final route = 'notifications page';

  @override
  ConsumerState createState() => _NotificationsViewState();
}

class _NotificationsViewState extends ConsumerState<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final langIndex = ref.watch(startScreenProvider).chosenLanguageIndex;
    final lang = AppLanguage.listOfLanguages[langIndex];
    final settings = ref.watch(settingsProvider);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: myParameters.pixelWidth * 20,
                vertical: myParameters.pixelHeight * 77),
            child: buildTopRow(lang, myParameters, settings.notificationsIsOn),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: myParameters.pixelHeight * (220 - 77)),
            child: const MyTimeNotificationCarouselWidget(),
          )
        ],
      ),
    );
  }

  Row buildTopRow(Map<LangKey, String> lang, MyParameters myParameters,
      bool notificationsIsOn) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () => SettingsController.onTapIndexPage(ref, 0),
            icon: Icon(
              Icons.close_rounded,
              color: MyColors.greyColor,
            )),
        Text(
          lang[LangKey.notifications]!,
          style: TextStyle(
              fontSize: myParameters.pixelWidth * 22,
              fontFamily: MyConstants.fontLabel),
        ),
        MySwitch(
            isOn: notificationsIsOn,
            onTap: () => SettingsController.onTapNotificationsSwitch(ref))
      ],
    );
  }
}
