import 'package:one_minute_english/src/repo/model/word.dart';
import 'package:one_minute_english/src/repo/model/my_theme.dart';

class Words {
  final List<Word> words;
  final List<Word> selectedToLearn;
  final List<Word> alreadyKnown;
  final List<MyTheme> allThemes;
  final List<int> selectedThemes;
  final int currentWord;
  final int currentLearningWordIndex;
  final int currentTrainingPage;
  final int selectedWordIndex;
  final List<String> inputWordLetterList;
final List<Word> repaeting;
final List<Word> difficult;

//<editor-fold desc="Data Methods">
  const Words({
    required this.words,
    required this.selectedToLearn,
    required this.alreadyKnown,
    required this.allThemes,
    required this.selectedThemes,
    required this.currentWord,
    required this.currentLearningWordIndex,
    required this.currentTrainingPage,
    required this.selectedWordIndex,
    required this.inputWordLetterList,
    required this.repaeting,
    required this.difficult,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Words &&
          runtimeType == other.runtimeType &&
          words == other.words &&
          selectedToLearn == other.selectedToLearn &&
          alreadyKnown == other.alreadyKnown &&
          allThemes == other.allThemes &&
          selectedThemes == other.selectedThemes &&
          currentWord == other.currentWord &&
          currentLearningWordIndex == other.currentLearningWordIndex &&
          currentTrainingPage == other.currentTrainingPage &&
          selectedWordIndex == other.selectedWordIndex &&
          inputWordLetterList == other.inputWordLetterList &&
          repaeting == other.repaeting &&
          difficult == other.difficult);

  @override
  int get hashCode =>
      words.hashCode ^
      selectedToLearn.hashCode ^
      alreadyKnown.hashCode ^
      allThemes.hashCode ^
      selectedThemes.hashCode ^
      currentWord.hashCode ^
      currentLearningWordIndex.hashCode ^
      currentTrainingPage.hashCode ^
      selectedWordIndex.hashCode ^
      inputWordLetterList.hashCode ^
      repaeting.hashCode ^
      difficult.hashCode;

  @override
  String toString() {
    return 'Words{' +
        ' words: $words,' +
        ' selectedToLearn: $selectedToLearn,' +
        ' alreadyKnown: $alreadyKnown,' +
        ' allThemes: $allThemes,' +
        ' selectedThemes: $selectedThemes,' +
        ' currentWord: $currentWord,' +
        ' currentLearningWordIndex: $currentLearningWordIndex,' +
        ' currentTrainingPage: $currentTrainingPage,' +
        ' selectedWordIndex: $selectedWordIndex,' +
        ' inputWordLetterList: $inputWordLetterList,' +
        ' repaeting: $repaeting,' +
        ' difficult: $difficult,' +
        '}';
  }

  Words copyWith({
    List<Word>? words,
    List<Word>? selectedToLearn,
    List<Word>? alreadyKnown,
    List<MyTheme>? allThemes,
    List<int>? selectedThemes,
    int? currentWord,
    int? currentLearningWordIndex,
    int? currentTrainingPage,
    int? selectedWordIndex,
    List<String>? inputWordLetterList,
    List<Word>? repaeting,
    List<Word>? difficult,
  }) {
    return Words(
      words: words ?? this.words,
      selectedToLearn: selectedToLearn ?? this.selectedToLearn,
      alreadyKnown: alreadyKnown ?? this.alreadyKnown,
      allThemes: allThemes ?? this.allThemes,
      selectedThemes: selectedThemes ?? this.selectedThemes,
      currentWord: currentWord ?? this.currentWord,
      currentLearningWordIndex:
          currentLearningWordIndex ?? this.currentLearningWordIndex,
      currentTrainingPage: currentTrainingPage ?? this.currentTrainingPage,
      selectedWordIndex: selectedWordIndex ?? this.selectedWordIndex,
      inputWordLetterList: inputWordLetterList ?? this.inputWordLetterList,
      repaeting: repaeting ?? this.repaeting,
      difficult: difficult ?? this.difficult,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'words': this.words,
      'selectedToLearn': this.selectedToLearn,
      'alreadyKnown': this.alreadyKnown,
      'allThemes': this.allThemes,
      'selectedThemes': this.selectedThemes,
      'currentWord': this.currentWord,
      'currentLearningWordIndex': this.currentLearningWordIndex,
      'currentTrainingPage': this.currentTrainingPage,
      'selectedWordIndex': this.selectedWordIndex,
      'inputWordLetterList': this.inputWordLetterList,
      'repaeting': this.repaeting,
      'difficult': this.difficult,
    };
  }

  factory Words.fromMap(Map<String, dynamic> map) {
    return Words(
      words: map['words'] as List<Word>,
      selectedToLearn: map['selectedToLearn'] as List<Word>,
      alreadyKnown: map['alreadyKnown'] as List<Word>,
      allThemes: map['allThemes'] as List<MyTheme>,
      selectedThemes: map['selectedThemes'] as List<int>,
      currentWord: map['currentWord'] as int,
      currentLearningWordIndex: map['currentLearningWordIndex'] as int,
      currentTrainingPage: map['currentTrainingPage'] as int,
      selectedWordIndex: map['selectedWordIndex'] as int,
      inputWordLetterList: map['inputWordLetterList'] as List<String>,
      repaeting: map['repaeting'] as List<Word>,
      difficult: map['difficult'] as List<Word>,
    );
  }

//</editor-fold>
}
