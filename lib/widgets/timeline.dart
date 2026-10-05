import 'package:flutter/material.dart';
import 'package:wp_world/helpers/localization_helpers.dart';
import 'package:wp_world/models/timeline_event.dart';

/// ------------------------------------------------------------
/// MARKER LAYOUT LOGIC
/// ------------------------------------------------------------
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

/// ------------------------------------------------------------
/// EVENT POSITIONING MODEL
/// ------------------------------------------------------------
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

/// ------------------------------------------------------------
/// MAIN WIDGET: VerticalTimeline
/// ------------------------------------------------------------
class VerticalTimeline extends StatelessWidget {
  final List<TimelineEvent> events;

  const VerticalTimeline({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    final layout = TimelineLayout.fromEvents(events);

    return LayoutBuilder(
      builder: (context, constraints) {
        final totalHeight = constraints.maxHeight;
        final totalWidth = constraints.maxWidth;

        final markerCount = layout.markers.length;
        final segmentCount = markerCount > 1 ? markerCount - 1 : 1;
        final segmentHeight = totalHeight / segmentCount;

        final centerX = totalWidth / 2;

        final positionedEvents = events.map((event) {
          final startIndex = layout.indexFor(event.start);
          final endIndex = layout.indexFor(event.end);
          return PositionedTimelineEvent(
            event: event,
            startIndex: startIndex,
            endIndex: endIndex,
          );
        }).toList();

        return Stack(
          children: [
            _buildTimelineLineAndMarkers(
              context: context,
              layout: layout,
              events: events,
              centerX: centerX,
              segmentHeight: segmentHeight,
            ),

            ...positionedEvents.map(
              (pe) => _buildEventContainer(
                context: context,
                positionedEvent: pe,
                centerX: centerX,
                segmentHeight: segmentHeight,
                totalWidth: totalWidth,
              ),
            ),
          ],
        );
      },
    );
  }

  // TIMELINE LINE + MARKERS
  Widget _buildTimelineLineAndMarkers({
    required BuildContext context,
    required TimelineLayout layout,
    required List<TimelineEvent> events,
    required double centerX,
    required double segmentHeight,
  }) {
    final markerCount = layout.markers.length;
    final colors = Theme.of(context).colorScheme;

    final markerColors = <int, Color>{};

    for (var i = 0; i < markerCount; i++) {
      final date = layout.markers[i];

      // All events starting at this marker
      final startingEvents = events.where((e) => e.start == date).toList();

      // All events ending at this marker
      final endingEvents = events.where((e) => e.end == date).toList();

      Color? color;

      // ------------------------------------------------------------
      // PRIORITY 1: Start-date rules
      // ------------------------------------------------------------
      if (startingEvents.isNotEmpty) {
        final hasStudyStart = startingEvents.any((e) => e.isStudy);
        final hasWorkStart = startingEvents.any((e) => !e.isStudy);

        if (hasStudyStart) {
          color = colors.secondary;
        } else if (hasWorkStart) {
          color = colors.primary;
        }
      }

      // ------------------------------------------------------------
      // PRIORITY 2: End-date rules (only if no start-date color)
      // ------------------------------------------------------------
      if (color == null && endingEvents.isNotEmpty) {
        final hasStudyEnd = endingEvents.any((e) => e.isStudy);
        final hasWorkEnd = endingEvents.any((e) => !e.isStudy);

        final hasStudyStartHere = startingEvents.any((e) => e.isStudy);
        final hasWorkStartHere = startingEvents.any((e) => !e.isStudy);

        if (hasWorkEnd && !hasStudyStartHere) {
          color = colors.primary;
        } else if (hasStudyEnd && !hasWorkStartHere) {
          color = colors.secondary;
        }
      }

      // Fallback
      markerColors[i] = color ?? Colors.grey.shade700;
    }

    return Positioned.fill(
      child: CustomPaint(
        painter: _TimelinePainter(
          centerX: centerX,
          markerCount: markerCount,
          segmentHeight: segmentHeight,
          markerColors: markerColors,
        ),
      ),
    );
  }

  // EVENT CONTAINER
  Widget _buildEventContainer({
    required BuildContext context,
    required PositionedTimelineEvent positionedEvent,
    required double centerX,
    required double segmentHeight,
    required double totalWidth,
  }) {
    final event = positionedEvent.event;
    final startIndex = positionedEvent.startIndex;
    final endIndex = positionedEvent.endIndex;

    final top = startIndex * segmentHeight;
    final height = (endIndex - startIndex) * segmentHeight;

    final halfWidth = totalWidth / 2;
    final containerWidth = halfWidth * 0.8;

    const double sideSpacing = 24.0; // NEW SPACING

    final isStudy = event.isStudy;

    final left = isStudy
        ? (centerX - containerWidth - sideSpacing)
        : (centerX + sideSpacing);

    final right = isStudy
        ? null
        : (totalWidth - (centerX + containerWidth + sideSpacing));

    final label = LocalizationHelpers.translate(context, event.labelKey);
    final colors = Theme.of(context).colorScheme;

    return Positioned(
      top: top,
      left: left,
      right: right,
      height: height,
      child: Center(
        child: Container(
          width: containerWidth,
          decoration: BoxDecoration(
            color: isStudy
                ? colors.secondary.withOpacity(0.15)
                : colors.primary.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isStudy ? colors.secondary : colors.primary,
              width: 1.5,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              // color: isStudy ? colors.secondary : colors.primary,
            ),
          ),
        ),
      ),
    );
  }
}

/// ------------------------------------------------------------
/// CUSTOM PAINTER FOR TIMELINE
/// ------------------------------------------------------------
class _TimelinePainter extends CustomPainter {
  final double centerX;
  final int markerCount;
  final double segmentHeight;
  final Map<int, Color> markerColors;

  _TimelinePainter({
    required this.centerX,
    required this.markerCount,
    required this.segmentHeight,
    required this.markerColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 2.0;

    final topY = 0.0;
    final bottomY = (markerCount - 1) * segmentHeight;

    canvas.drawLine(Offset(centerX, topY), Offset(centerX, bottomY), paintLine);

    const markerRadius = 5.0;

    for (var i = 0; i < markerCount; i++) {
      final y = i * segmentHeight;
      final paintMarker = Paint()..color = markerColors[i]!;
      canvas.drawCircle(Offset(centerX, y), markerRadius, paintMarker);
    }
  }

  @override
  bool shouldRepaint(covariant _TimelinePainter oldDelegate) {
    return oldDelegate.centerX != centerX ||
        oldDelegate.markerCount != markerCount ||
        oldDelegate.segmentHeight != segmentHeight ||
        oldDelegate.markerColors != markerColors;
  }
}
