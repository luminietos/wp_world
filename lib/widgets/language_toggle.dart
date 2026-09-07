import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_country_flags/flutter_country_flags.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wp_world/utils/responsive.dart';

import '../state/language_provider.dart';

class LanguageToggle extends ConsumerWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref.watch(languageProvider);
    final isMobile = Responsive.isMobile;
    final isTablet = Responsive.isTablet;
    final notMobileOrTablet = !isMobile && !isTablet;
    final modSpace = notMobileOrTablet ? 8.w : 16.w;

    return DropdownButton<String>(
      value: lang,
      underline: const SizedBox(),
      items: [
        DropdownMenuItem(
          value: "en",
          child: Row(
            children: [
              FlutterCountryFlags(
                country: Country.unitedStates, // Type-safe enum
                width: 24.0,
                height: 16.0,
              ),
              SizedBox(width: modSpace),
              notMobileOrTablet ? const Text("English") : const Text("EN"),
            ],
          ),
        ),
        DropdownMenuItem(
          value: "fi",
          child: Row(
            children: [
              FlutterCountryFlags(
                country: Country.finland,
                width: 24.0,
                height: 16.0,
              ),
              SizedBox(width: modSpace),
              notMobileOrTablet ? const Text("Suomi") : const Text("FI"),
            ],
          ),
        ),
      ],
      onChanged: (value) {
        if (value != null) {
          ref.read(languageProvider.notifier).setLanguage(value);
        }
      },
    );
  }
}
