import 'package:one_minute_english/src/utils/library.dart';

class Word {
  final int englishId;
  final String word;
  final String transcription;
  final String theme;
  final String level;
  final String translation;
  final String language;
  final String soundPath;
  final String imgPath;
  final Color color;
  final bool isLearned;
  final bool isRepeating;
  final bool isDifficult;
  final int repeatedCount;

//<editor-fold desc="Data Methods">
  const Word({
    required this.englishId,
    required this.word,
    required this.transcription,
    required this.theme,
    required this.level,
    required this.translation,
    required this.language,
    required this.soundPath,
    required this.imgPath,
    required this.color,
    required this.isLearned,
    required this.isRepeating,
    required this.isDifficult,
    required this.repeatedCount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Word &&
          runtimeType == other.runtimeType &&
          englishId == other.englishId &&
          word == other.word &&
          transcription == other.transcription &&
          theme == other.theme &&
          level == other.level &&
          translation == other.translation &&
          language == other.language &&
          soundPath == other.soundPath &&
          imgPath == other.imgPath &&
          color == other.color &&
          isLearned == other.isLearned &&
          isRepeating == other.isRepeating &&
          isDifficult == other.isDifficult &&
          repeatedCount == other.repeatedCount);

  @override
  int get hashCode =>
      englishId.hashCode ^
      word.hashCode ^
      transcription.hashCode ^
      theme.hashCode ^
      level.hashCode ^
      translation.hashCode ^
      language.hashCode ^
      soundPath.hashCode ^
      imgPath.hashCode ^
      color.hashCode ^
      isLearned.hashCode ^
      isRepeating.hashCode ^
      isDifficult.hashCode ^
      repeatedCount.hashCode;

  @override
  String toString() {
    return 'Word{' +
        ' englishId: $englishId,' +
        ' word: $word,' +
        ' transcription: $transcription,' +
        ' theme: $theme,' +
        ' level: $level,' +
        ' translation: $translation,' +
        ' language: $language,' +
        ' soundPath: $soundPath,' +
        ' imgPath: $imgPath,' +
        ' color: $color,' +
        ' isLearned: $isLearned,' +
        ' isRepeating: $isRepeating,' +
        ' isDifficult: $isDifficult,' +
        ' repeatedCount: $repeatedCount,' +
        '}';
  }

  Word copyWith({
    int? englishId,
    String? word,
    String? transcription,
    String? theme,
    String? level,
    String? translation,
    String? language,
    String? soundPath,
    String? imgPath,
    Color? color,
    bool? isLearned,
    bool? isRepeating,
    bool? isDifficult,
    int? repeatedCount,
  }) {
    return Word(
      englishId: englishId ?? this.englishId,
      word: word ?? this.word,
      transcription: transcription ?? this.transcription,
      theme: theme ?? this.theme,
      level: level ?? this.level,
      translation: translation ?? this.translation,
      language: language ?? this.language,
      soundPath: soundPath ?? this.soundPath,
      imgPath: imgPath ?? this.imgPath,
      color: color ?? this.color,
      isLearned: isLearned ?? this.isLearned,
      isRepeating: isRepeating ?? this.isRepeating,
      isDifficult: isDifficult ?? this.isDifficult,
      repeatedCount: repeatedCount ?? this.repeatedCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'englishId': this.englishId,
      'word': this.word,
      'transcription': this.transcription,
      'theme': this.theme,
      'level': this.level,
      'translation': this.translation,
      'language': this.language,
      'soundPath': this.soundPath,
      'imgPath': this.imgPath,
      'color': this.color,
      'isLearned': this.isLearned,
      'isRepeating': this.isRepeating,
      'isDifficult': this.isDifficult,
      'repeatedCount': this.repeatedCount,
    };
  }

  factory Word.fromMap(Map<String, dynamic> map) {
    return Word(
      englishId: map['englishId'] as int,
      word: map['word'] as String,
      transcription: map['transcription'] as String,
      theme: map['theme'] as String,
      level: map['level'] as String,
      translation: map['translation'] as String,
      language: map['language'] as String,
      soundPath: map['soundPath'] as String,
      imgPath: map['imgPath'] as String,
      color: map['color'] as Color,
      isLearned: map['isLearned'] as bool,
      isRepeating: map['isRepeating'] as bool,
      isDifficult: map['isDifficult'] as bool,
      repeatedCount: map['repeatedCount'] as int,
    );
  }

//</editor-fold>
}
