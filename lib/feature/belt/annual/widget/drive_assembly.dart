import 'package:flutter/material.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../../../common/widgets/page_navigation_button.dart';

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
            FormHeaderTitle(title: "Drive Assembly#"),
            CustomRadioTile(
              title: 'Head Circle Type:',
              values: ['Cast', 'Bands', 'None'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Circle Condition:',
              values: [
                'OK',
                'Worn, but OK',
                'Replace',
                'Damaged',
                'Replaced Worn'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Belt Tracking:',
              values: ['OK', 'Off', '', '', '', ''],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Lagging Condition:',
              values: [
                'OK',
                'Worn, but OK',
                'Replace',
                'Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Fastening Method:',
              values: ['Bolt', 'Drive Screws'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Head Shaft Bearing #:',
              values: ['1', '2', '3', '4'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Type:',
              values: ['Pillow Block', 'High Box'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Head Shaft Bearing Size:'),
            CustomRadioTile(
              title: 'Condition:',
              values: [
                'OK',
                'Worn, but OK',
                'Dry',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Head Shaft Diameter:'),
            CustomTextField(title: 'Head Shaft Length:'),
            CustomRadioTile(
              title: 'Key:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Bushings:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Set Screws:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Shaft Condition:',
              values: ['OK', 'Worn, but OK', 'Replace Damaged', 'Replace Worn'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Head Pulley Type:',
              values: ['Spoked', 'Solid'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Size:',
              values: ['20”', '21”'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Pulley Condition:',
              values: ['OK', 'Worn, but OK', 'Replace Damaged', 'Replace Worn'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Is Head Pulley Centered:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Level:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Coupler Type:',
              values: [
                'Old Style',
                'Flender',
                'High Speed',
                'David Brown',
                'Other'
              ],
              onChangeValue: (value) {},
              isTextField: true,
              fieldTitle: "Other",
            ),
            CustomRadioTile(
              title: 'Condition:',
              values: [
                'OK',
                'Worn, but OK',
                'Replace Inserts',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Gear Box Type:',
              values: ['Reliance', 'Dodge', 'Falk', 'Ehrsam', 'Other'],
              onChangeValue: (value) {},
              isTextField: true,
              fieldTitle: "Other",
            ),
            CustomTextField(title: 'Gear Box ID#:'),
            CustomRadioTile(
              title: 'Condition:',
              values: [
                'OK',
                'Worn, but OK',
                'Seal Leaks',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Motor Type:',
              values: ['Reliance', 'Dodge', 'U.S. Motors', 'GE', 'Other'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Motor ID#:'),
            CustomTextField(title: 'H.P.:'),
            CustomRadioTile(
              title: 'Voltage:',
              values: ['208', '230/240', '460/480'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Brake:',
              values: [
                'Reliance',
                'Dodge',
                'Dings',
                'Sterns',
                'Band/Clamp Type',
                'Other'
              ],
              onChangeValue: (value) {},
              isTextField: true,
              fieldTitle: "Other",
            ),
            CustomTextField(title: 'Brake ID#:'),
            CustomTextField(title: 'FT. LBS.:'),
            CustomRadioTile(
              title: 'Is there a Skip in the Drive:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(
                title:
                    'Reason: Coupler Play Worn Gearbox Key Way Loose Set Screws'),
            CustomRadioTile(
              title: 'Saf-T-Stop Brake:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Linkage:',
              values: ['OK', 'Replace Damaged', 'Replace Worn'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Overall Saf-T-Stop Brake Condition:',
              values: ['OK', 'Monitor', 'Replace Damaged', 'Replace Worn'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Drive Unit Support Type:',
              values: ['A-Frame', 'Beam'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Drive Unit Support Condition:',
              values: ['OK', 'Other'],
              onChangeValue: (value) {},
              isTextField: true,
              fieldTitle: "Other",
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
