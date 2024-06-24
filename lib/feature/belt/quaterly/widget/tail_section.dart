import 'package:flutter/material.dart';
import 'package:manlift_app/feature/cage/widgets/section_title.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class TailSectionFootAssembly extends StatelessWidget {
  const TailSectionFootAssembly({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionTitle('Tail Section/ Foot Assembly'),
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
              title: "Bearing Housing Condition",
              values: const [
                "OK",
                "Worn, but OK",
                "Replaced Damaged",
                "Replaced Worn"
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Foot Shaft Condition",
              values: const [
                "OK",
                "Worn, but OK",
                "Replaced Damaged",
                "Replaced Worn"
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Foot Shaft Condition",
              values: const [
                "OK",
                "Worn, but OK",
                "Replaced Damaged",
                "Replaced Worn"
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Food Pulley Condition",
              values: const [
                "OK",
                "Worn, but OK",
                "Replaced Damaged",
                "Replaced Worn"
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Type of Belt Adjustment",
              values: const ["Floating", "Manual"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Is Foot Pulley Centered",
              values: const ["Yes", "NO"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Belt Tracking",
              values: const ["OK", "Off"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Debris Deflector",
              values: const ["Yes", "No"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Condition",
              values: const ["Replace Damaged", "Replaced Worn"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Rope Sheaves",
              values: const ["Yes", "No"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Condition",
              values: const ["Replace Damaged", "Replaced Worn"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Yoke Assembly",
              values: const ["Yes", "No"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Condition",
              values: const ["Replace Damaged", "Replaced Worn"],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: "Tail Section/ Foot Assembly Comments"),
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
      ),
    );
  }
}
