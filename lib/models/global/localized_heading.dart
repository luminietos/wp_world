// A LOCALIZED HEADING MODEL WITH ACCESSIBILITY METADATA
// Used for titles, section headers, structured blocks, and WCAG-AA compliant structure.

class LocalizedHeading {
  final String key; // ARB key for heading text
  final int level; // h1-h6 equivalent
  final String? semanticLabel;
  final String? ariaDescription;

  const LocalizedHeading({
    required this.key,
    required this.level,
    this.semanticLabel,
    this.ariaDescription,
  });
}
