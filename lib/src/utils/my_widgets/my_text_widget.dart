import 'package:one_minute_english/src/utils/library.dart';

import '../constants.dart';
import '../my_parameters.dart';

class MyTextWidget extends StatelessWidget {
  final String text;
  final TextAlign? align;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  const MyTextWidget(
      {super.key,
      required this.text,
      this.fontSize,
      this.color,
      this.fontWeight,
      this.align});

  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);

    return Text(
      text,
      textAlign: align ?? TextAlign.center,
      style: TextStyle(
          color: color,
          fontFamily: MyConstants.fontLabel,
          fontSize: myParameters.pixelWidth * (fontSize ?? 16),
          fontWeight: fontWeight ?? FontWeight.w400),
    );
  }
}
