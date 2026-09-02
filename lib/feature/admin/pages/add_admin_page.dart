import 'package:flutter/material.dart';
import 'package:manlift_app/feature/auth/widgets/auth_text_field.dart';
import 'package:manlift_app/services/operator_service.dart';
import 'package:manlift_app/util/navigate.dart';

class AddAdminPage extends StatefulWidget {
  const AddAdminPage({super.key});

  @override
  State<AddAdminPage> createState() => _AddAdminPageState();
}

class _AddAdminPageState extends State<AddAdminPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  bool _isSubmitting = false;
  String? _errorMessage;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isSubmitting = true;
      _errorMessage = null;
    });

    final result = await OperatorService().addAdminWithAutoProvision(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
    );
    if (!mounted) return;
    if (result.isSuccess) {
      moveBack(context);
    } else {
      setState(() {
        _isSubmitting = false;
        _errorMessage = result.userMessage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Admin')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'This grants full admin access immediately — they can manage '
                'operators and other admins.',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 16),
              AuthTextField(
                controller: _nameController,
                labelText: 'Full Name',
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Enter a name' : null,
              ),
              AuthTextField(
                controller: _emailController,
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Enter an email' : null,
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
                    : const Text('Add Admin'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
