// DEFINES THE TOP-LEVEL CONTACT PAGE CONTENT MODEL
// Includes intro text and a list of contact methods, each with optional links and accessibility notes.

import 'package:wp_world/models/contact/contact_method.dart';
import 'package:wp_world/models/global/localized_text_block.dart';

class ContactInfo {
  final List<ContactMethod> methods;
  final List<LocalizedTextBlock> introBlocks;

  const ContactInfo({required this.methods, required this.introBlocks});
}
