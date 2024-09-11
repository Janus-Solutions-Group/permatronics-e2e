import 'package:flutter/material.dart';

class CustomRadioTile extends StatefulWidget {
  const CustomRadioTile({
    super.key,
    this.title,
    required this.values,
    this.valueStyle,
    this.isTextField = false,
    this.fieldTitle,
    required this.onChangeValue,
    this.type,
  });

  final String? title;
  final List<String> values;
  final TextStyle? valueStyle;
  final bool isTextField;
  final String? fieldTitle;
  final ValueChanged<String?> onChangeValue;
  final String? type;
  // final TextEditingController
  @override
  State<CustomRadioTile> createState() => _CustomRadioTileState();
}

class _CustomRadioTileState extends State<CustomRadioTile> {
  String? currentVal;

  @override
  void initState() {
    currentVal = widget.type;
    if (mounted) setState(() {});
    super.initState();
  }

  String formatString(String input) {
    // Convert to lowercase
    String result = input.toLowerCase();

    // Replace spaces and commas with underscores
    result = result
        .replaceAll(' ', '_')
        .replaceAll(',', '')
        .replaceAll('-', '_')
        .replaceAll('/', '');

    return result;
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
                  onChanged: (value) {
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
        // Wrap(
        //   children: List.generate(
        //     widget.values.length,
        //     (index) => RadioListTile.adaptive(
        //       value: widget.values[index],
        //       groupValue: currentVal,
        //       onChanged: (value) {
        //         setState(() {
        //           currentVal = value;
        //           widget.onChangeValue(value);
        //         });
        //       },
        //       title: Text(widget.values[index], style: widget.valueStyle),
        //     ),
        //   ),
        // ),
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
