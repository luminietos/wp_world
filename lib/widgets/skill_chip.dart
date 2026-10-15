// PILL-SHAPED SKILL CHIP USING TECH COLORS & INTERACTIONS

import 'package:flutter/material.dart';
import 'package:wp_world/helpers/localization_help.dart';
import 'package:wp_world/models/skills/skill.dart';
import 'package:wp_world/utils/tech_colors.dart';
import 'package:wp_world/utils/spacing.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/theme/app_interactions.dart';

class SkillChip extends StatelessWidget {
  final Skill skill;

  const SkillChip({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final label = localizations.getString(skill.labelKey);
    final color = techColor(context, label);

    return Semantics(
      label: label,
      button: false,
      child: Padding(
        padding: EdgeInsets.only(right: Spacing.sm, bottom: Spacing.sm),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Spacing.md,
              vertical: Spacing.xs,
            ),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: color),
            ),
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
