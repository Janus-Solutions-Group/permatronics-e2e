import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class SignaturePad extends StatefulWidget {
  const SignaturePad({super.key, required this.signatureChanged});

  final ValueChanged<ui.Image> signatureChanged;

  @override
  State<SignaturePad> createState() => _SignaturePadState();
}

class _SignaturePadState extends State<SignaturePad>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Write your Signature here',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.4,
            child: SfSignaturePad(
              key: _signaturePadKey,
              backgroundColor: Colors.grey[200],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  child: const Text("Clear"),
                  onPressed: () {
                    _signaturePadKey.currentState!.clear();
                    // widget.signatureChanged(image);
                  },
                ),
                ElevatedButton(
                  child: const Text("Next"),
                  onPressed: () async {
                    ui.Image image =
                        await _signaturePadKey.currentState!.toImage();
                    widget.signatureChanged(image);
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('This signature is confirmed')));
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
