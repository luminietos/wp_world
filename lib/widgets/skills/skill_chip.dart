// PILL-SHAPED SKILL CHIP USING SOFT/TECH/onSurface COLOR LOGIC

import 'package:flutter/material.dart';
import 'package:wp_world/helpers/localization_help.dart';
import 'package:wp_world/models/skills/skill.dart';
import 'package:wp_world/utils/tech_colors.dart';
import 'package:wp_world/utils/spacing.dart';
import 'package:wp_world/l10n/app_localizations.dart';

class SkillChip extends StatelessWidget {
  final Skill skill;
  final bool isSoftSkill;

  const SkillChip({super.key, required this.skill, this.isSoftSkill = false});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;

    // Localized label
    final label = localizations.getString(skill.labelKey);

    // Detect tech skill
    final techResolvedColor = techColor(context, label);
    final isTechSkill = techResolvedColor != colors.secondary;

    // Color logic
    late final Color borderColor;
    late final Color textColor;

    if (isSoftSkill) {
      borderColor = colors.tertiary;
      textColor = colors.tertiary;
    } else if (isTechSkill) {
      borderColor = techResolvedColor;
      textColor = techResolvedColor;
    } else {
      borderColor = colors.onSurface;
      textColor = colors.onSurface;
    }

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
