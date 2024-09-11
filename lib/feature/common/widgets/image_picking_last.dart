import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';

class ImagePickingWidget extends StatefulWidget {
  const ImagePickingWidget({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<ImagePickingWidget> createState() => _ImagePickingWidgetState();
}

class _ImagePickingWidgetState extends State<ImagePickingWidget> {
  List<File> imagelist = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      imagelist.add(File(pickedFile.path));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Text(
            'Form Image List',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Pick From Gallery'),
          ),
          const SizedBox(height: 30),
          if (imagelist.isEmpty)
            const Center(
              child: Text(
                "No Image Selected",
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
            ),
          Expanded(
            child: ListView.separated(
              itemCount: imagelist.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Image.file(imagelist[index]),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: IconButton(
                          onPressed: () {
                            imagelist.removeAt(index);
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.cancel,
                            size: 40,
                            color: Colors.green,
                          )),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 15),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PageNavigationButton(
                pageController: widget.pageController,
                right: false,
              ),
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.gallery),
                child: const Text('Submit'),
              ),
            ],
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
