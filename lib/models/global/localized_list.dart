// LOCALIZED LIST MODEL FOR ORDERED OR UNORDERED LISTS
// To be used in any page that needs bullet points or numbered lists, with localization support.

enum LocalizedListType { ordered, unordered }

class LocalizedList {
  final LocalizedListType type;
  final List<String> itemKeys; // ARB keys for each list item
  final String? semanticLabel;
  final String? ariaDescription;

  const LocalizedList({
    required this.type,
    required this.itemKeys,
    this.semanticLabel,
    this.ariaDescription,
  });
}
