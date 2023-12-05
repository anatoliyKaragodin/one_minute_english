import 'package:one_minute_english/src/repo/model/word.dart';
import 'package:one_minute_english/src/screens/main_menu_education_screen/view/pages/select_words_to_learn_page/view/widgets/my_play_sound_button.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_text_widget.dart';

class InputWordResultDialog extends StatelessWidget {
  final Word word;
  const InputWordResultDialog({super.key, required this.word});
  static const iconList = [
    'assets/ui_images/main_app/icons/slow.png',
    'assets/ui_images/main_app/icons/play_sound_2.png'
  ];
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final player = AudioPlayer();

    return Dialog(
      backgroundColor: MyColors.backColorDarkTheme,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(myParameters.pixelWidth * 10)),
      child: SizedBox(
        height: myParameters.pixelHeight * 218,
        width: myParameters.pixelWidth * 362,
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: myParameters.pixelHeight * 50),
              child: MyTextWidget(
                text: word.word,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildPlayButton(player, myParameters, iconList[0], true),
                SizedBox(
                  width: myParameters.pixelWidth * 18,
                ),
                buildPlayButton(player, myParameters, iconList[1], false)
              ],
            )
          ],
        ),
      ),
    );
  }

  InkWell buildPlayButton(AudioPlayer player, MyParameters myParameters,
      String iconImg, bool slowPlay) {
    return InkWell(
      onTap: () {
        if (slowPlay) {
          player.setPlaybackRate(0.6);
        } else {
          player.setPlaybackRate(1);
        }
        player.play(AssetSource(word.soundPath));
      },
      child: Container(
        height: myParameters.pixelWidth * 38,
        width: myParameters.pixelWidth * 38,
        decoration: BoxDecoration(
          border: Border.all(color: MyColors.greyColor!),
          shape: BoxShape.circle,
        ),
        child: Center(
            child: Padding(
          padding: EdgeInsets.all(8 * myParameters.pixelWidth),
          child: Image.asset(
            iconImg,
            color: MyColors.mainColor,
          ),
        )),
      ),
    );
  }
}
