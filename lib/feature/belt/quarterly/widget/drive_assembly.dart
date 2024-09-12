import 'package:flutter/material.dart';

import '../../../common/widgets/custom_textfield.dart';
import '../../../common/widgets/form_header.dart';
import '../../../common/widgets/page_navigation_button.dart';
import '../../../common/widgets/radio_tile.dart';

class DriveAssembly extends StatelessWidget {
  const DriveAssembly({super.key, required this.pageController});
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
            FormHeaderTitle(title: "Drive Assembly"),
            CustomRadioTile(
              title: 'Head Circle Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Belt Tracking:',
              values: const ['OK', 'Off'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Lagging Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Head Shaft Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Head Pulley Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Is Head Pulley Centered:',
              values: const ['YES', 'NO'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Is Head Pulley level:',
              values: const ['YES', 'NO'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Coupler Type',
              values: const [
                'Old Style',
                'Flender',
                'High Speed',
                'David Brown',
                'Other'
              ],
              isTextField: true,
              fieldTitle: 'Other',
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Coupler Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Gear Box Type',
              values: const ['Reliance', 'Dodge', 'Falk', 'Ehrsam', 'Other'],
              isTextField: true,
              fieldTitle: 'Other',
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Gear Box Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Motor Type',
              values: const ['Reliance', 'Dodge', 'US Motors', 'GE', 'Other'],
              isTextField: true,
              fieldTitle: 'Other',
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Gear Box Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Brake',
              values: const [
                'Reliance',
                'Dodge',
                'Dings',
                'Sterns',
                'Band/Clamp Type',
                'Other'
              ],
              isTextField: true,
              fieldTitle: 'Other',
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Is there a Skip in the Drive',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Reason',
              values: [
                'Coupler Play',
                'Worn Gearbox',
                'Key Way',
                'Loose Set Screws'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Saf-T-Stop Brake',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Linkage',
              values: ['OK', 'Replace Damaged', 'Replace Worn'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title:
                  'Overall Saf-T-Stop Brake Condition: (i.e. micro switch arms, castings etc.)',
              values: ['OK', 'Monitor', 'Replace Damaged', 'Replace Worn'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Drive Unit Support Type',
              values: ['A-Frame', 'Beam'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Drive Unit Support Condition',
              values: ['OK', 'Other'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Drive Comments:'),
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
