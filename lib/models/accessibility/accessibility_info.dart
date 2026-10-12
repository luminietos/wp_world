// DEFINES GLOBAL ACCESSIBILITY INFORMATION
// Used for any page that needs to provide additional accessibility information, such as screen reader text or other assistive technology support.

import 'package:wp_world/models/global/localized_text_block.dart';

class AccessibilityInfo {
  final List<LocalizedTextBlock> blocks;

  const AccessibilityInfo({required this.blocks});
}
