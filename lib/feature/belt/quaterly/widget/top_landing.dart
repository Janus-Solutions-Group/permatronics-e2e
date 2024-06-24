import 'package:flutter/material.dart';
import 'package:manlift_app/feature/cage/widgets/section_title.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class BottomLanding extends StatelessWidget {
  const BottomLanding({super.key});

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
            buildSectionTitle('TOP LANDING#'),
            CustomRadioTile(
              title: '“Authorized Personnel Only” Sign: (2” letters)',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Instruction Sign: (1” letters)',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: '“TOP FLOOR – GET OFF” Sign: (2” letters)',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Location',
              values: const ["Below Landing", "Above Landing"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Red Warning Light:",
              values: const ['Yes', 'No', 'Inoperable'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Location",
              values: const ["Below Landing", "Above Landing"],
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
            CustomTextField(title: 'Control Rope Diameter'),
            CustomRadioTile(
              title: 'Type:',
              values: const ['Wire Center Cable', 'Non-Compliant'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Condition:',
              values: const ['OK', 'Replace Damaged', 'Replace Worn'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Control Rope Fasteners'),
            CustomRadioTile(
              title: 'Pinch Clips:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'U-Bolts:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Tape:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Tied:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Guide Rail Type:',
              values: const ['Channel', 'Angle'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                "Bowed",
                "Grooved",
                "Replace Damaged",
                "Replace Worn"
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Lighting:',
              values: const ['OK', 'Poor,'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Is Landing Clean/Free of Obstructions:',
              values: const ['Yes', 'No,'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Lateral Bracing:',
              values: const ['OK', 'Needs Add’l,'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Check Attachment Bolts:',
              values: const [
                'Yes',
                'No',
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Condition:',
              values: const ['OK', 'Missing'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'How Many'),
            CustomTextField(title: 'Intermediate Landing Commnets:')
          ],
        ),
      ),
    );
  }
}
