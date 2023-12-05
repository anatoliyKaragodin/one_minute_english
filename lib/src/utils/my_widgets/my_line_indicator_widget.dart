import 'package:one_minute_english/src/utils/library.dart';

import '../my_colors.dart';
import '../my_parameters.dart';

class MyLineIndicatorWidget extends StatelessWidget {
  final double value;
  final Color? color;
  final double? width;
  final double? height;
  const MyLineIndicatorWidget(
      {super.key, required this.value, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final valueWidth = width ?? myParameters.pixelWidth * 142;
    return Stack(children: [
      Container(
        width: width ?? myParameters.pixelWidth * 142,
        height: height ?? myParameters.pixelHeight * 12,
        decoration: BoxDecoration(
            color: MyColors.whiteColor,
            borderRadius: BorderRadius.circular(myParameters.pixelWidth * 6)),
      ),
      Positioned(
        left: 0,
        child: AnimatedContainer(
          width: valueWidth * value,
          height: height ?? myParameters.pixelHeight * 12,
          decoration: BoxDecoration(
              color: MyColors.yellowColor,
              borderRadius: BorderRadius.circular(myParameters.pixelWidth * 6)),
          duration: const Duration(milliseconds: 300),
        ),
      ),
    ]);
  }
}
