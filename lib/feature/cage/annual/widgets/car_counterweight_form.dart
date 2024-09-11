import 'package:flutter/material.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class AnnualCageCarCounterWeightForm extends StatefulWidget {
  const AnnualCageCarCounterWeightForm(
      {super.key, required this.pageController});
  final PageController pageController;

  @override
  State<AnnualCageCarCounterWeightForm> createState() =>
      _AnnualCageCarCounterWeightFormState();
}

class _AnnualCageCarCounterWeightFormState
    extends State<AnnualCageCarCounterWeightForm> {
  String? cleanVal;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormHeaderTitle(title: "CAR & COUNTERWEIGHT FASTENING"),
          CustomRadioTile(
            title: 'Hoist Cable Fasteners to Car:',
            values: const [
              "Poured Babbit",
              "Cable Clamps",
              "Fistgrips",
              "Wedge Socket",
              "Other"
            ],
            onChangeValue: (value) {},
            isTextField: true,
            fieldTitle: "Other",
          ),
          CustomRadioTile(
            title: 'Number of Fasteners Per Cable::',
            values: const ["1", "2", "3"],
            onChangeValue: (value) {},
          ),
          CustomRadioTile(
            title: 'Hoist Cable Fasteners to CW:',
            values: const [
              "Poured Babbit",
              "Cable Clamps",
              "Fistgrips",
              "Wedge Socket",
              "Other"
            ],
            onChangeValue: (value) {},
            isTextField: true,
            fieldTitle: "Other",
          ),
          CustomRadioTile(
            title: 'Number of Fasteners Per Cable::',
            values: const ["1", "2", "3"],
            onChangeValue: (value) {},
          ),
          CustomRadioTile(
            title: 'Hoist Cable Number:',
            values: const ["2", "3"],
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
          CustomRadioTile(
            title: 'Governor Cable Fasteners:',
            values: const [
              "Poured Babbit",
              "Cable Clamps",
              "Fistgrips",
              "Wedge Socket",
              "Other"
            ],
            onChangeValue: (value) {},
            isTextField: true,
            fieldTitle: "Other",
          ),
          CustomRadioTile(
            title: 'Governor Release Type:',
            values: const [
              "Ball & Socket",
              "T-Arm",
              "Fistgrips",
              "Pull Arm",
            ],
            onChangeValue: (value) {},
          ),
          CustomRadioTile(
            title: 'Location',
            values: const ['Left', 'Right'],
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
