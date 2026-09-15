// STRUCTURED CASE STUDY SECTIONS

class ProjectSection {
  final String headingKey;
  final String bodyKey;

  ProjectSection({required this.headingKey, required this.bodyKey});

  factory ProjectSection.fromJson(Map<String, dynamic> json) {
    return ProjectSection(
      headingKey: json['heading_key'] as String,
      bodyKey: json['body_key'] as String,
    );
  }
}
