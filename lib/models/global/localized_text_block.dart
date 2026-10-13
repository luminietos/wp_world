// FOUNDATION OF THE CONTENT SYSTEM, USED ACROSS ALL PAGES
// Each block is localized, structured and accessible for paragraphs, headings and lists.

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

  // REQUIRED FOR ALL LOADERS
  factory LocalizedTextBlock.fromJson(Map<String, dynamic> json) {
    return LocalizedTextBlock(
      type: _parseType(json['type']),
      key: json['key'] ?? '',
      headingLevel: json['headingLevel'],
      listKeys: json['listKeys'] != null
          ? List<String>.from(json['listKeys'])
          : null,
      semanticLabel: json['semanticLabel'],
      ariaDescription: json['ariaDescription'],
      isDecorative: json['isDecorative'] ?? false,
    );
  }

  static TextBlockType _parseType(String raw) {
    switch (raw) {
      case 'heading':
        return TextBlockType.heading;
      case 'list':
        return TextBlockType.list;
      case 'paragraph':
      default:
        return TextBlockType.paragraph;
    }
  }
}
