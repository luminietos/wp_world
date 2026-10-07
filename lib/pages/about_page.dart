import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wp_world/data/timeline_data.dart';
import 'package:wp_world/l10n/app_localizations.dart';
// import 'package:wp_world/utils/spacing.dart';
import 'package:wp_world/widgets/section.dart';
import 'package:wp_world/widgets/timeline.dart';

@RoutePage()
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Section(
            title: localizations.pagesAbout,
            child: SizedBox(
              height: 600,
              child: VerticalTimeline(events: timelineEvents),
            ),
          ),
        ],
      ),
    );
  }
}
