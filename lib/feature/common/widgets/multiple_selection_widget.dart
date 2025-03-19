import 'package:flutter/material.dart';
import 'package:manlift_app/data/models/original_model.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';
import 'package:manlift_app/provider/selection_ref_provider.dart';
import 'package:provider/provider.dart';

class MultipleSelectionWidget extends StatefulWidget {
  const MultipleSelectionWidget(
      {super.key, required this.original, required this.onSelectionChanged});

  final OriginalModel original;
  final ValueChanged<List<String>> onSelectionChanged;

  @override
  State<MultipleSelectionWidget> createState() =>
      _MultipleSelectionWidgetState();
}

class _MultipleSelectionWidgetState extends State<MultipleSelectionWidget> {
  List<String> selectedItems = [];
  String formatString(String input) {
    // Convert to lowercase
    String result = input.toLowerCase();

    // Replace spaces and commas with underscores
    result =
        result.replaceAll(' ', '_').replaceAll(',', '').replaceAll('-', '-');

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.original.title != null)
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Text(
              widget.original.title!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        Wrap(
          children: widget.original.values
              .map(
                (item) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox.adaptive(
                      value: selectedItems.contains(formatString(item)),
                      onChanged: (val) {
                        setState(() {
                          if (val == true) {
                            selectedItems.add(formatString(item));
                          } else {
                            selectedItems.remove(formatString(item));
                          }
                          widget.onSelectionChanged(selectedItems);
                          context.read<SelectionRefProvider>().updateSelection(
                                widget.original.id.toString(),
                                widget.original.title,
                                selectedItems.join(', '),
                              );
                        });
                      },
                    ),
                    Text(item)
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
