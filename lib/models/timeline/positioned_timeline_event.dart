// DEFINES A TIMELINE EVENT WITH COMPUTED POSITIONS
// Used by timeline widget/s to place containers and markers.

import 'package:wp_world/models/timeline/timeline_event.dart';

class PositionedTimelineEvent {
  final TimelineEvent event;
  final int startIndex;
  final int endIndex;

  PositionedTimelineEvent({
    required this.event,
    required this.startIndex,
    required this.endIndex,
  });

  int get span => endIndex - startIndex;
}
