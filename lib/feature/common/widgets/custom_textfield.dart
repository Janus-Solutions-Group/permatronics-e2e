import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.id,
      required this.title,
      this.keyboard,
      this.controller,
      this.subtitle,
      this.onChanged});

  final String? id;
  final String title;
  final String? subtitle;
  final TextInputType? keyboard;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          TextFormField(
            controller: controller,
            maxLines: null,
            keyboardType: keyboard,
            onChanged: onChanged,
          ),
          if (subtitle != null)
            Text(
              subtitle!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
        ],
      ),
    );
  }
}
