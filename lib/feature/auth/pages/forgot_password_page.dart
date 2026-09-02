import 'package:flutter/material.dart';
import 'package:manlift_app/feature/auth/widgets/auth_text_field.dart';
import 'package:manlift_app/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key, this.initialEmail});

  /// Prefills the email field, e.g. with whatever the user had already
  /// typed on the Login screen before tapping "Forgot password?".
  final String? initialEmail;

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  late final _emailController =
      TextEditingController(text: widget.initialEmail ?? '');
  bool _isSubmitting = false;
  bool _emailSent = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isSubmitting = true;
      _errorMessage = null;
      _emailSent = false;
    });
    final result = await context
        .read<AuthProvider>()
        .sendPasswordReset(_emailController.text);
    if (!mounted) return;
    setState(() {
      _isSubmitting = false;
      if (result.isSuccess) {
        _emailSent = true;
      } else {
        _errorMessage = result.userMessage;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Enter the email associated with your account and we'll "
                'send you a link to reset your password.',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 16),
              AuthTextField(
                controller: _emailController,
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Enter your email' : null,
              ),
              if (_emailSent) ...[
                const SizedBox(height: 12),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.mark_email_read, color: Colors.green, size: 20),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Reset email sent. Check your inbox — and your spam '
                        'or junk folder — for the link. Wrong email? Change '
                        'it above and send again.',
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ],
              if (_errorMessage != null) ...[
                const SizedBox(height: 8),
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _isSubmitting ? null : _submit,
                child: _isSubmitting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: Colors.white),
                      )
                    : Text(_emailSent ? 'Resend Reset Email' : 'Send Reset Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
