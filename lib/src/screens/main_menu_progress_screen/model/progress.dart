import 'package:one_minute_english/src/utils/library.dart';

class Progress {
  final Jiffy currentDate;
  final Jiffy selectedDate;
  final int learnedWords;
  final int alreadyKnownWords;
  final int repeatableWords;
  final int difficultWords;

//<editor-fold desc="Data Methods">
  const Progress({
    required this.currentDate,
    required this.selectedDate,
    required this.learnedWords,
    required this.alreadyKnownWords,
    required this.repeatableWords,
    required this.difficultWords,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Progress &&
          runtimeType == other.runtimeType &&
          currentDate == other.currentDate &&
          selectedDate == other.selectedDate &&
          learnedWords == other.learnedWords &&
          alreadyKnownWords == other.alreadyKnownWords &&
          repeatableWords == other.repeatableWords &&
          difficultWords == other.difficultWords);

  @override
  int get hashCode =>
      currentDate.hashCode ^
      selectedDate.hashCode ^
      learnedWords.hashCode ^
      alreadyKnownWords.hashCode ^
      repeatableWords.hashCode ^
      difficultWords.hashCode;

  @override
  String toString() {
    return 'Progress{' +
        ' currentDate: $currentDate,' +
        ' selectedDate: $selectedDate,' +
        ' learnedWords: $learnedWords,' +
        ' alreadyKnownWords: $alreadyKnownWords,' +
        ' repeatableWords: $repeatableWords,' +
        ' difficultWords: $difficultWords,' +
        '}';
  }

  Progress copyWith({
    Jiffy? currentDate,
    Jiffy? selectedDate,
    int? learnedWords,
    int? alreadyKnownWords,
    int? repeatableWords,
    int? difficultWords,
  }) {
    return Progress(
      currentDate: currentDate ?? this.currentDate,
      selectedDate: selectedDate ?? this.selectedDate,
      learnedWords: learnedWords ?? this.learnedWords,
      alreadyKnownWords: alreadyKnownWords ?? this.alreadyKnownWords,
      repeatableWords: repeatableWords ?? this.repeatableWords,
      difficultWords: difficultWords ?? this.difficultWords,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'currentDate': this.currentDate,
      'selectedDate': this.selectedDate,
      'learnedWords': this.learnedWords,
      'alreadyKnownWords': this.alreadyKnownWords,
      'repeatableWords': this.repeatableWords,
      'difficultWords': this.difficultWords,
    };
  }

  factory Progress.fromMap(Map<String, dynamic> map) {
    return Progress(
      currentDate: map['currentDate'] as Jiffy,
      selectedDate: map['selectedDate'] as Jiffy,
      learnedWords: map['learnedWords'] as int,
      alreadyKnownWords: map['alreadyKnownWords'] as int,
      repeatableWords: map['repeatableWords'] as int,
      difficultWords: map['difficultWords'] as int,
    );
  }

//</editor-fold>
}