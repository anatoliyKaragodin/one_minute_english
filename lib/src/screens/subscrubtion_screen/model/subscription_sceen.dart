class SubscriptionScreen {
  final int chosenSubIndex;

//<editor-fold desc="Data Methods">
  const SubscriptionScreen({
    required this.chosenSubIndex,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubscriptionScreen &&
          runtimeType == other.runtimeType &&
          chosenSubIndex == other.chosenSubIndex);

  @override
  int get hashCode => chosenSubIndex.hashCode;

  @override
  String toString() {
    return 'SubscriptionScreen{' + ' chosenSubIndex: $chosenSubIndex,' + '}';
  }

  SubscriptionScreen copyWith({
    int? chosenSubIndex,
  }) {
    return SubscriptionScreen(
      chosenSubIndex: chosenSubIndex ?? this.chosenSubIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chosenSubIndex': this.chosenSubIndex,
    };
  }

  factory SubscriptionScreen.fromMap(Map<String, dynamic> map) {
    return SubscriptionScreen(
      chosenSubIndex: map['chosenSubIndex'] as int,
    );
  }

//</editor-fold>
}
