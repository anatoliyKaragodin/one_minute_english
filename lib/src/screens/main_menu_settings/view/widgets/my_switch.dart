import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';

import '../../../../../main.dart';
import '../../../../utils/my_parameters.dart';

class MySwitch extends StatelessWidget {
  final double? height;
  final double? width;
  final bool isOn;
  final Color? backgroundColor;
  final Function onTap;

  const MySwitch(
      {super.key,
      this.height,
      this.width,
      this.backgroundColor,
      required this.isOn,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);

    return InkWell(
      onTap: () => onTap(),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: height ?? myParameters.pixelHeight * 22,
            width: width ?? myParameters.pixelWidth * 44,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: MyColors.blackColor12!,
                    blurRadius: 5,
                  ),
                ],
                borderRadius:
                    BorderRadius.circular(myParameters.pixelHeight * 22),
                color: isOn
                    ? backgroundColor ?? MyColors.greenColor
                    : isDarkTheme
                        ? MyColors.greyColor
                        : Colors.grey[200]),
          ),
          AnimatedPositioned(
            left: isOn ? myParameters.pixelWidth * 22 : 0,
            duration: const Duration(milliseconds: 50),
            child: Container(
              height: height ?? myParameters.pixelHeight * 22,
              width: height ?? myParameters.pixelHeight * 22,
              decoration: BoxDecoration(
                  color: MyColors.whiteColor, shape: BoxShape.circle),
            ),
          )
        ],
      ),
    );
  }
}
