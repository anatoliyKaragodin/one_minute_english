import 'package:one_minute_english/src/utils/library.dart';

class MyKeyboard {
  final String inputWord;
  final List<String> inputWordLettersList;
  final List<int> inputWordLetterIndex;

//<editor-fold desc="Data Methods">
  const MyKeyboard({
    required this.inputWord,
    required this.inputWordLettersList,
    required this.inputWordLetterIndex,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyKeyboard &&
          runtimeType == other.runtimeType &&
          inputWord == other.inputWord &&
          inputWordLettersList == other.inputWordLettersList &&
          inputWordLetterIndex == other.inputWordLetterIndex);

  @override
  int get hashCode =>
      inputWord.hashCode ^
      inputWordLettersList.hashCode ^
      inputWordLetterIndex.hashCode;

  @override
  String toString() {
    return 'MyKeyboard{' +
        ' inputWord: $inputWord,' +
        ' inputWordLettersList: $inputWordLettersList,' +
        ' inputWordLetterIndex: $inputWordLetterIndex,' +
        '}';
  }

  MyKeyboard copyWith({
    String? inputWord,
    List<String>? inputWordLettersList,
    List<int>? inputWordLetterIndex,
  }) {
    return MyKeyboard(
      inputWord: inputWord ?? this.inputWord,
      inputWordLettersList: inputWordLettersList ?? this.inputWordLettersList,
      inputWordLetterIndex: inputWordLetterIndex ?? this.inputWordLetterIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'inputWord': this.inputWord,
      'inputWordLettersList': this.inputWordLettersList,
      'inputWordLetterIndex': this.inputWordLetterIndex,
    };
  }

  factory MyKeyboard.fromMap(Map<String, dynamic> map) {
    return MyKeyboard(
      inputWord: map['inputWord'] as String,
      inputWordLettersList: map['inputWordLettersList'] as List<String>,
      inputWordLetterIndex: map['inputWordLetterIndex'] as List<int>,
    );
  }

//</editor-fold>
}