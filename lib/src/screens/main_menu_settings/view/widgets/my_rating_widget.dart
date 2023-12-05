import 'package:one_minute_english/src/screens/main_menu_settings/controller/settings_controller.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';

import '../../../../../main.dart';
import '../../../../utils/my_parameters.dart';

class MyRatingWidget extends ConsumerStatefulWidget {
  final int rating;
  const MyRatingWidget({super.key, required this.rating});

  @override
  ConsumerState<MyRatingWidget> createState() => _MyRatingWidgetState();
}

class _MyRatingWidgetState extends ConsumerState<MyRatingWidget> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);

    return SizedBox(
      width: myParameters.pixelWidth * 159,
      height: myParameters.pixelHeight * 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            5,
            (index) => InkWell(
                  onTap: () => SettingsController.onRatingTap(ref, index + 1),
                  child: Image.asset(
                    'assets/ui_images/main_app/settings/star.png',
                    color: index <= widget.rating - 1
                        ? MyColors.orangeColor
                        : isDarkTheme
                            ? MyColors.whiteColor
                            : MyColors.blackColor12,
                  ),
                )),
      ),
    );
  }
}
