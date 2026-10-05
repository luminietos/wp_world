import 'package:wp_world/models/timeline_event.dart';

final DateTime timelineStart = DateTime(2021, 1); // JAN 2021
final DateTime timelineEnd = DateTime(2025, 10); // OCT 2025

final List<TimelineEvent> timelineEvents = [
  TimelineEvent(
    start: DateTime(2021, 1),
    end: DateTime(2024, 11),
    labelKey: 'timelineStudiesBBA', // for localization purposes
    isStudy: true,
  ),
  TimelineEvent(
    start: DateTime(2024, 5),
    end: DateTime(2024, 10),
    labelKey: 'timelineWorkInternship',
    isStudy: false,
  ),
  TimelineEvent(
    start: DateTime(2024, 10),
    end: DateTime(2025, 10),
    labelKey: 'timelineWorkTaigoa',
    isStudy: false,
  ),
];
