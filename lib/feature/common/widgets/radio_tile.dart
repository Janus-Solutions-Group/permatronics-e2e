import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

List<Map<String, String?>> selectionsRef =
    []; // List to hold id, title, and value

class CustomRadioTile extends StatefulWidget {
  const CustomRadioTile(
      {super.key,
      this.id,
      this.title,
      required this.values,
      this.valueStyle,
      this.isTextField = false,
      this.fieldTitle,
      required this.onChangeValue,
      this.type,
      this.onFieldChange,
      this.fieldValue});

  final String? id;
  final String? title;
  final List<String> values;
  final TextStyle? valueStyle;
  final ValueChanged<String?> onChangeValue;
  final String? type;

  final String? fieldValue; // required for adding textfield
  final bool isTextField;
  final String? fieldTitle;
  final ValueChanged<String>? onFieldChange;

  // final TextEditingController
  @override
  State<CustomRadioTile> createState() => _CustomRadioTileState();
}

class _CustomRadioTileState extends State<CustomRadioTile> {
  String? currentVal;

  @override
  void initState() {
    currentVal = GetStorage().read(widget.id!) ?? '';
    // widget.onChangeValue(currentVal);
    // currentVal = widget.type ?? GetStorage().read(widget.id!);
    if (mounted) setState(() {});
    super.initState();
  }

  getLocalValueById() {}

  String formatString(String input) {
    // Convert to lowercase
    String result = input.toLowerCase();

    // Replace spaces and commas with underscores
    result =
        result.replaceAll(' ', '_').replaceAll(',', '').replaceAll('-', '-');

    return result;
  }

  void updateSelection(String id, String? title, String? value) {
    setState(() {
      final index = selectionsRef.indexWhere((element) => element['id'] == id);
      if (index >= 0) {
        selectionsRef[index]['value'] = value;
      } else {
        selectionsRef.add({'id': id, 'title': title, 'value': value});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Text(
              widget.title!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        Wrap(
          children: List.generate(
            widget.values.length,
            (index) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio.adaptive(
                  value: formatString(widget.values[index]),
                  groupValue: currentVal,
                  onChanged: (value) async {
                    if (widget.id != null) {
                      updateSelection(
                          widget.id.toString(), widget.title, value);
                    } else {
                      log('id is null');
                    }
                    final box = GetStorage();
                    await box.write(widget.id!, value);

                    setState(() {
                      currentVal = value;
                      widget.onChangeValue(value);
                    });
                  },
                ),
                // CupertinoRadio(value: value, groupValue: groupValue, onChanged: onChanged)
                Text(
                  widget.values[index],
                  style: widget.valueStyle,
                )
              ],
            ),
          ),
        ),

        if (currentVal != null && currentVal == widget.fieldValue)
          Padding(
            padding: const EdgeInsets.only(bottom: 25, left: 18, right: 18),
            child: TextField(
              maxLines: null,
              onChanged: widget.onFieldChange,
              decoration: InputDecoration(
                labelText: widget.fieldTitle ?? widget.fieldValue,
              ),
            ),
          ),
        // const SizedBox(height: 0),
      ],
    );
  }
}
