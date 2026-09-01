import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_country_flags/flutter_country_flags.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../state/language_provider.dart';

class LanguageToggle extends ConsumerWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref.watch(languageProvider);

    return DropdownButton<String>(
      value: lang,
      underline: const SizedBox(),
      items: [
        DropdownMenuItem(
          value: "en",
          child: Row(
            children: [
              FlutterCountryFlags(
                country: Country.unitedStates,
                width: 24,
                height: 16,
              ),
              SizedBox(width: 8),
              const Text("English"),
            ],
          ),
        ),
        DropdownMenuItem(
          value: "fi",
          child: Row(
            children: [
              FlutterCountryFlags(
                country: Country.finland,
                width: 24,
                height: 16,
              ),
              const SizedBox(width: 8),
              const Text("Suomi"),
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
