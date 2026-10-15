import 'package:flutter/material.dart';
import 'package:wp_world/helpers/localization_help.dart';
import 'package:wp_world/models/skills/skill.dart';
import 'package:wp_world/models/skills/skill_category.dart';
import 'package:wp_world/utils/responsive.dart';
import 'package:wp_world/utils/spacing.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/widgets/skills/skill_chip.dart';

class SkillsSection extends StatelessWidget {
  final List<SkillCategory> categories;
  final List<Skill> skills;

  const SkillsSection({
    super.key,
    required this.categories,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile;

    final softSkillIds = categories
        .where((category) => category.id.toLowerCase().contains('soft'))
        .expand((category) => category.skillIds)
        .toSet();
    final softSkills = skills
        .where((skill) => softSkillIds.contains(skill.id))
        .toList();
    final otherCategories = categories
        .where((category) => !category.id.toLowerCase().contains('soft'))
        .toList();

    if (isMobile) {
      // MOBILE — stacked vertically
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSoftSkills(context, softSkills),
          SizedBox(height: Spacing.lg),
          ...otherCategories.map((cat) => _buildCategory(context, cat)),
        ],
      );
    }

    // TABLET / DESKTOP — two columns
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // LEFT COLUMN — soft skills
        Expanded(flex: 1, child: _buildSoftSkills(context, softSkills)),

        SizedBox(width: Spacing.xl),

        // RIGHT COLUMN — hard skills + tech stack
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: otherCategories.map((cat) {
              return Padding(
                padding: EdgeInsets.only(bottom: Spacing.xl),
                child: _buildCategory(context, cat),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // SOFT SKILLS
  Widget _buildSoftSkills(BuildContext context, List<Skill> softSkills) {
    final localizations = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.aboutStrengthsHeading,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: Spacing.md),
        Wrap(
          spacing: Spacing.sm,
          runSpacing: Spacing.sm,
            children: softSkills
              .map((skill) => SkillChip(skill: skill, isSoftSkill: true))
              .toList(),
        ),
      ],
    );
  }

  // Hard skills + tech stack use SkillChip
  Widget _buildCategory(BuildContext context, SkillCategory category) {
    final localizations = AppLocalizations.of(context)!;

    final categorySkills = category.skillIds.map((id) {
      return skills.firstWhere((s) => s.id == id);
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.getString(category.labelKey),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: Spacing.md),
        Wrap(
          spacing: Spacing.sm,
          runSpacing: Spacing.sm,
          children: categorySkills.map((s) => SkillChip(skill: s)).toList(),
        ),
      ],
    );
  }
}
