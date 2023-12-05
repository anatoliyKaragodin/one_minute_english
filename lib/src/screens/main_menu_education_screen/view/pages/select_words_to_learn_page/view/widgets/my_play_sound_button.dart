import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';

class MyPlaySoundButton extends StatelessWidget {
  final bool slowPlay;
  final String soundPath;
  final String iconImg;
  const MyPlaySoundButton(
      {super.key,
      required this.soundPath,
      required this.iconImg,
      required this.slowPlay});

  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final size = slowPlay ? 30 : 52;
    final player = AudioPlayer();
    if (slowPlay) {
      player.setPlaybackRate(0.6);
    }
    return InkWell(
      onTap: () {
        player.play(AssetSource(soundPath));
      },
      child: Container(
        height: myParameters.pixelWidth * size,
        width: myParameters.pixelWidth * size,
        decoration: BoxDecoration(
          border: Border.all(color: MyColors.whiteColor!),
          shape: BoxShape.circle,
        ),
        child: Center(
            child: Padding(
          padding: EdgeInsets.all(slowPlay
              ? 5 * myParameters.pixelWidth
              : 10 * myParameters.pixelWidth),
          child: Image.asset(iconImg),
        )),
      ),
    );
  }
}
