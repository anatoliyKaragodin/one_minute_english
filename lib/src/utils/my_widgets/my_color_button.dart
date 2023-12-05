import 'package:one_minute_english/src/utils/constants.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';

import '../my_parameters.dart';

class MyColorButtonWidget extends ConsumerStatefulWidget {
  final Function func;
  final String text;
  final double? height;
  final double? width;
  final double? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  const MyColorButtonWidget(
      {super.key,
      required this.func,
      required this.text,
      this.height,
      this.padding,
      this.width,
      this.fontSize,
      this.fontWeight,
      this.color});

  @override
  ConsumerState createState() => _MyColorButtonWidget();
}

class _MyColorButtonWidget extends ConsumerState<MyColorButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final color = widget.color ?? MyColors.mainColor;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: widget.padding ?? myParameters.pixelWidth * 20),
      child: InkWell(
        onTap: () {
          widget.func();
        },
        child: Container(
          height: widget.height ?? myParameters.pixelHeight * 54,
          width: widget.width ?? myParameters.pixelWidth * 390,
          decoration: BoxDecoration(
              color: widget.color ?? MyColors.mainColor,
              border: color == MyColors.whiteColor?Border.all(color: Color.fromARGB(
                color.alpha,
                (color.red * 0.7).toInt(),
                (color.green * 0.7).toInt(),
                (color.blue * 0.7).toInt(),
              )):null,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(
                    color.alpha,
                    (color.red * 0.7).toInt(),
                    (color.green * 0.7).toInt(),
                    (color.blue * 0.7).toInt(),
                  ),
                  spreadRadius: 0,
                  blurRadius: 0,
                  offset: const Offset(0, 5),
                ),
              ],
              borderRadius:
                  BorderRadius.circular(myParameters.pixelHeight * 10)),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                  fontFamily: MyConstants.fontLabel,
                  fontWeight: widget.fontWeight ?? FontWeight.w900,
                  fontSize: widget.fontSize ?? myParameters.pixelWidth * 18,
                  color: color == MyColors.whiteColor
                      ? MyColors.blackColor87
                      : MyColors.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
