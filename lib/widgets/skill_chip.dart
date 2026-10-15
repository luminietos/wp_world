// PILL-SHAPED SKILL CHIP USING TECH COLORS OR TERTIARY COLOR

import 'package:flutter/material.dart';
import 'package:wp_world/helpers/localization_help.dart';
import 'package:wp_world/models/skills/skill.dart';
import 'package:wp_world/utils/tech_colors.dart';
import 'package:wp_world/utils/spacing.dart';
import 'package:wp_world/l10n/app_localizations.dart';

class SkillChip extends StatelessWidget {
  final Skill skill;

  const SkillChip({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;

    // Resolve localized label
    final label = localizations.getString(skill.labelKey);

    // Resolve tech color
    final techResolvedColor = techColor(context, label);

    // Determine if this is a tech skill
    final isTechSkill = techResolvedColor != colors.secondary;

    // Final color logic
    final borderColor = isTechSkill ? techResolvedColor : colors.tertiary;
    final textColor = borderColor;

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
              color: colors.surface,
              borderRadius: BorderRadius.circular(Spacing.xl),
              border: Border.all(color: borderColor, width: 1.5),
            ),
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
