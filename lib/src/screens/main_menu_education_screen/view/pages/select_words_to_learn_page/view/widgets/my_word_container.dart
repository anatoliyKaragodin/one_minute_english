import 'package:one_minute_english/src/repo/model/word.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/select_words_to_learn_page/view/widgets/my_play_sound_button.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_text_widget.dart';

class MyWordContainer extends StatelessWidget {
  final Word word;
  final double? width;
  final double? height;
  final double? colorContainerHeight;
  final double? imgPadding;
  final Color color;
  final bool onlyWord;
  const MyWordContainer(
      {super.key,
      required this.word,
      this.width,
      this.height,
      required this.color,
      this.imgPadding,
      required this.onlyWord,
      this.colorContainerHeight});

  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final myHeight = height ?? 396;
    final myWidth = width ?? 301;
    final myColorContainerHeight = colorContainerHeight ?? 151;
    final myImgPadding = imgPadding ?? 60;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: myParameters.pixelHeight * myHeight,
          width: myParameters.pixelWidth * myWidth,
          decoration: BoxDecoration(
              border: Border.all(
                color: MyColors.greyColor!,
                width: myParameters.pixelWidth,
              ),
              borderRadius:
                  BorderRadius.circular(myParameters.pixelWidth * 10)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: myParameters.pixelWidth * myImgPadding,
                vertical: myParameters.pixelWidth * myImgPadding / 2),
            child: SvgPicture.asset(
              word.imgPath,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        Container(
          height: myParameters.pixelHeight * myColorContainerHeight,
          width: myParameters.pixelWidth * myWidth,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(myParameters.pixelWidth * 10))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextWidget(
                text:
                    "${word.word[0].toUpperCase()}${word.word.substring(1).toLowerCase()}",
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
              if (!onlyWord)
                Padding(
                  padding: EdgeInsets.only(
                      top: myParameters.pixelHeight * 10,
                      bottom: myParameters.pixelHeight * 5),
                  child: MyTextWidget(
                    text: word.translation,
                    fontSize: 14,
                  ),
                ),
              if (!onlyWord) Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyPlaySoundButton(
                      soundPath: word.soundPath,
                      iconImg: 'assets/ui_images/main_app/icons/slow.png',
                      slowPlay: true),
                  SizedBox(
                    width: myParameters.pixelWidth * 15,
                  ),
                  MyPlaySoundButton(
                      soundPath: word.soundPath,
                      iconImg: 'assets/ui_images/main_app/icons/play_sound.png',
                      slowPlay: false)
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
