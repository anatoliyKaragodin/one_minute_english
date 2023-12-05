import 'package:one_minute_english/src/screens/main_menu_progress_screen/controller/progress_controller.dart';
import 'package:one_minute_english/src/screens/start_screen/controller/start_screen_controller.dart';
import 'package:one_minute_english/src/utils/app_language/app_language.dart';
import 'package:one_minute_english/src/utils/library.dart';
import 'package:one_minute_english/src/utils/my_colors.dart';
import 'package:one_minute_english/src/utils/my_parameters.dart';
import 'package:one_minute_english/src/utils/my_widgets/my_text_widget.dart';

class MyCalendar extends ConsumerStatefulWidget {
  const MyCalendar({super.key});
  final route = 'calendar page';
  @override
  ConsumerState createState() => _MyCalendarState();
}

class _MyCalendarState extends ConsumerState<MyCalendar> {
  @override
  Widget build(BuildContext context) {
    final myParameters = MyParameters(context);
    final progress = ref.watch(progressProvider);
    final langIndex = ref.watch(startScreenProvider).chosenLanguageIndex;
    final lang = AppLanguage.listOfLanguages[langIndex];
    final currentDate = Jiffy.parseFromJiffy(progress.currentDate);
    final selectedDate = Jiffy.parseFromJiffy(progress.selectedDate);

    final startDayIndex = selectedDate.startOf(Unit.month).dayOfWeek == 1
        ? selectedDate.startOf(Unit.month).dayOfWeek + 6
        : selectedDate.startOf(Unit.month).dayOfWeek - 1;

    debugPrint(startDayIndex.toString());
    final weekDaysLabels = [
      lang[LangKey.monday],
      lang[LangKey.tuesday],
      lang[LangKey.wednesday],
      lang[LangKey.thursday],
      lang[LangKey.friday],
      lang[LangKey.saturday],
      lang[LangKey.sunday],
    ];
    final monthsLabels = [
      lang[LangKey.january],
      lang[LangKey.february],
      lang[LangKey.march],
      lang[LangKey.april],
      lang[LangKey.may],
      lang[LangKey.june],
      lang[LangKey.july],
      lang[LangKey.august],
      lang[LangKey.september],
      lang[LangKey.october],
      lang[LangKey.november],
      lang[LangKey.december],
    ];
    return Center(
      child: SizedBox(
        height: myParameters.pixelHeight * 450,
        width: myParameters.pixelWidth * 380,
        child: Column(
          children: [
            buildTopDateRow(myParameters, selectedDate, monthsLabels),
            buildWeekdaysRow(myParameters, weekDaysLabels),
            buildCalendar(selectedDate, startDayIndex, currentDate)
          ],
        ),
      ),
    );
  }

  Expanded buildCalendar(
      Jiffy selectedDate, int startDayIndex, Jiffy currentDate) {
    return Expanded(
      child: GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          itemCount: selectedDate.daysInMonth + startDayIndex - 1,
          itemBuilder: (context, index) {
            final weekdayIndex = index % 7 - startDayIndex + 2;
            final day = (index ~/ 7) * 7 + (weekdayIndex);

            return index <= startDayIndex - 2
                ? Container()
                : buildICalendarDateContainer(
                    index, selectedDate, currentDate, day, startDayIndex);
          }),
    );
  }

  InkWell buildICalendarDateContainer(int index, Jiffy selectedDate,
      Jiffy currentDate, int day, int startDayIndex) {
    return InkWell(
      onTap: () {
        ProgressController.onTapDate(ref, index - (startDayIndex - 2));
      },
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index - (startDayIndex - 2) == selectedDate.date
                  ? MyColors.purpleColor.withOpacity(0.5)
                  : Colors.transparent),
          child: MyTextWidget(
            color: index - (startDayIndex - 2) == currentDate.date &&
                    currentDate.month == selectedDate.month &&
                    currentDate.year == selectedDate.year
                ? index - (startDayIndex - 2) == selectedDate.date
                    ? MyColors.whiteColor
                    : MyColors.purpleColor
                : MyColors.whiteColor,
            text: day.toString(),
            fontWeight: FontWeight.w700,
            fontSize: 20,
          )),
    );
  }

  Padding buildWeekdaysRow(
      MyParameters myParameters, List<String?> weekDaysLabels) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: myParameters.pixelHeight * 10,
          horizontal: myParameters.pixelWidth * 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            weekDaysLabels.length,
            (index) => MyTextWidget(
                  text: weekDaysLabels[index]!,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                )),
      ),
    );
  }

  Row buildTopDateRow(MyParameters myParameters, Jiffy selectedDate,
      List<String?> monthsLabels) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: myParameters.pixelWidth * 15),
          child: SizedBox(
            child: Row(
              children: [
                MyTextWidget(
                  text:
                      '${monthsLabels[selectedDate.month - 1]} ${selectedDate.year}',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                IconButton(
                    iconSize: myParameters.pixelWidth * 20,
                    onPressed: null,
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: MyColors.purpleColor,
                    ))
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: myParameters.pixelWidth * 15),
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    iconSize: myParameters.pixelWidth * 20,
                    onPressed: () {
                      ProgressController.onTapMoveMonth(ref, false);
                    },
                    icon: Icon(Icons.arrow_back_ios_rounded,
                        color: MyColors.purpleColor)),
                SizedBox(
                  width: myParameters.pixelWidth * 10,
                ),
                IconButton(
                    iconSize: myParameters.pixelWidth * 20,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      ProgressController.onTapMoveMonth(ref, true);
                    },
                    icon: Icon(Icons.arrow_forward_ios_rounded,
                        color: MyColors.purpleColor))
              ],
            ),
          ),
        )
      ],
    );
  }
}
