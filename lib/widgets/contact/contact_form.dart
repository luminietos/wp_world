import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:wp_world/l10n/app_localizations.dart';
import 'package:wp_world/utils/spacing.dart';
import 'package:wp_world/theme/app_interactions.dart';
import 'package:wp_world/widgets/components/app_button.dart';
import 'package:wp_world/utils/icon_sizes.dart';

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
  bool _sentError = false;

  final _websiteCtrl = TextEditingController(); // Honeypot field for spam bots

  Future<void> _submit() async {
    // IGNORE SUBMISSION IF HONEYPOT IS FILLED as it's likely a bot
    if (_websiteCtrl.text.isNotEmpty) {
      return;
    }
    // VALIDATE FORM FIELDS before submission
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSending = true;
      _sentError = false;
    });

    final uri = Uri.parse("https://formspree.io/f/xnnbrdjb");

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
        _formKey.currentState!.reset();

        _nameCtrl.clear();
        _emailCtrl.clear();
        _messageCtrl.clear();

        await _showSuccessDialog();
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

  Future<void> _showSuccessDialog() async {
    final localizations = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    if (!mounted) return;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(localizations.contactTitle),
          content: Text(localizations.contactFormSuccess),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                localizations.okLabel,
                style: textTheme.bodyMedium!.copyWith(color: colors.primary),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;

    return Semantics(
      label: localizations.contactFormLabel,

      // CTRL+ENTER SUBMITS THE FORM (for desktop users)
      child: Shortcuts(
        shortcuts: {
          // FOR WINDOWS
          LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.enter):
              const ActivateIntent(),

          // FOR MAC
          LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.enter):
              const ActivateIntent(),
        },
        child: Actions(
          actions: {
            ActivateIntent: CallbackAction<ActivateIntent>(
              onInvoke: (_) {
                if (!_isSending) {
                  _submit();
                }
                return null;
              },
            ),
          },
          // THE FORM ITSELF
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HONEYPOT FIELD (hidden from users, visible to bots)
                Visibility(
                  visible: false,
                  maintainState: true,
                  child: TextFormField(
                    controller: _websiteCtrl,
                    maxLength: 100,
                    autofillHints: const [],
                    enabled:
                        !_isSending, // disable honeypot field when sending to avoid accidental submission
                  ),
                ),

                // NAME
                Text(
                  localizations.contactFormNameLabel,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colors.primary,
                  ),
                ),
                SizedBox(height: Spacing.sm),
                Semantics(
                  textField: true,
                  label: localizations.contactFormNameLabel,
                  child: TextFormField(
                    controller: _nameCtrl,

                    autofillHints: const [AutofillHints.name],

                    textInputAction: TextInputAction.next,
                    maxLength: 100,

                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: colors.primary,
                        size: IconSizes.inline,
                      ),
                    ),

                    enabled:
                        !_isSending, // disable field when sending to avoid accidental submission

                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return localizations.formFieldRequired;
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: Spacing.lg),

                // EMAIL
                Text(
                  localizations.contactFormEmailLabel,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colors.primary,
                  ),
                ),
                SizedBox(height: Spacing.sm),
                Semantics(
                  textField: true,
                  label: localizations.contactFormEmailLabel,
                  child: TextFormField(
                    controller: _emailCtrl,

                    keyboardType: TextInputType.emailAddress,

                    autofillHints: const [AutofillHints.email],

                    textInputAction: TextInputAction.next,
                    maxLength: 254,

                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: colors.primary,
                        size: IconSizes.inline,
                      ),
                    ),

                    enabled: !_isSending, // disable field when sending

                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return localizations.formFieldRequired;
                      }

                      if (!value.contains('@')) {
                        return localizations.errorInvalidEmail;
                      }

                      return null;
                    },
                  ),
                ),

                SizedBox(height: Spacing.lg),

                // MESSAGE
                Text(
                  localizations.contactFormMessageLabel,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colors.primary,
                  ),
                ),
                SizedBox(height: Spacing.sm),
                Semantics(
                  textField: true,
                  label: localizations.contactFormMessageLabel,
                  child: TextFormField(
                    controller: _messageCtrl,

                    textInputAction: TextInputAction.newline,

                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.chat_bubble_outline,
                        color: colors.primary,
                        size: IconSizes.inline,
                      ),
                      alignLabelWithHint: true,
                    ),

                    maxLines: 10,
                    maxLength: 1000,

                    enabled: !_isSending, // disable field when sending

                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return localizations.formFieldRequired;
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: Spacing.xl),

                // SEND BUTTON
                AppButton(
                  label: localizations.sendLabel,
                  onPressed: _isSending ? null : _submit,
                  isLoading: _isSending,
                ),

                SizedBox(height: Spacing.lg),

                // ERROR MESSAGE
                if (_sentError)
                  Text(
                    localizations.contactFormError,
                    style: TextStyle(color: colors.error),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
