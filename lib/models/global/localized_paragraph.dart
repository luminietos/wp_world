// LOCALIZED PARAGRAPH MODEL USED FOR RICH-TEXT CONTENT
// Used by all pages, supports WCAG-AA accessibility and localization

class LocalizedParagraph {
  final String key; // ARB key for the paragraph text
  final String? semanticLabel;
  final String? ariaDescription;
  final bool isDecorative;

  const LocalizedParagraph({
    required this.key,
    this.semanticLabel,
    this.ariaDescription,
    this.isDecorative = false,
  });
}
