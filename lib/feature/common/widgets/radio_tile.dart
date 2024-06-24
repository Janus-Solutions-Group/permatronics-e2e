import 'package:flutter/material.dart';

class CustomRadioTile extends StatefulWidget {
  const CustomRadioTile({
    super.key,
    required this.title,
    required this.values,
    this.isTextField = false,
    this.fieldTitle,
    required this.onChangeValue,
  });

  final String title;
  final List<String> values;
  final bool isTextField;
  final String? fieldTitle;
  final ValueChanged<String?> onChangeValue;
  // final TextEditingController
  @override
  State<CustomRadioTile> createState() => _CustomRadioTileState();
}

class _CustomRadioTileState extends State<CustomRadioTile> {
  String? type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        Wrap(
          children: List.generate(
            widget.values.length,
            (index) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                  value: widget.values[index],
                  groupValue: type,
                  onChanged: (value) {
                    setState(() {
                      type = value;
                      widget.onChangeValue(value);
                    });
                  },
                ),
                Text(widget.values[index])
              ],
            ),
          ),
        ),
        if (widget.isTextField)
          Padding(
            padding: const EdgeInsets.only(bottom: 25, left: 18, right: 18),
            child: TextField(
              // controller: ,
              maxLines: null,
              decoration: InputDecoration(labelText: widget.fieldTitle),
            ),
          ),
        // const SizedBox(height: 0),
      ],
    );
  }
}
