class SetNotificationScreen {
  final int hours;
  final int minutes;

//<editor-fold desc="Data Methods">
  const SetNotificationScreen({
    required this.hours,
    required this.minutes,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SetNotificationScreen &&
          runtimeType == other.runtimeType &&
          hours == other.hours &&
          minutes == other.minutes);

  @override
  int get hashCode => hours.hashCode ^ minutes.hashCode;

  @override
  String toString() {
    return 'SetNotificationScreen{' +
        ' hours: $hours,' +
        ' minutes: $minutes,' +
        '}';
  }

  SetNotificationScreen copyWith({
    int? hours,
    int? minutes,
  }) {
    return SetNotificationScreen(
      hours: hours ?? this.hours,
      minutes: minutes ?? this.minutes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hours': this.hours,
      'minutes': this.minutes,
    };
  }

  factory SetNotificationScreen.fromMap(Map<String, dynamic> map) {
    return SetNotificationScreen(
      hours: map['hours'] as int,
      minutes: map['minutes'] as int,
    );
  }

//</editor-fold>
}
