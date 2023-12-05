import 'dart:async';

import 'package:one_minute_english/src/screens/start_screen/controller/start_screen_controller.dart';
import 'package:one_minute_english/src/screens/start_screen/view/widgets/introduce_widget.dart';
import 'package:one_minute_english/src/screens/start_screen/view/widgets/next_button_widget.dart';
import 'package:one_minute_english/src/screens/start_screen/view/widgets/shoose_language_widget.dart';
import 'package:one_minute_english/src/screens/start_screen/view/widgets/logo_animation_widget.dart';
import 'package:one_minute_english/src/utils/library.dart';

class StartScreenView extends ConsumerStatefulWidget {
  const StartScreenView({super.key});

  final route = 'start page';

  @override
  ConsumerState<StartScreenView> createState() => _StartScreenViewState();
}

class _StartScreenViewState extends ConsumerState<StartScreenView> {
  @override
  Widget build(BuildContext context) {
    final pageIndex = ref.watch(startScreenProvider).startPageIndex;
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Stack(
            children: [
              const LogoAnimationWidget(),
              pageIndex == 0
                  ? const LanguageChooseWidget()
                  : const IntroduceWidget(),
              const NextButtonWidget()
            ],
          ),
        ),
      ),
    );
  }
}
