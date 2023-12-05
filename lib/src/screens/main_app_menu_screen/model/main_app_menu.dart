class MainAppMenu {
  final int menuIndex;

//<editor-fold desc="Data Methods">
  const MainAppMenu({
    required this.menuIndex,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MainAppMenu &&
          runtimeType == other.runtimeType &&
          menuIndex == other.menuIndex);

  @override
  int get hashCode => menuIndex.hashCode;

  @override
  String toString() {
    return 'MainAppMenu{' + ' menuIndex: $menuIndex,' + '}';
  }

  MainAppMenu copyWith({
    int? menuIndex,
  }) {
    return MainAppMenu(
      menuIndex: menuIndex ?? this.menuIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'menuIndex': this.menuIndex,
    };
  }

  factory MainAppMenu.fromMap(Map<String, dynamic> map) {
    return MainAppMenu(
      menuIndex: map['menuIndex'] as int,
    );
  }

//</editor-fold>
}
