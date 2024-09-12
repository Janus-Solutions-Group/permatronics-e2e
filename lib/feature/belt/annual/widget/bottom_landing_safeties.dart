import 'package:flutter/material.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class BottomLandingSafeties extends StatelessWidget {
  const BottomLandingSafeties({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHeaderTitle(title: "Bottom Landing Safeties"),
            CustomRadioTile(
              title: "Type 1:",
              values: const ["Treadle", "Photo Eye"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Condition:",
              values: const [
                'OK',
                'Inoperable',
                'Replace Switch',
                'Replace Whole Assembly'
              ],
              onChangeValue: (value) {},
            ),
            Wrap(
              children: [
                CustomRadioTile(
                  title: "Type 2:",
                  values: const ["Photo Eye", "In-Track" "Split Rail"],
                  onChangeValue: (value) {},
                ),
                CustomRadioTile(
                  title: "Location:",
                  values: const ["Right", "Left", "Split Rail"],
                  onChangeValue: (value) {},
                ),
              ],
            ),
            CustomRadioTile(
              title: "Condition:",
              values: const [
                'OK',
                'Inoperable',
                'Replace Switch',
                'Replace Whole Assembly'
              ],
              onChangeValue: (value) {},
            ),
            Wrap(
              children: [
                CustomRadioTile(
                  title: "Type 3:",
                  values: const ["Photo Eye", "In-Track" "Split Rail"],
                  onChangeValue: (value) {},
                ),
                CustomRadioTile(
                  title: "Location:",
                  values: const ["Right", "Left", "Split Rail"],
                  onChangeValue: (value) {},
                ),
              ],
            ),
            CustomRadioTile(
              title: "Condition:",
              values: const [
                'OK',
                'Inoperable',
                'Replace Switch',
                'Replace Whole Assembly'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Bottom Reset:",
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: "Location:"),
            CustomRadioTile(
              title: 'Compliant',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Condition',
              values: ['OK', 'Inoperable'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Is there a Visual and Audible Alerting System:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: "Bottom Safeties Comments"),
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
