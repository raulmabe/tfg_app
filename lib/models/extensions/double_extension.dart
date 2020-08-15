extension DoubleExtension on double {
  int get toHoursFromSeconds => (this / 3600).floor();

  int get toMinutesFromSeconds => (this / 60).floor();

  int get toKmFromMeters => (this / 1000).floor();

  bool get isMoreThanAnHour => (this / 60) >= 60;
}
