import 'library.dart';
import 'my_colors.dart';

class MyParameters {
  final BuildContext context;
  late double height;
  late double width;
  late double pixelHeight;
  late double pixelWidth;
  late BorderRadius roundedBorders;
  late TextStyle middleTextStyle;
  late TextStyle middleTextStyleWhite;
  late TextStyle bigTextStyle;

  MyParameters(this.context) {
    height = MediaQuery.of(context).size.longestSide;
    width = MediaQuery.of(context).size.shortestSide;
    pixelHeight = height / 932;
    pixelWidth = width / 430;
    roundedBorders = BorderRadius.circular(height * 0.05);
    middleTextStyle = TextStyle(
        fontSize: height * 0.03,
        fontWeight: FontWeight.bold,
        color: MyColors.blackColor87!.withOpacity(0.7));
    middleTextStyleWhite = TextStyle(
        fontSize: height * 0.03,
        fontWeight: FontWeight.bold,
        color: MyColors.whiteColor);
    bigTextStyle = TextStyle(
        fontSize: height * 0.05,
        fontWeight: FontWeight.bold,
        color: MyColors.blackColor87!.withOpacity(0.7));
  }
}
