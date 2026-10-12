// DEFINES A SINGLE CONTACT METHOD (email, linkedin, etc.) FOR THE CONTACT PAGE

class ContactMethod {
  final String id;
  final String labelKey;
  final String url;
  final String? semanticLabel;

  const ContactMethod({
    required this.id,
    required this.labelKey,
    required this.url,
    this.semanticLabel,
  });
}
