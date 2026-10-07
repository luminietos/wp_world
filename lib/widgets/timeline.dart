import 'package:flutter/material.dart';
import 'package:wp_world/helpers/localization_helpers.dart';
import 'package:wp_world/models/timeline_event.dart';
import 'package:wp_world/utils/spacing.dart';
import 'package:wp_world/widgets/timeline_date_pill.dart';
import 'package:wp_world/utils/icon_sizes.dart';
import 'package:wp_world/widgets/timeline_marker_icon.dart';

// MARKER LAYOUT LOGIC
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

/// EVENT POSITIONING MODEL
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

/// MAIN WIDGET: VerticalTimeline
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
        final verticalInset = totalHeight < 96 ? totalHeight / 2 : 48.0;
        final timelineHeight = totalHeight - (verticalInset * 2);
        final segmentHeight = timelineHeight / segmentCount;

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
              verticalInset: verticalInset,
            ),

            ...positionedEvents.map(
              (pe) => _buildEventContainer(
                context: context,
                positionedEvent: pe,
                centerX: centerX,
                segmentHeight: segmentHeight,
                verticalInset: verticalInset,
                totalWidth: totalWidth,
              ),
            ),

            ..._buildMarkerArmsAndPills(
              context: context,
              layout: layout,
              events: events,
              centerX: centerX,
              segmentHeight: segmentHeight,
              verticalInset: verticalInset,
              totalWidth: totalWidth,
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
    required double verticalInset,
  }) {
    final markerCount = layout.markers.length;
    final colors = Theme.of(context).colorScheme;

    final markerColors = <int, Color>{};

    for (var i = 0; i < markerCount; i++) {
      final date = layout.markers[i];

      final startingEvents = events.where((e) => e.start == date).toList();
      final endingEvents = events.where((e) => e.end == date).toList();

      Color? color;

      if (startingEvents.isNotEmpty) {
        final hasStudyStart = startingEvents.any((e) => e.isStudy);
        final hasWorkStart = startingEvents.any((e) => !e.isStudy);

        if (hasStudyStart)
          color = colors.secondary;
        else if (hasWorkStart)
          color = colors.primary;
      }

      if (color == null && endingEvents.isNotEmpty) {
        final hasStudyEnd = endingEvents.any((e) => e.isStudy);
        final hasWorkEnd = endingEvents.any((e) => !e.isStudy);

        final hasStudyStartHere = startingEvents.any((e) => e.isStudy);
        final hasWorkStartHere = startingEvents.any((e) => !e.isStudy);

        if (hasWorkEnd && !hasStudyStartHere)
          color = colors.primary;
        else if (hasStudyEnd && !hasWorkStartHere)
          color = colors.secondary;
      }

      markerColors[i] = color ?? Colors.grey.shade700;
    }

    return Positioned.fill(
      child: CustomPaint(
        painter: _TimelinePainter(
          centerX: centerX,
          markerCount: markerCount,
          segmentHeight: segmentHeight,
          verticalInset: verticalInset,
          markerColors: markerColors,
        ),
      ),
    );
  }

  // ARMS + PILLS (start + end dates + marker icons)
  List<Widget> _buildMarkerArmsAndPills({
    required BuildContext context,
    required TimelineLayout layout,
    required List<TimelineEvent> events,
    required double centerX,
    required double segmentHeight,
    required double verticalInset,
    required double totalWidth,
  }) {
    final colors = Theme.of(context).colorScheme;
    final markerCount = layout.markers.length;

    final markerColors = <int, Color>{};

    // ------------------------------------------------------------
    // DETERMINE MARKER COLORS (same logic as before)
    // ------------------------------------------------------------
    for (var i = 0; i < markerCount; i++) {
      final date = layout.markers[i];
      final startingEvents = events.where((e) => e.start == date).toList();
      final endingEvents = events.where((e) => e.end == date).toList();

      Color? color;

      if (startingEvents.isNotEmpty) {
        final hasStudyStart = startingEvents.any((e) => e.isStudy);
        final hasWorkStart = startingEvents.any((e) => !e.isStudy);

        if (hasStudyStart)
          color = colors.secondary;
        else if (hasWorkStart)
          color = colors.primary;
      }

      if (color == null && endingEvents.isNotEmpty) {
        final hasStudyEnd = endingEvents.any((e) => e.isStudy);
        final hasWorkEnd = endingEvents.any((e) => !e.isStudy);

        final hasStudyStartHere = startingEvents.any((e) => e.isStudy);
        final hasWorkStartHere = startingEvents.any((e) => !e.isStudy);

        if (hasWorkEnd && !hasStudyStartHere)
          color = colors.primary;
        else if (hasStudyEnd && !hasWorkStartHere)
          color = colors.secondary;
      }

      markerColors[i] = color ?? Colors.grey.shade700;
    }

    final widgets = <Widget>[];

    // ------------------------------------------------------------
    // MARKERS (start = icon, end = dot)
    // ------------------------------------------------------------
    final iconSize = IconSizes.medium;
    final markerRadius = iconSize / 2;
    const endMarkerRadius = 6.0; // old dot size

    for (var i = 0; i < markerCount; i++) {
      final date = layout.markers[i];
      final y = verticalInset + (i * segmentHeight);

      final startingEvents = events.where((e) => e.start == date).toList();
      final endingEvents = events.where((e) => e.end == date).toList();

      final color = markerColors[i]!;

      if (startingEvents.isNotEmpty) {
        // ------------------------------------------------------------
        // START MARKER → ICON
        // ------------------------------------------------------------
        final iconEvent = startingEvents.first;

        widgets.add(
          Positioned(
            top: y - markerRadius,
            left: centerX - markerRadius,
            child: TimelineMarkerIcon(event: iconEvent, color: color),
          ),
        );
      } else {
        // ------------------------------------------------------------
        // END MARKER → SIMPLE DOT
        // ------------------------------------------------------------
        widgets.add(
          Positioned(
            top: y - endMarkerRadius,
            left: centerX - endMarkerRadius,
            child: Container(
              width: endMarkerRadius * 2,
              height: endMarkerRadius * 2,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
          ),
        );
      }
    }

    // ------------------------------------------------------------
    // START + END PILLS
    // ------------------------------------------------------------
    for (var i = 0; i < markerCount; i++) {
      final date = layout.markers[i];
      final y = verticalInset + (i * segmentHeight);

      final startingEvents = events.where((e) => e.start == date).toList();
      final endingEvents = events.where((e) => e.end == date).toList();
      final color = markerColors[i]!;

      final isStartMarker = startingEvents.isNotEmpty;

      // ------------------------------------------------------------
      // ARM ATTACHMENT POINT
      // ------------------------------------------------------------
      final leftAttachX = isStartMarker
          ? centerX -
                markerRadius // attach to icon edge
          : centerX - endMarkerRadius; // attach to dot edge

      final rightAttachX = isStartMarker
          ? centerX + markerRadius
          : centerX + endMarkerRadius;

      // ------------------------------------------------------------
      // START DATE PILLS (unchanged except attachment point)
      // ------------------------------------------------------------
      for (final e in startingEvents) {
        final text = LocalizationHelpers.formatMonthYear(context, e.start);
        final pill = TimelineDatePill(text: text, color: color);

        if (e.isStudy) {
          // LEFT SIDE: pill + arm
          widgets.add(
            Positioned(
              top: y,
              right: totalWidth - leftAttachX,
              child: FractionalTranslation(
                translation: const Offset(0, -0.5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    pill,
                    Container(width: Spacing.lg, height: 2, color: color),
                  ],
                ),
              ),
            ),
          );
        } else {
          // RIGHT SIDE: arm + pill
          widgets.add(
            Positioned(
              top: y,
              left: rightAttachX,
              child: FractionalTranslation(
                translation: const Offset(0, -0.5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(width: Spacing.lg, height: 2, color: color),
                    pill,
                  ],
                ),
              ),
            ),
          );
        }
      }

      // ------------------------------------------------------------
      // END DATE PILLS (skip if also a start date)
      // ------------------------------------------------------------
      if (isStartMarker) continue;

      for (final e in endingEvents) {
        final text = LocalizationHelpers.formatMonthYear(context, e.end);
        final isStudy = e.isStudy;

        final pillColor = isStudy ? colors.secondary : colors.primary;
        final pillBg = isStudy
            ? colors.secondary.withOpacity(0.15)
            : colors.primary.withOpacity(0.15);

        final endPill = TimelineDatePill(
          text: text,
          color: pillColor,
          backgroundColor: pillBg,
          textColor: pillColor,
          withBorder: false,
        );

        if (isStudy) {
          widgets.add(
            Positioned(
              top: y + Spacing.sm,
              right: totalWidth - leftAttachX,
              child: endPill,
            ),
          );
        } else {
          widgets.add(
            Positioned(top: y + Spacing.sm, left: rightAttachX, child: endPill),
          );
        }
      }
    }

    return widgets;
  }

  // EVENT CONTAINER
  Widget _buildEventContainer({
    required BuildContext context,
    required PositionedTimelineEvent positionedEvent,
    required double centerX,
    required double segmentHeight,
    required double verticalInset,
    required double totalWidth,
  }) {
    final event = positionedEvent.event;
    final startIndex = positionedEvent.startIndex;
    final endIndex = positionedEvent.endIndex;

    // Vertical spacing above & below the container
    double verticalMargin = Spacing.xs;

    final top = verticalInset + (startIndex * segmentHeight) + verticalMargin;
    final height =
        (endIndex - startIndex) * segmentHeight - (verticalMargin * 2);

    final halfWidth = totalWidth / 2;
    const double sideSpacing = 40.0;
    final availableWidth = (halfWidth - sideSpacing - Spacing.sm)
        .clamp(0.0, double.infinity)
        .toDouble();
    final containerWidth = (halfWidth * 0.8)
        .clamp(0.0, availableWidth)
        .toDouble();

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
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Spacing.lg,
              vertical: Spacing.lg,
            ),
            child: Text(
              label,
              textAlign: isStudy ? TextAlign.right : TextAlign.left,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

/// CUSTOM PAINTER FOR TIMELINE
class _TimelinePainter extends CustomPainter {
  final double centerX;
  final int markerCount;
  final double segmentHeight;
  final double verticalInset;
  final Map<int, Color> markerColors;

  _TimelinePainter({
    required this.centerX,
    required this.markerCount,
    required this.segmentHeight,
    required this.verticalInset,
    required this.markerColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 2.0;

    final topY = verticalInset;
    final bottomY = verticalInset + ((markerCount - 1) * segmentHeight);

    canvas.drawLine(Offset(centerX, topY), Offset(centerX, bottomY), paintLine);

    const markerRadius = 5.0;

    for (var i = 0; i < markerCount; i++) {
      final y = verticalInset + (i * segmentHeight);
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
