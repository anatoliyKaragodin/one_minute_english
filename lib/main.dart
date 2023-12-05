import 'package:one_minute_english/src/repo/db/db_helper.dart';
import 'package:one_minute_english/src/repo/model/word.dart';
import 'package:one_minute_english/src/screens/choose_level_and_themes_screen/view/choose_level_and_themes_screen_view.dart';
import 'package:one_minute_english/src/screens/main_app_menu_screen/view/main_app_menu_screen_view.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/main_menu_education_screen_view.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/select_words_to_learn_page/view/select_words_to_learn.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/training_words_view.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/training_complete_page.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/training_word_by_theme_complete.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/training_words/view/widgets/training_words_repaet_or_new_learn.dart';
import 'package:one_minute_english/src/screens/main_menu_progress_screen/view/pages/difficult_words/difficult_words_page.dart';
import 'package:one_minute_english/src/services/notifications_service.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/screens/start_screen/view/start_screen_view.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:timezone/data/latest.dart' as tz;

Brightness systemBrightness = Brightness.light;
bool isDarkTheme = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationsService().init();
  tz.initializeTimeZones();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  systemBrightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;
  // isDarkTheme = systemBrightness == Brightness.dark ? true : false;
  isDarkTheme = true;

  await DatabaseHelper.instance.database;

  /// Debug check word from DB
  List<Word> word = await DatabaseHelper.instance
      .getWordsByTheme(theme: 'Beginner', language: 'russian');
  debugPrint(word[0].toString());

  ///
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor:
            isDarkTheme ? MyColors.blackColor87 : MyColors.whiteColor,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple, brightness: systemBrightness),
        useMaterial3: false,
      ),
      home: const StartScreenView(),
      routes: {
        const StartScreenView().route: (context) => const StartScreenView(),
        const ChooseLvlAndThemesScreenView().route: (context) =>
            const ChooseLvlAndThemesScreenView(),
      },
    );
  }
}
