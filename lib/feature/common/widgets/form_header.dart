import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:image_picker/image_picker.dart';

class FormHeaderTitle extends StatefulWidget {
  const FormHeaderTitle({
    super.key,
    required this.title,
    this.values,
    this.currentValue,
    this.onChanged,
  });

  final String title;
  final List<String>? values;
  final String? currentValue;
  final ValueChanged<String?>? onChanged;

  @override
  State<FormHeaderTitle> createState() => _FormHeaderTitleState();
}

class _FormHeaderTitleState extends State<FormHeaderTitle>
    with AutomaticKeepAliveClientMixin {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final imageFile = await _picker.pickImage(source: source);

    if (imageFile != null) {
      File tmpFile = File(imageFile.path);
      log("path - - ${tmpFile.path}");
      await Gal.putImage(tmpFile.path);
      setState(() {
        _image = tmpFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0).copyWith(right: 20),
      child: Column(
        children: [
          Center(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _pickImage(ImageSource.camera);
                    // setState(() {});
                  },
                  child: _image != null
                      ? const Icon(
                          Icons.check_circle,
                          size: 30,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.camera_alt_outlined,
                          size: 30,
                          color: Colors.blue,
                        ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          if (widget.values != null)
            Wrap(
              children: List.generate(
                widget.values!.length,
                (index) => Row(
                  children: [
                    Radio.adaptive(
                      value: widget.values![index],
                      groupValue: widget.currentValue,
                      onChanged: widget.onChanged,
                    ),
                    Text(widget.values![index])
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
