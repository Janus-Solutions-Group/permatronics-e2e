import 'package:flutter/material.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class Handholds extends StatelessWidget {
  const Handholds({super.key, required this.pageController});

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
            FormHeaderTitle(title: "Handholds"),
            CustomRadioTile(
              title: 'Handhold Type',
              values: const ['L55', 'Cup', 'Open'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Handhold Color',
              values: const ['Blue', 'Yellow', 'Other'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Number of Households'),
            CustomRadioTile(
              title: 'Depth: (3”)',
              values: const ['OK', 'Non-Compliant'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Distance from Belt: (2”)',
              values: const ['OK', 'Non-Compliant'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Distance from Step: (48”-56”)',
              values: const ['OK', 'Non-Compliant'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Punching Pattern:',
              values: const ['8 7/8”', '9” ', 'Other'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Condition of Bolts',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Handhold Comments:'),
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
