import 'package:flutter/material.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../../../common/widgets/page_navigation_button.dart';

class TopLandingSafeties extends StatelessWidget {
  const TopLandingSafeties({super.key, required this.pageController});

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
            FormHeaderTitle(title: "Top Landing Safeties".toUpperCase()),
            CustomRadioTile(
              title: 'Type 1:',
              values: ['Knock Out Bar', 'Photo Eye'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Type 1 Condition:',
              values: [
                'OK',
                'Inoperable',
                'Replace Switch',
                'Replace Whole Assembly'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Type 2:',
              values: ['Photo Eye', 'In-Track', 'Split Rail'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Location:',
              values: ['Right', 'Left'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Type 2 Condition:',
              values: [
                'OK',
                'Inoperable',
                'Replace Switch',
                'Replace Whole Assembly'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Type 3:',
              values: ['Photo Eye', 'In-Track', 'Split Rail'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Location:',
              values: ['Right', 'Left'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Type 3 Condition:',
              values: [
                'OK',
                'Inoperable',
                'Replace Switch',
                'Replace Whole Assembly'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Type 4:',
              values: ['Photo Eye', 'In-Track', 'Split Rail'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Location:',
              values: ['Right', 'Left'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Type 4 Condition:',
              values: [
                'OK',
                'Inoperable',
                'Replace Switch',
                'Replace Whole Assembly'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Top Reset:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Location'),
            CustomRadioTile(
              title: 'Compliant:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Condition:',
              values: ['OK', 'Inoperable'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Are Safety Stop Device Switches:',
              values: ['Manual', 'Self-Resetting', 'Both'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Is there a visual and audible alerting system:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Top Safeties Comments'),
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
