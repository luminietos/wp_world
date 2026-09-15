// A STRUCTURED MODEL FOR ANY IMAGE THAT APPEARS IN A PROJECT CASE STUDY

import 'package:flutter/material.dart';
import 'package:wp_world/helpers/localization_helpers.dart';

class ProjectImage {
  final String path;
  final String captionKey;

  ProjectImage({required this.path, required this.captionKey});

  factory ProjectImage.fromJson(Map<String, dynamic> json) {
    return ProjectImage(
      path: json['path'] as String,
      captionKey: json['caption_key'] as String,
    );
  }

  // LOCALIZED CAPTION
  String caption(BuildContext context) => localized(context, captionKey);
}
