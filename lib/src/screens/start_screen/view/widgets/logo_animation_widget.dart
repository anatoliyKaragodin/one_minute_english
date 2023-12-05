import 'dart:async';

import 'package:one_minute_english/src/screens/start_screen/controller/start_screen_controller.dart';
import 'package:one_minute_english/src/utils/library.dart';

import '../../../../utils/my_parameters.dart';

class LogoAnimationWidget extends ConsumerStatefulWidget {
  const LogoAnimationWidget({super.key});

  @override
  ConsumerState<LogoAnimationWidget> createState() =>
      _LogoAnimationWidgetState();
}

class _LogoAnimationWidgetState extends ConsumerState<LogoAnimationWidget> {
  static const String logoPath = 'assets/ui_images/logo_small.png';

  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final logoOpacity = ref.watch(startScreenProvider).logoOpacity;
    return Center(
      child: AnimatedOpacity(
        curve: Curves.easeOut,
        opacity: logoOpacity,
        duration: const Duration(milliseconds: 500),
        child: Image.asset(
          logoPath,
          height: myParameters.pixelHeight * 102,
          width: myParameters.pixelWidth * 183,
        ),
      ),
    );
  }
}
