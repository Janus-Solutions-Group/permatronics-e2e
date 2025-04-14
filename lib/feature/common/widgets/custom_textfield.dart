import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manlift_app/provider/selection_ref_provider.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.id,
      this.header = false,
      required this.title,
      this.keyboard,
      this.controller,
      this.subtitle,
      this.onChanged});

  final String id;
  final bool header;
  final String title;
  final String? subtitle;
  final TextInputType? keyboard;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? initialValue;
  @override
  void initState() {
    initialValue = GetStorage().read(widget.id) ?? "";
    // if (initialValue == "" && widget.controller != null) {
    //   initialValue = widget.controller!.text;
    // }
    if (initialValue != null) {
      context
          .read<SelectionRefProvider>()
          .updateSelection(widget.id, widget.title, initialValue);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          widget.header
              ? TextFormField(
                  controller: widget.controller,
                  maxLines: null,
                  keyboardType: widget.keyboard,
                  onChanged: (value) async {
                    context
                        .read<SelectionRefProvider>()
                        .updateSelection(widget.id, widget.title, value);
                    await GetStorage().write(widget.id, value);

                    if (widget.onChanged != null) widget.onChanged!(value);
                  },
                )
              : TextFormField(
                  initialValue: widget.header ? null : initialValue,
                  maxLines: null,
                  keyboardType: widget.keyboard,
                  onChanged: (value) async {
                    context
                        .read<SelectionRefProvider>()
                        .updateSelection(widget.id, widget.title, value);
                    await GetStorage().write(widget.id, value);

                    if (widget.onChanged != null) widget.onChanged!(value);
                  },
                ),
          if (widget.subtitle != null)
            Text(
              widget.subtitle!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
        ],
      ),
    );
  }
}
