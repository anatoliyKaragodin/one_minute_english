import 'package:jiffy/jiffy.dart';

class Settings {
  final bool listeningOn;
  final bool pronunciationOn;
  final bool answerSoundOn;
  final int rating;
  final int pageIndex;
  final bool notificationsIsOn;
  final int wordsNumberIndex;
  final Jiffy currentDate;
  final Jiffy selectedDate;

//<editor-fold desc="Data Methods">
  const Settings({
    required this.listeningOn,
    required this.pronunciationOn,
    required this.answerSoundOn,
    required this.rating,
    required this.pageIndex,
    required this.notificationsIsOn,
    required this.wordsNumberIndex,
    required this.currentDate,
    required this.selectedDate,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Settings &&
          runtimeType == other.runtimeType &&
          listeningOn == other.listeningOn &&
          pronunciationOn == other.pronunciationOn &&
          answerSoundOn == other.answerSoundOn &&
          rating == other.rating &&
          pageIndex == other.pageIndex &&
          notificationsIsOn == other.notificationsIsOn &&
          wordsNumberIndex == other.wordsNumberIndex &&
          currentDate == other.currentDate &&
          selectedDate == other.selectedDate);

  @override
  int get hashCode =>
      listeningOn.hashCode ^
      pronunciationOn.hashCode ^
      answerSoundOn.hashCode ^
      rating.hashCode ^
      pageIndex.hashCode ^
      notificationsIsOn.hashCode ^
      wordsNumberIndex.hashCode ^
      currentDate.hashCode ^
      selectedDate.hashCode;

  @override
  String toString() {
    return 'Settings{' +
        ' listeningOn: $listeningOn,' +
        ' pronunciationOn: $pronunciationOn,' +
        ' answerSoundOn: $answerSoundOn,' +
        ' rating: $rating,' +
        ' pageIndex: $pageIndex,' +
        ' notificationsIsOn: $notificationsIsOn,' +
        ' wordsNumberIndex: $wordsNumberIndex,' +
        ' currentDate: $currentDate,' +
        ' selectedDate: $selectedDate,' +
        '}';
  }

  Settings copyWith({
    bool? listeningOn,
    bool? pronunciationOn,
    bool? answerSoundOn,
    int? rating,
    int? pageIndex,
    bool? notificationsIsOn,
    int? wordsNumberIndex,
    Jiffy? currentDate,
    Jiffy? selectedDate,
  }) {
    return Settings(
      listeningOn: listeningOn ?? this.listeningOn,
      pronunciationOn: pronunciationOn ?? this.pronunciationOn,
      answerSoundOn: answerSoundOn ?? this.answerSoundOn,
      rating: rating ?? this.rating,
      pageIndex: pageIndex ?? this.pageIndex,
      notificationsIsOn: notificationsIsOn ?? this.notificationsIsOn,
      wordsNumberIndex: wordsNumberIndex ?? this.wordsNumberIndex,
      currentDate: currentDate ?? this.currentDate,
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'listeningOn': this.listeningOn,
      'pronunciationOn': this.pronunciationOn,
      'answerSoundOn': this.answerSoundOn,
      'rating': this.rating,
      'pageIndex': this.pageIndex,
      'notificationsIsOn': this.notificationsIsOn,
      'wordsNumberIndex': this.wordsNumberIndex,
      'currentDate': this.currentDate,
      'selectedDate': this.selectedDate,
    };
  }

  factory Settings.fromMap(Map<String, dynamic> map) {
    return Settings(
      listeningOn: map['listeningOn'] as bool,
      pronunciationOn: map['pronunciationOn'] as bool,
      answerSoundOn: map['answerSoundOn'] as bool,
      rating: map['rating'] as int,
      pageIndex: map['pageIndex'] as int,
      notificationsIsOn: map['notificationsIsOn'] as bool,
      wordsNumberIndex: map['wordsNumberIndex'] as int,
      currentDate: map['currentDate'] as Jiffy,
      selectedDate: map['selectedDate'] as Jiffy,
    );
  }

//</editor-fold>
}
