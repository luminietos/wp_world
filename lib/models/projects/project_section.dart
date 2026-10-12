// STRUCTURED CASE STUDY SECTIONS
// Provides accessible, localized text for each section of a case study, including the heading and body content.
// Has optional semantic labels and ARIA descriptions for improved accessibility.

class ProjectSection {
  final String headingKey;
  final String bodyKey;
  final int headingLevel;
  final String? semanticLabel;
  final String? ariaDescription;

  ProjectSection({
    required this.headingKey,
    required this.bodyKey,
    required this.headingLevel,
    this.semanticLabel,
    this.ariaDescription,
  });

  factory ProjectSection.fromJson(Map<String, dynamic> json) {
    return ProjectSection(
      headingKey: json['heading_key'] as String,
      bodyKey: json['body_key'] as String,
      headingLevel: json['heading_level'] as int,
      semanticLabel: json['semantic_label'] as String?,
      ariaDescription: json['aria_description'] as String?,
    );
  }
}
