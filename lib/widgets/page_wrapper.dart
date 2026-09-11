import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import '../utils/layout.dart';

class PageWrapper extends StatelessWidget {
  final Widget child;

  const PageWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Semantics(
      container: true,
      label: localizations.pageContentWrapper,
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        padding: EdgeInsets.symmetric(
          horizontal: Layout.horizontalPadding(),
          vertical: 32,
        ),
        alignment: Alignment.topCenter,
        child: LayoutBuilder(
          builder: (context, constraints) => SizedBox(
            width: double.infinity,
            height: constraints.maxHeight,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: Layout.maxWidth()),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
