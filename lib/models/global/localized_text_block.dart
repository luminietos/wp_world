// FOUNDATION OF THE CONTENT SYSTEM, USED ACROSS ALL PAGES
// Each block is localialized, structured and accessible for paragraphs, headings and lists.

enum TextBlockType { paragraph, heading, list }

class LocalizedTextBlock {
  final TextBlockType type;
  final String key; // ARB key
  final int? headingLevel; // for headings
  final List<String>? listKeys; // for lists
  final String? semanticLabel;
  final String? ariaDescription;
  final bool isDecorative;

  const LocalizedTextBlock({
    required this.type,
    required this.key,
    this.headingLevel,
    this.listKeys,
    this.semanticLabel,
    this.ariaDescription,
    this.isDecorative = false,
  });
}
