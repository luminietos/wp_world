// DEFINES A SKILL CATEGORY MODEL
// Used to represent and group more than one skill into categories for display on the Skills page.
// (Utilized in: navigation, accessibility grouping, filtering, etc.)

class SkillCategory {
  final String id;
  final String labelKey; // ARB key for the category label
  final List<String> skillIds;

  const SkillCategory({
    required this.id,
    required this.labelKey,
    required this.skillIds,
  });
}
