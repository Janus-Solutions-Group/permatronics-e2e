import 'package:flutter/material.dart';
import 'package:manlift_app/feature/auth/pages/forgot_password_page.dart';
import 'package:manlift_app/feature/auth/pages/signup_page.dart';
import 'package:manlift_app/feature/auth/widgets/auth_text_field.dart';
import 'package:manlift_app/provider/auth_provider.dart';
import 'package:manlift_app/util/navigate.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isSubmitting = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isSubmitting = true;
      _errorMessage = null;
    });
    final result = await context.read<AuthProvider>().signIn(
          _emailController.text,
          _passwordController.text,
        );
    if (!mounted) return;
    setState(() {
      _isSubmitting = false;
      _errorMessage = result.isSuccess ? null : result.userMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 48),
                const Text(
                  'Perma Tronic Elevator',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Sign in to continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 32),
                AuthTextField(
                  controller: _emailController,
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? 'Enter your email'
                      : null,
                ),
                AuthTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  obscureText: true,
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Enter your password' : null,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => moveTo(
                        context,
                        ForgotPasswordPage(
                            initialEmail: _emailController.text)),
                    child: const Text('Forgot password?'),
                  ),
                ),
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
                      : const Text('Sign In'),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => moveTo(context, const SignupPage()),
                  child: const Text("Don't have an account? Sign Up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
