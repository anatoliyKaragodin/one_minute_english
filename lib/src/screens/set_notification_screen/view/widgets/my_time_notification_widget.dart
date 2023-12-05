import 'dart:math';

import 'package:one_minute_english/main.dart';
import 'package:one_minute_english/src/screens/set_notification_screen/controller/set_notification_screen_controller.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';

import '../../../../utils/my_parameters.dart';

class MyTimeNotificationCarouselWidget extends ConsumerStatefulWidget {
  const MyTimeNotificationCarouselWidget({super.key});

  @override
  ConsumerState createState() => _MyTimeNotificationCarouselWidgetState();
}

class _MyTimeNotificationCarouselWidgetState
    extends ConsumerState<MyTimeNotificationCarouselWidget> {
  final List<String> items = List.generate(
    96,
    (index) {
      DateTime time = DateTime(0, 1, 1, index ~/ 4, (index % 4) * 15);
      return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    },
  );
  int position = 0;

  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    return SizedBox(
      height: myParameters.pixelHeight * 277,
      width: myParameters.pixelWidth * 212,
      child: CarouselSlider.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          final myParameters = MyParameters(context);

          double forwardDistance = (index - position).toDouble();
          double backwardDistance = (position - 95 + index).toDouble();

          /// Fix distance between elements in carousel
          if (position == 1) {
            backwardDistance = backwardDistance - 3;
          } else if (position == 0) {
            backwardDistance = backwardDistance - 1;
          } else if (position == 94) {
            backwardDistance = backwardDistance + 3;
          } else if (position == 95) {
            backwardDistance = backwardDistance + 1;
          }

          ///

          double minDistance =
              min(forwardDistance.abs(), backwardDistance.abs());
          double maxOpacity = 0.9;
          double opacity = 1.0 - (minDistance / 4);
          opacity = opacity.clamp(0.0, maxOpacity);

          return Container(
            decoration: BoxDecoration(
              color:
                  position == index ? MyColors.mainColor : Colors.transparent,
              borderRadius: BorderRadius.circular(myParameters.pixelWidth * 15),
            ),
            child: Center(
              child: Text(
                items[index],
                style: TextStyle(
                  color: position == index
                      ? MyColors.whiteColor
                      : isDarkTheme
                          ? MyColors.whiteColor!.withOpacity(opacity)
                          : Colors.black.withOpacity(opacity),
                  fontWeight: FontWeight.w700,
                  fontSize: myParameters.pixelWidth *
                      25, // You can adjust the font size as needed
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          scrollPhysics: const FixedExtentScrollPhysics(),
          onPageChanged: (int index, CarouselPageChangedReason reason) {
            setState(() {
              position = index;
            });
            SetNotificationScreenController.onSetTime(ref, items[index]);
          },
          height: myParameters.pixelHeight * 64,
          viewportFraction: 0.15,
          scrollDirection: Axis.vertical,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          enlargeFactor: 0.15,
        ),
      ),
    );
  }
}
