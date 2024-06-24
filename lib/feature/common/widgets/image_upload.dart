import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manlift_app/feature/cage/widgets/section_title.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';

class ImagePickingWidget extends StatefulWidget {
  const ImagePickingWidget({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<ImagePickingWidget> createState() => _ImagePickingWidgetState();
}

class _ImagePickingWidgetState extends State<ImagePickingWidget> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          buildSectionTitle('Upload Image'),
          const SizedBox(height: 20),
          _image != null
              ? CircleAvatar(
                  radius: 70,
                  backgroundImage: FileImage(_image!),
                )
              : CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.blue.shade100,
                ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.camera),
            child: const Text('Pick from Camera'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.gallery),
            child: const Text('Pick from Gallery'),
          ),
          const Spacer(),
          PageNavigationButton(
            pageController: widget.pageController,
            right: false,
          )
        ],
      ),
    );
  }
}
