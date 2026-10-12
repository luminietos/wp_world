// DEFINES AN OPTIONAL CONTACT LINK MODEL FOR EXTRA LINKS
// Used for secondary contact options (e.g., social media, email, or other contact methods)
// that may be displayed on the ContactPage, or in other relevant sections of the application.

class ContactLink {
  final String id;
  final String labelKey; // ARB
  final String url;
  final String? semanticLabel;

  const ContactLink({
    required this.id,
    required this.labelKey,
    required this.url,
    this.semanticLabel,
  });
}
