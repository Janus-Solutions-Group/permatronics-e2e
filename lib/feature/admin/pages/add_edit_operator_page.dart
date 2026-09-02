import 'package:flutter/material.dart';
import 'package:manlift_app/data/models/operator_model.dart';
import 'package:manlift_app/feature/auth/widgets/auth_text_field.dart';
import 'package:manlift_app/services/operator_service.dart';
import 'package:manlift_app/util/navigate.dart';

/// Reused for both "add" (existing == null) and "edit" (name-only) flows.
class AddEditOperatorPage extends StatefulWidget {
  const AddEditOperatorPage({super.key, this.existing});

  final OperatorModel? existing;

  @override
  State<AddEditOperatorPage> createState() => _AddEditOperatorPageState();
}

class _AddEditOperatorPageState extends State<AddEditOperatorPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController =
      TextEditingController(text: widget.existing?.name ?? '');
  late final TextEditingController _emailController =
      TextEditingController(text: widget.existing?.email ?? '');
  bool _isSubmitting = false;
  String? _errorMessage;

  bool get _isEditMode => widget.existing != null;

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

    if (_isEditMode) {
      await OperatorService()
          .updateOperatorName(widget.existing!.uid, _nameController.text.trim());
      if (!mounted) return;
      moveBack(context);
      return;
    }

    final result = await OperatorService().addOperatorWithAutoProvision(
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
      appBar:
          AppBar(title: Text(_isEditMode ? 'Edit Operator' : 'Add Operator')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AuthTextField(
                controller: _nameController,
                labelText: 'Full Name',
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Enter a name' : null,
              ),
              AuthTextField(
                controller: _emailController,
                labelText: 'Email',
                enabled: !_isEditMode,
                keyboardType: TextInputType.emailAddress,
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Enter an email' : null,
              ),
              if (_isEditMode)
                const Padding(
                  padding: EdgeInsets.only(top: 4, bottom: 8),
                  child: Text(
                    'Email cannot be changed here.',
                    style: TextStyle(color: Colors.black54, fontSize: 12),
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
                    : Text(_isEditMode ? 'Save' : 'Add Operator'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
