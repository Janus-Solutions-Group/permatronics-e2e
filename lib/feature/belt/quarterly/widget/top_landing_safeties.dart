import 'package:flutter/material.dart';

import '../../../common/widgets/custom_textfield.dart';
import '../../../common/widgets/form_header.dart';
import '../../../common/widgets/page_navigation_button.dart';
import '../../../common/widgets/radio_tile.dart';

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
            FormHeaderTitle(title: "TOP LANDING SAFETIES"),
            CustomRadioTile(
              title: 'Type 1:',
              values: const ['Knock Out Bar', 'Photo Eye'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Type 1: Condition',
              values: const [
                'OK',
                'Inoperative',
                'Replace Switch',
                'Replace Whole Assembly'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Type 2:',
              values: const ['Photo Eye', 'In-Track', 'Split Rail'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Location',
              values: const ['Right', 'Left'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Type 2: Condition',
              values: const [
                'OK',
                'Inoperative',
                'Replace Switch',
                'Replace Whole Assembly'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Type 3:',
              values: const ['Photo Eye', 'In-Track', 'Split Rail'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Location',
              values: const ['Right', 'Left'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Type 3: Condition',
              values: const [
                'OK',
                'Inoperative',
                'Replace Switch',
                'Replace Whole Assembly'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Type 4:',
              values: const ['Photo Eye', 'In-Track', 'Split Rail'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Location',
              values: const ['Right', 'Left'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Type 4: Condition',
              values: const [
                'OK',
                'Inoperative',
                'Replace Switch',
                'Replace Whole Assembly'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Top Reset',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Location'),
            CustomRadioTile(
              title: 'Complaint',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Condition',
              values: const ['Ok', 'Inoperative'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Are Safety Stop Device Switches:',
              values: const ['Manual', 'Self-Resetting', "Both"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Is there a visual and audible alerting system',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Top Safeties Comments:'),
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
