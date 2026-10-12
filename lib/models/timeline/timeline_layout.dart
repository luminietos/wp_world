// DEFINES THE TIMELINE LAYOUT ENGINE (marker positions, spacing, and alignment of timeline events)
// Used to deduplicate dates and compute vertical/horizontal positions of events on the timeline
// (thus ensuring that events do not overlap and are visually aligned).

import 'package:wp_world/models/timeline/timeline_event.dart';

class TimelineLayout {
  final List<DateTime> markers;
  final Map<DateTime, int> markerIndexByDate;

  TimelineLayout._(this.markers, this.markerIndexByDate);

  factory TimelineLayout.fromEvents(List<TimelineEvent> events) {
    final uniqueDates = <DateTime>{};

    for (final event in events) {
      uniqueDates.add(event.start);
      uniqueDates.add(event.end);
    }

    final markers = uniqueDates.toList()..sort((a, b) => a.compareTo(b));

    final markerIndexByDate = <DateTime, int>{};
    for (var i = 0; i < markers.length; i++) {
      markerIndexByDate[markers[i]] = i;
    }

    return TimelineLayout._(markers, markerIndexByDate);
  }

  int indexFor(DateTime date) => markerIndexByDate[date]!;
}
