// A STRUCTURED MODEL FOR ANY IMAGE THAT APPEARS IN A PROJECT CASE STUDY
// Can be used elsewhere, but is primarily intended for use in the case study page, where images are often accompanied by captions that require localization support.

import 'package:flutter/material.dart';
import 'package:wp_world/helpers/localization_helpers.dart';

class ProjectImage {
  final String path;
  final String captionKey;
  final bool isDecorative;
  final String? semanticLabel;

  ProjectImage({
    required this.path,
    required this.captionKey,
    this.isDecorative =
        false, // defaults to false = the image is considered content and should be described for accessibility!
    this.semanticLabel,
  });

  factory ProjectImage.fromJson(Map<String, dynamic> json) {
    return ProjectImage(
      path: json['path'] as String,
      captionKey: json['caption_key'] as String,
      isDecorative: json['is_decorative'] as bool? ?? false,
      semanticLabel: json['semantic_label'] as String?,
    );
  }

  // LOCALIZED CAPTION
  String caption(BuildContext context) => localized(context, captionKey);
}
