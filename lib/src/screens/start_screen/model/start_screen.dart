class StartScreen {
  final double logoOpacity;
  final double pageOpacity;
  final double nextButtonOpacity;
  final int chosenLanguageIndex;
  final int startPageIndex;

//<editor-fold desc="Data Methods">
  const StartScreen({
    required this.logoOpacity,
    required this.pageOpacity,
    required this.nextButtonOpacity,
    required this.chosenLanguageIndex,
    required this.startPageIndex,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StartScreen &&
          runtimeType == other.runtimeType &&
          logoOpacity == other.logoOpacity &&
          pageOpacity == other.pageOpacity &&
          nextButtonOpacity == other.nextButtonOpacity &&
          chosenLanguageIndex == other.chosenLanguageIndex &&
          startPageIndex == other.startPageIndex);

  @override
  int get hashCode =>
      logoOpacity.hashCode ^
      pageOpacity.hashCode ^
      nextButtonOpacity.hashCode ^
      chosenLanguageIndex.hashCode ^
      startPageIndex.hashCode;

  @override
  String toString() {
    return 'StartScreen{' +
        ' logoOpacity: $logoOpacity,' +
        ' pageOpacity: $pageOpacity,' +
        ' nextButtonOpacity: $nextButtonOpacity,' +
        ' chosenLanguageIndex: $chosenLanguageIndex,' +
        ' startPageIndex: $startPageIndex,' +
        '}';
  }

  StartScreen copyWith({
    double? logoOpacity,
    double? pageOpacity,
    double? nextButtonOpacity,
    int? chosenLanguageIndex,
    int? startPageIndex,
  }) {
    return StartScreen(
      logoOpacity: logoOpacity ?? this.logoOpacity,
      pageOpacity: pageOpacity ?? this.pageOpacity,
      nextButtonOpacity: nextButtonOpacity ?? this.nextButtonOpacity,
      chosenLanguageIndex: chosenLanguageIndex ?? this.chosenLanguageIndex,
      startPageIndex: startPageIndex ?? this.startPageIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'logoOpacity': this.logoOpacity,
      'pageOpacity': this.pageOpacity,
      'nextButtonOpacity': this.nextButtonOpacity,
      'chosenLanguageIndex': this.chosenLanguageIndex,
      'startPageIndex': this.startPageIndex,
    };
  }

  factory StartScreen.fromMap(Map<String, dynamic> map) {
    return StartScreen(
      logoOpacity: map['logoOpacity'] as double,
      pageOpacity: map['pageOpacity'] as double,
      nextButtonOpacity: map['nextButtonOpacity'] as double,
      chosenLanguageIndex: map['chosenLanguageIndex'] as int,
      startPageIndex: map['startPageIndex'] as int,
    );
  }

//</editor-fold>
}
