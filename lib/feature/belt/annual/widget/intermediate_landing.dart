import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/annual/widget/bottom_landing.dart';
import 'package:manlift_app/feature/common/widgets/custom_title.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class IntermediateLanding extends StatelessWidget {
  const IntermediateLanding({super.key, required this.pageController});

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
            FormHeaderTitle(title: "INTERMEDIATE LANDING#"),
            CustomRadioTile(
              title: '“Authorized Personnel Only” Sign: (2” letters)',
              values: const ['Yes', 'No', 'Non-Compliant'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Instruction Sign: (1” letters)',
              values: const ['Yes', 'No', 'Non-Compliant'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Floor Opening Shape',
              values: const ['Circular', 'Shape'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Thickness:'),
            CustomRadioTile(
              title: 'Material:',
              values: const ['Concrete', 'Steel'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Diameter “Upside”'),
            CustomTextField(title: 'Diameter “Downside”'),
            CustomTitle(
                title:
                    'Distance from Face of Belt to Back Edge of Floor Opening:'),
            CustomTextField(title: '“Upside”:'),
            CustomTextField(title: '“Downside”:'),
            CustomRadioTile(
              title: 'Distance from Floor Opening to Guard Rail “Upside”:',
              values: const ['Compliant', 'Non-Compliant'],
              onChangeValue: (value) {},
            ),
            DistanceTextField(title: 'Back'),
            DistanceTextField(title: 'Left'),
            DistanceTextField(title: 'Right'),
            CustomRadioTile(
              title: 'Distance from Floor Opening to Guard Rail “Downside”:',
              values: const ['Compliant', 'Non-Compliant'],
              onChangeValue: (value) {},
            ),
            DistanceTextField(title: 'Back'),
            DistanceTextField(title: 'Left'),
            DistanceTextField(title: 'Right'),
            CustomTitle(title: 'Guard Rail Height:'),
            CustomTextField(title: '“Upside”:'),
            CustomTextField(title: '“Downside”:'),
            CustomRadioTile(
              title: 'Guard Rail Material Used:',
              values: const ['Angle', 'Square Tubing', 'Round Tubing', 'Woo'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Maze:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Description'),
            CustomRadioTile(
              title: 'Self Closing Gate:',
              values: const ['1', '2', '3', '4'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Open Outward:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Are Gates Missing:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'How Many'),
            CustomRadioTile(
              title: 'Toeboard:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Add’l Toeboard Required:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Length'),
            CustomRadioTile(
              title: 'Toeboard Material:',
              values: const ['Steel', 'Raised Concrete', 'Other'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Toeboard Height:'),
            CustomRadioTile(
              title: 'Type of Hood:',
              values: const ['Stationary', 'Moveable', 'Moveable Mini', 'None'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Hood Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Hood Clearance: : (Minimum 7’6”)',
              values: const ['OK', 'Non-Compliant'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'If Stationary, Distance from Face of Belt'),
            CustomTextField(title: 'Angle of Slope'),
            CustomRadioTile(
              title: 'Shape',
              values: const ['Circular', 'Square'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'if Moveable, What type of Switch:',
              values: const ['Mercury', 'Micro-Switch'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Location of Hinges:',
              values: const ['6”', 'More than 6” with Obstruction', 'Other'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Counterweighted:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Does Hood Have a Rolled Edge:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Condition of Rolled Edge:',
              values: [
                'OK',
                'Damaged, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Ladder Rungs:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Rung Attachment:',
              values: ['Bolted', 'Welded'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Condition:',
              values: ['OK', 'Replace Damaged'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'How Many'),
            CustomRadioTile(
              title: 'Distance Between Rungs:',
              values: ['12”', 'Other'],
              onChangeValue: (value) {},
              isTextField: true,
              fieldTitle: 'Other',
            ),
            CustomRadioTile(
              title: 'Facing “Up” Travel Side, Are the Ladder Rungs On:',
              values: ['Left', 'Right'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Tension of Belt:',
              values: ['OK', 'Loose', 'Tight'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Rope Guide Type:',
              values: ['Humphrey'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Distance Between Ropw Guides'),
            CustomRadioTile(
              title: 'Condition:',
              values: ['OK', 'Replace Damaged', 'Replace Worn'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Need Add’l:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'How Many'),
            DistanceTextField(
                title: 'Measurement from Top of this Floor to Top of Floor #'),
            CustomRadioTile(
              title: 'Lighting:',
              values: ['OK', 'Poor'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Is Landing Clean/Free of Obstructions:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Lateral Bracing:',
              values: ['OK', 'Needs Add’l'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Check Attachment Bolts:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Condition:',
              values: ['OK', 'Missing'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'How Many'),
            CustomRadioTile(
              title: 'Is there a visual and audible alerting system:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Intermediate Landing Comments:'),
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
