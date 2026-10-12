// DEFINES ACCESSIBILITY NOTES FOR CASE STUDIES
// Used to explain accessibility decisions and compliance.

// ACCESSIBILITY NOTE FOR CASE STUDIES.
// USED TO EXPLAIN ACCESSIBILITY DECISIONS AND COMPLIANCE.

class ProjectAccessibilityNote {
  final String key; // ARB key
  final String? semanticLabel;
  final String? ariaDescription;

  const ProjectAccessibilityNote({
    required this.key,
    this.semanticLabel,
    this.ariaDescription,
  });

  factory ProjectAccessibilityNote.fromJson(Map<String, dynamic> json) {
    return ProjectAccessibilityNote(
      key: json['key'],
      semanticLabel: json['semanticLabel'],
      ariaDescription: json['ariaDescription'],
    );
  }
}
