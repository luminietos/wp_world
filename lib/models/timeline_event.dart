class TimelineEvent {
  final DateTime start;
  final DateTime end;
  final String labelKey; // displayed above/below the line
  final bool isStudy; // true = left side, false = right side

  const TimelineEvent({
    required this.start,
    required this.end,
    required this.labelKey, 
    required this.isStudy,
  });

  // Duration in days (or any unit you want to reason about)
  int get durationInDays => end.difference(start).inDays;

  // Convenience: is this event purely work?
  bool get isWork => !isStudy;
}
