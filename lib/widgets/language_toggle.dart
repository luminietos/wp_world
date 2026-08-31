import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/language_provider.dart';

class LanguageToggle extends ConsumerWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref.watch(languageProvider);

    return DropdownButton<String>(
      value: lang,
      underline: const SizedBox(),
      items: const [
        DropdownMenuItem(value: "en", child: Text("EN")),
        DropdownMenuItem(value: "fi", child: Text("FI")),
      ],
      onChanged: (value) {
        if (value != null) {
          ref.read(languageProvider.notifier).setLanguage(value);
        }
      },
    );
  }
}
