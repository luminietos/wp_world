// DEFINES A SKILL MODEL
// Used to represent one singular skill in the Skills section of AboutPage.

class Skill {
  final String id;
  final String labelKey; // ARB key for the skill label
  final String? semanticLabel;

  const Skill({required this.id, required this.labelKey, this.semanticLabel});
}
