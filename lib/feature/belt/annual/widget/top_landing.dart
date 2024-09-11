import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/annual/widget/bottom_landing.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../../../common/widgets/page_navigation_button.dart';

class TopLanding extends StatelessWidget {
  const TopLanding({super.key, required this.pageController});

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
            FormHeaderTitle(title: "TOP LANDING#"),
            CustomRadioTile(
              title: '“Authorized Personnel Only” Sign: (2” letters)',
              values: ['Yes', 'No', 'Non-Compliant'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Instruction Sign: (1” letters)',
              values: ['Yes', 'No', 'Non-Compliant'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: '“TOP FLOOR – GET OFF” Sign: (2” letters)',
              values: ['Yes', 'No', 'Non-Compliant'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Location:',
              values: ['Below Landing', 'Above Landing'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Within 24” of Ceiling:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Size of Letters:'),
            CustomRadioTile(
              title: 'Red Warning Light:',
              values: ['Yes', 'No', 'Inoperable'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Location:',
              values: ['Below Landing', 'Above Landing'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Floor Opening Shape:',
              values: ['Circular', 'Square'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Thickness:'),
            CustomRadioTile(
              title: 'Material:',
              values: ['Concrete', 'Steel', 'Other'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Diameter “Upside”:'),
            CustomTextField(title: 'Diameter “Downside”:'),
            CustomTextField(
                title:
                    'Distance from Face of Belt to Back Edge of Floor Opening “Upside”:'),
            CustomTextField(
                title:
                    'Distance from Face of Belt to Back Edge of Floor Opening “Downside”:'),
            CustomRadioTile(
              title: 'Distance from Floor Opening to Guard Rail “Upside”:',
              values: ['Compliant', 'Non-Compliant'],
              onChangeValue: (value) {},
            ),
            DistanceTextField(title: 'Back'),
            DistanceTextField(title: 'Left'),
            DistanceTextField(title: 'Right'),
            CustomRadioTile(
              title: 'Distance From Floor Opening to Guard Rail “Downside”:',
              values: ['Compliant', 'Non-Compliant'],
              onChangeValue: (value) {},
            ),
            DistanceTextField(title: 'Back'),
            DistanceTextField(title: 'Left'),
            DistanceTextField(title: 'Right'),
            CustomTextField(title: 'Guard Rail Height “Upside”:'),
            CustomTextField(title: 'Guard Rail Height “Downside”:'),
            CustomRadioTile(
              title: 'Guard Rail Material Used:',
              values: ['Angle', 'Square Tubing', 'Round Tubing', 'Wood'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Maze:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Description:'),
            CustomRadioTile(
              title: 'Self-Closing Gate:',
              values: ['1', '2', '3', '4'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Are Gates Self-Closing:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Open Outward:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Are Gates Missing:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'How Many:'),
            CustomRadioTile(
              title: 'Toeboard:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Add’l Toeboard Required:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Length:'),
            CustomRadioTile(
              title: 'Toeboard Material:',
              values: ['Steel', 'Raised Concrete', 'Other'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Toeboard Height:'),
            CustomTextField(title: 'Control Rope Diameter:'),
            CustomRadioTile(
              title: 'Type:',
              values: ['Wire Center', 'Cable', 'Non-Compliant'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Condition:',
              values: ['OK', 'Replace Damaged', 'Replace Worn'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Control Rope Fasteners:',
              values: ['Pinch Clips', 'U-Bolts', 'Tape', 'Tied'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Facing the “UP” Travel, is Rope on the:',
              values: ['Left', 'Right'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'C/L of Head Shaft to Floor:'),
            CustomTextField(title: 'C/L of Head Shaft to Ceiling/Obstruction:'),
            DistanceTextField(
                title: 'Measurement from Top of this Floor to Top of Floor#'),
            CustomRadioTile(
              title: 'Guide Rail Type:',
              values: ['Channel', 'Angle'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Guard Rail Condition:',
              values: [
                'OK',
                'Worn, but OK',
                'Bowed',
                'Grooved',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {},
            ),
            CustomTextField(
                title: 'OS-OS Rail Measurement @ Frame Brace Facing Belt:'),
            CustomTextField(
                title: 'OS-OS Rail Measurement @ Frame Brace Facing Side:'),
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
            CustomTextField(title: 'How Many:'),
            CustomRadioTile(
              title: 'Distance Between:',
              values: ['12”', 'Other'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Facing “Up” Travel Side, are the Ladder Rungs on:',
              values: ['Left', 'Right'],
              onChangeValue: (value) {},
            ),
            CustomTextField(
                title: 'Distance From C/L of Head Shaft to Bottom Floor:'),
            CustomRadioTile(
              title: 'Does Manlift have a work platform:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Is there an under-floor hood below the work platform:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Type of Hood:',
              values: ['Stationary', 'Moveable', 'Moveable Mini'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Hood Condition:',
              values: [
                'OK',
                'Damaged, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Hood Clearance: (Minimum 7’6”)',
              values: ['OK', 'Non-Compliant'],
              onChangeValue: (value) {},
            ),
            CustomTextField(
                title: 'If Stationary, Distance from Face of Belt:'),
            CustomTextField(title: 'Angle of Slope: °'),
            CustomRadioTile(
              title: 'Shape:',
              values: ['Circular', 'Square'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'If Moveable, What Type of Switch:',
              values: ['Mercury', 'Micro-Switch'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Location of Hinges:',
              values: ['6”', 'More than 6” with Obstruction', 'Other'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Counterweighted:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(
                title: 'Measurement From Top of This Floor to Top of Floor #:'),
            CustomRadioTile(
              title: 'Does Hood Have a Rolled Edge:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Condition:',
              values: [
                'OK',
                'Damaged, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Rope Guide Type:',
              values: ['Humphrey'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Distance Between Rope Guides:'),
            CustomRadioTile(
              title: 'Rope Guide Condition:',
              values: ['OK', 'Replace Damaged', 'Replace Worn'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Need Add’l:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'How Many:'),
            CustomTextField(
                title: 'Measurement From Top of This Floor to Top of Floor #:'),
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
              title: 'Attachment Bolts Condition:',
              values: ['OK', 'Missing'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'How Many:'),
            CustomRadioTile(
              title: 'Is there a visual and audible alerting system:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Top Landing Comments:'),
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
