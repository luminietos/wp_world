import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/utils/spacing.dart';
import 'package:wp_world/theme/app_interactions.dart';
import 'package:wp_world/widgets/components/app_button.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();

  bool _isSending = false;
  bool _sentSuccess = false;
  bool _sentError = false;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSending = true;
      _sentSuccess = false;
      _sentError = false;
    });

    final uri = Uri.parse("https://formspree.io/f/YOUR_FORM_ID");

    try {
      final response = await http.post(
        uri,
        headers: {"Accept": "application/json"},
        body: {
          "name": _nameCtrl.text,
          "email": _emailCtrl.text,
          "message": _messageCtrl.text,
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          _sentSuccess = true;
        });
        _formKey.currentState!.reset();
      } else {
        setState(() {
          _sentError = true;
        });
      }
    } catch (_) {
      setState(() {
        _sentError = true;
      });
    }

    setState(() {
      _isSending = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;

    return Semantics(
      label: localizations.contactFormLabel,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // NAME
            Text(localizations.contactFormNameLabel),
            SizedBox(height: Spacing.sm),
            TextFormField(
              controller: _nameCtrl,
              decoration: const InputDecoration(),
              validator: (v) => v == null || v.isEmpty ? "Required" : null,
            ),
            SizedBox(height: Spacing.lg),

            // EMAIL
            Text(localizations.contactFormEmailLabel),
            SizedBox(height: Spacing.sm),
            TextFormField(
              controller: _emailCtrl,
              decoration: const InputDecoration(),
              keyboardType: TextInputType.emailAddress,
              validator: (v) => v == null || v.isEmpty || !v.contains("@")
                  ? "Required"
                  : null,
            ),
            SizedBox(height: Spacing.lg),

            // MESSAGE
            Text(localizations.contactFormMessageLabel),
            SizedBox(height: Spacing.sm),
            TextFormField(
              controller: _messageCtrl,
              decoration: const InputDecoration(),
              maxLines: 6,
              validator: (v) => v == null || v.isEmpty ? "Required" : null,
            ),
            SizedBox(height: Spacing.xl),

            // SEND BUTTON
            AppButton(
              label: localizations.sendLabel,
              onPressed: _isSending ? null : _submit,
            ),

            SizedBox(height: Spacing.lg),

            if (_sentSuccess)
              Text(
                localizations.contactFormSuccess,
                style: TextStyle(color: colors.primary),
              ),

            if (_sentError)
              Text(
                localizations.contactFormError,
                style: TextStyle(color: colors.error),
              ),
          ],
        ),
      ),
    );
  }
}
