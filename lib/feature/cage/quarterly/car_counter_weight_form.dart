import 'package:flutter/material.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class CarCounterWeightForm extends StatefulWidget {
  const CarCounterWeightForm({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<CarCounterWeightForm> createState() => _CarCounterWeightFormState();
}

class _CarCounterWeightFormState extends State<CarCounterWeightForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormHeaderTitle(title: "CAR & COUNTERWEIGHT FASTENING"),
          CustomRadioTile(
            title: 'Hoist Cable Number:',
            values: ["2", "3"],
            onChangeValue: (value) {},
          ),
          CustomRadioTile(
            title: 'Size',
            values: ["3/8”", "1/2”"],
            onChangeValue: (value) {},
          ),
          CustomRadioTile(
            title: 'Condition',
            values: ["OK", "Replace", "Monitor"],
            onChangeValue: (value) {},
          ),
          CustomRadioTile(
            title: 'Governor Cable Size:',
            values: ["3/8”", "1/2”"],
            onChangeValue: (value) {},
          ),
          CustomRadioTile(
            title: 'Condition',
            values: ["OK", "Replace", "Monitor"],
            onChangeValue: (value) {},
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
