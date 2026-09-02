import 'package:flutter/material.dart';
import 'package:manlift_app/feature/auth/widgets/auth_text_field.dart';
import 'package:manlift_app/provider/auth_provider.dart';
import 'package:manlift_app/util/navigate.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isSubmitting = false;
  String? _errorMessage;
  bool _accountCreated = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isSubmitting = true;
      _errorMessage = null;
    });
    final result = await context.read<AuthProvider>().signUp(
          _nameController.text.trim(),
          _emailController.text,
          _passwordController.text,
        );
    if (!mounted) return;
    setState(() {
      _isSubmitting = false;
      if (result.isSuccess) {
        _accountCreated = true;
      } else {
        _errorMessage = result.userMessage;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_accountCreated) {
      return Scaffold(
        appBar: AppBar(title: const Text('Sign Up')),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.hourglass_top, size: 72, color: Colors.orange),
              const SizedBox(height: 16),
              const Text(
                'Account created! An administrator needs to approve your '
                'account before you can sign in.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => moveBack(context),
                child: const Text('Back to Sign In'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AuthTextField(
                  controller: _nameController,
                  labelText: 'Full Name',
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? 'Enter your name'
                      : null,
                ),
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
                  validator: (v) => (v == null || v.length < 6)
                      ? 'Password must be at least 6 characters'
                      : null,
                ),
                AuthTextField(
                  controller: _confirmPasswordController,
                  labelText: 'Confirm Password',
                  obscureText: true,
                  validator: (v) => v != _passwordController.text
                      ? 'Passwords do not match'
                      : null,
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
                      : const Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
