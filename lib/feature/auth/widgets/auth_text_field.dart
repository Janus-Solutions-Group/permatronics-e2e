import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.enabled = true,
    this.keyboardType,
    this.validator,
  });

  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final bool enabled;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late bool _obscured = widget.obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscured,
        enabled: widget.enabled,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        decoration: InputDecoration(
          labelText: widget.labelText,
          border: const OutlineInputBorder(),
          // Only password-type fields (obscureText: true) get the toggle.
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                      _obscured ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => _obscured = !_obscured),
                )
              : null,
        ),
      ),
    );
  }
}
