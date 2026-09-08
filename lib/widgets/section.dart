// GIVES PAGES VERTICAL RHYTHM AND SEMANTIC CONTAINER/STRUCTURE

import 'package:flutter/material.dart';
import '../utils/spacing.dart';

class Section extends StatelessWidget {
  final Widget child;

  const Section({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Spacing.xl),
        child: child,
      ),
    );
  }
}
