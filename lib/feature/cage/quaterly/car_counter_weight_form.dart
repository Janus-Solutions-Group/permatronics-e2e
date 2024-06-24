import 'package:flutter/material.dart';
import 'package:manlift_app/feature/cage/widgets/section_title.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class CarCounterWeightForm extends StatefulWidget {
  const CarCounterWeightForm({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<CarCounterWeightForm> createState() => _CarCounterWeightFormState();
}

class _CarCounterWeightFormState extends State<CarCounterWeightForm> {
  String? cleanVal;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSectionTitle('CAR & COUNTERWEIGHT FASTENING'),
          CustomRadioTile(
            title: 'Hoist Cable Number:',
            values: ["2", "3"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Size',
            values: ["3/8”", "1/2”"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Condition',
            values: ["OK", "Replace", "Monitor"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Governor Cable Size:',
            values: ["3/8”", "1/2”"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Condition',
            values: ["OK", "Replace", "Monitor"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PageNavigationButton(
                pageController: widget.pageController,
                right: false,
              ),
              PageNavigationButton(
                pageController: widget.pageController,
                right: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
