import 'package:flutter/material.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';

import '../../../common/widgets/form_header.dart';
import '../../../common/widgets/radio_tile.dart';

class TailSection extends StatelessWidget {
  const TailSection({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FormHeaderTitle(title: "Tail Section/ Foot Assembly"),
          CustomRadioTile(
            title: "Leg Condition",
            values: const [
              "OK",
              "Worn, but OK",
              "Replaced Damaged",
              "Replaced Worn"
            ],
            onChangeValue: (value) {},
          ),
          CustomRadioTile(
            title: "Leg Anchors",
            values: const ['Yes', 'No'],
            onChangeValue: (value) {},
          ),
          CustomRadioTile(
            title: "Leg Anchored to",
            values: const ['Concrete', 'Steel'],
            onChangeValue: (value) {},
          ),
          CustomRadioTile(
            title: "Bottom Circle Type",
            values: const ['Bands', 'Cast', 'None'],
            onChangeValue: (value) {},
          ),
          CustomRadioTile(
            title: "Bottom Circle Condition",
            values: const [
              "OK",
              "Worn, but OK",
              "Replaced Damaged",
              "Replaced Worn"
            ],
            onChangeValue: (value) {},
          ),
          CustomRadioTile(
            title: "Bottom Bearings",
            values: const ['Yes', 'No', 'Bushings'],
            onChangeValue: (value) {},
          ),
          CustomRadioTile(
            title: "Bottom Bearing Condition",
            values: const [
              "OK",
              "Worn, but OK",
              "Replaced Damaged",
              "Replaced Worn"
            ],
            onChangeValue: (value) {},
          ),
          CustomRadioTile(
            title: "Bearing Housing Condition",
            values: const [
              "OK",
              "Worn, but OK",
              "Replaced Damaged",
              "Replaced Worn"
            ],
            onChangeValue: (value) {
              // bearingHousingCondition = value;
            },
          ),
          CustomTextField(title: 'Foot Shaft Diameter'),
          CustomTextField(title: 'Foot Shaft Length'),
          CustomRadioTile(
            title: "Foot Shaft Condition",
            values: const [
              "OK",
              "Worn, but OK",
              "Replaced Damaged",
              "Replaced Worn"
            ],
            onChangeValue: (value) {
              // footShaftCondition = value;
            },
          ),
          CustomRadioTile(
            title: "Does Foot Shaft Have",
            values: const ['Key', 'Bushing', 'Set Screws'],
            onChangeValue: (value) {
              // footPulleyCondition = value;
            },
          ),
          CustomTextField(
              title: 'Distance From Floor to Center Line of Foot Shaft:'),
          CustomRadioTile(
            title: "Pulley Condition",
            values: const [
              "OK",
              "Worn, but OK",
              "Replaced Damaged",
              "Replaced Worn"
            ],
            onChangeValue: (value) {
              // footPulleyCondition = value;
            },
          ),
          CustomRadioTile(
            title: "Type of Belt Adjustment",
            values: const ["Floating", "Manual"],
            onChangeValue: (value) {
              // typeOfBeltAdjustment = value;
            },
          ),
          CustomRadioTile(
            title: "Is Foot Pulley Centered",
            values: const ["Yes", "NO"],
            onChangeValue: (value) {
              // isFootPulleyCentered = value;
            },
          ),
          CustomRadioTile(
            title: "Belt Tracking",
            values: const ["OK", "Off"],
            onChangeValue: (value) {},
          ),
          CustomRadioTile(
            values: const ["\u2191", "\u2193"],
            onChangeValue: (value) {},
            valueStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
          CustomRadioTile(
            values: const ["\u2190", "\u2192"],
            onChangeValue: (value) {},
            valueStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
          CustomRadioTile(
            title: "Debris Deflector",
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              // debrisDeflector = value;
            },
          ),
          CustomRadioTile(
            title: "Debris Deflector Condition",
            values: const ["Replace Damaged", "Replaced Worn"],
            onChangeValue: (value) {
              // debrisDeflectorCondition = value;
            },
          ),
          CustomRadioTile(
            title: "Rope Sheaves",
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              // ropeSheaves = value;
            },
          ),
          CustomRadioTile(
            title: "Rope Sheaves Condition",
            values: const ["Replace Damaged", "Replaced Worn"],
            onChangeValue: (value) {
              // ropeSheavesCondition = value;
            },
          ),
          CustomRadioTile(
            title: "Yoke Assembly",
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              // yokeAssembly = value;
            },
          ),
          CustomRadioTile(
            title: "Yoke Assembly Condition",
            values: const ["Replace Damaged", "Replaced Worn"],
            onChangeValue: (value) {
              // yokeAssemblyConditon = value;
            },
          ),
          CustomTextField(
            title: "Tail Section/ Foot Assembly Comments",
            // controller: tailSectionComment,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PageNavigationButton(
                pageController: pageController,
                right: false,
              ),
              PageNavigationButton(
                pageController: pageController,
                right: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
