import 'package:one_minute_english/src/utils/library.dart';

class MyTheme {
  final String label;
  final Color color;
  final String imgPath;
  final int allWordsCount;
  final int learnedWords;

//<editor-fold desc="Data Methods">
  const MyTheme({
    required this.label,
    required this.color,
    required this.imgPath,
    required this.allWordsCount,
    required this.learnedWords,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyTheme &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          color == other.color &&
          imgPath == other.imgPath &&
          allWordsCount == other.allWordsCount &&
          learnedWords == other.learnedWords);

  @override
  int get hashCode =>
      label.hashCode ^
      color.hashCode ^
      imgPath.hashCode ^
      allWordsCount.hashCode ^
      learnedWords.hashCode;

  @override
  String toString() {
    return 'MyTheme{' +
        ' label: $label,' +
        ' color: $color,' +
        ' imgPath: $imgPath,' +
        ' allWordsCount: $allWordsCount,' +
        ' learnedWords: $learnedWords,' +
        '}';
  }

  MyTheme copyWith({
    String? label,
    Color? color,
    String? imgPath,
    int? allWordsCount,
    int? learnedWords,
  }) {
    return MyTheme(
      label: label ?? this.label,
      color: color ?? this.color,
      imgPath: imgPath ?? this.imgPath,
      allWordsCount: allWordsCount ?? this.allWordsCount,
      learnedWords: learnedWords ?? this.learnedWords,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': this.label,
      'color': this.color,
      'imgPath': this.imgPath,
      'allWordsCount': this.allWordsCount,
      'learnedWords': this.learnedWords,
    };
  }

  factory MyTheme.fromMap(Map<String, dynamic> map) {
    return MyTheme(
      label: map['label'] as String,
      color: map['color'] as Color,
      imgPath: map['imgPath'] as String,
      allWordsCount: map['allWordsCount'] as int,
      learnedWords: map['learnedWords'] as int,
    );
  }

//</editor-fold>
}
