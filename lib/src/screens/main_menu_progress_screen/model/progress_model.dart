import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:one_minute_english/src/screens/main_menu_progress_screen/model/progress.dart';

class ProgressModel extends StateNotifier<Progress> {
  ProgressModel()
      : super(Progress(
            currentDate: Jiffy.now(),
            selectedDate: Jiffy.now(),
            learnedWords: 4,
            alreadyKnownWords: 5,
            repeatableWords: 3,
            difficultWords: 3)) {
    initState();
  }

  void initState() {}

  void setDate(int index) {
    var date = state.selectedDate;
    var newDate = Jiffy.parseFromList([date.year, date.month, index]);
    state = state.copyWith(selectedDate: newDate);
  }

  void changeMonth(bool isForward) {
    var date = state.selectedDate;
    late Jiffy newDate;
    if (isForward) {
      newDate = date.add(months: 1);
    } else {
      newDate = date.subtract(months: 1);
    }
    state = state.copyWith(selectedDate: newDate);
  }
}
