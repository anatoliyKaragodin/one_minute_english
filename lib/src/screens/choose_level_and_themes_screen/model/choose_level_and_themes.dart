class ChooseLevelAndThemes {
  final List<int> listOfSelectedThemes;
  final bool levelIsSelected;
  final bool skipStartScreen;

//<editor-fold desc="Data Methods">
  const ChooseLevelAndThemes({
    required this.listOfSelectedThemes,
    required this.levelIsSelected,
    required this.skipStartScreen,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChooseLevelAndThemes &&
          runtimeType == other.runtimeType &&
          listOfSelectedThemes == other.listOfSelectedThemes &&
          levelIsSelected == other.levelIsSelected &&
          skipStartScreen == other.skipStartScreen);

  @override
  int get hashCode =>
      listOfSelectedThemes.hashCode ^
      levelIsSelected.hashCode ^
      skipStartScreen.hashCode;

  @override
  String toString() {
    return 'ChooseLevelAndThemes{' +
        ' listOfSelectedThemes: $listOfSelectedThemes,' +
        ' levelIsSelected: $levelIsSelected,' +
        ' skipStartScreen: $skipStartScreen,' +
        '}';
  }

  ChooseLevelAndThemes copyWith({
    List<int>? listOfSelectedThemes,
    bool? levelIsSelected,
    bool? skipStartScreen,
  }) {
    return ChooseLevelAndThemes(
      listOfSelectedThemes: listOfSelectedThemes ?? this.listOfSelectedThemes,
      levelIsSelected: levelIsSelected ?? this.levelIsSelected,
      skipStartScreen: skipStartScreen ?? this.skipStartScreen,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'listOfSelectedThemes': this.listOfSelectedThemes,
      'levelIsSelected': this.levelIsSelected,
      'skipStartScreen': this.skipStartScreen,
    };
  }

  factory ChooseLevelAndThemes.fromMap(Map<String, dynamic> map) {
    return ChooseLevelAndThemes(
      listOfSelectedThemes: map['listOfSelectedThemes'] as List<int>,
      levelIsSelected: map['levelIsSelected'] as bool,
      skipStartScreen: map['skipStartScreen'] as bool,
    );
  }

//</editor-fold>
}
