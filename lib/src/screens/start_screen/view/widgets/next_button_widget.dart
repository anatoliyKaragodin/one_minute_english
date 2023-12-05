import 'dart:async';

import 'package:one_minute_english/src/screens/start_screen/controller/start_screen_controller.dart';
import 'package:one_minute_english/src/utils/constants.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';

import '../../../../utils/app_language/app_language.dart';
import '../../../../utils/my_parameters.dart';

class NextButtonWidget extends ConsumerStatefulWidget {
  const NextButtonWidget({super.key});

  @override
  ConsumerState createState() => _NextButtonWidgetState();
}

class _NextButtonWidgetState extends ConsumerState<NextButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final startScreenState = ref.watch(startScreenProvider);
    final nextButtonOpacity = startScreenState.nextButtonOpacity;
    final language = ref.watch(startScreenProvider).chosenLanguageIndex;
    return Positioned(
      top: myParameters.pixelHeight * 823,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: myParameters.pixelWidth * 20),
        child: AnimatedOpacity(
          opacity: nextButtonOpacity,
          duration: const Duration(milliseconds: 500),
          child: InkWell(
            onTap: () {
              StartScreenController.onNextButtonTap(ref, context);
            },
            child: Container(
              height: myParameters.pixelHeight * 54,
              width: myParameters.pixelWidth * 390,
              decoration: BoxDecoration(
                  color: MyColors.mainColor,
                  boxShadow: [
                    BoxShadow(
                      color: MyColors.mainColorShadow,
                      spreadRadius: 0,
                      blurRadius: 0,
                      offset: const Offset(0, 5),
                    ),
                  ],
                  borderRadius:
                      BorderRadius.circular(myParameters.pixelHeight * 10)),
              child: Center(
                child: Text(
                  AppLanguage.listOfLanguages[language][LangKey.nextButton]!,
                  style: TextStyle(
                      fontFamily: MyConstants.fontLabel,
                      fontWeight: FontWeight.w900,
                      fontSize: myParameters.pixelWidth * 18,
                      color: MyColors.whiteColor),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
