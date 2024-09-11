import 'package:flutter/material.dart';
import 'package:manlift_app/feature/common/widgets/custom_title.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class BottomLanding extends StatelessWidget {
  const BottomLanding({super.key, required this.pageController});
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
            FormHeaderTitle(title: "BOTTOM LANDING = LANDING#1"),
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
              title: '“BOTTOM FLOOR – GET OFF” Sign: (2” letters) ',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Sign Location",
              values: const ['OK', 'Relocate'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Red Warning Light:",
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Red Warning Light Condition",
              values: const ['OK', 'Inoperable'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Light Location",
              values: const ['OK', 'Relocate'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Is Manlift in a Below Grade Pit",
              values: const ['Yes', 'No', 'Non Compliant'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Depth'),
            CustomTextField(title: 'Width'),
            CustomRadioTile(
              title: "Clean",
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Does Manlift Use “UP” Side Platform:',
              values: const ['Yes', 'No', 'Non Compliant'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: '# of Risers:'),
            CustomTextField(title: 'Height'),
            CustomTextField(title: 'Width'),
            CustomTextField(title: 'Depth'),
            CustomRadioTile(
              title: 'Describe Opening:',
              values: const ['Circular', 'Square'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Distance From Floor Opening to Guard Rail “Upside”:',
              values: const ['Compliant', 'Non-Compliant'],
              onChangeValue: (value) {},
            ),
            DistanceTextField(title: 'Back'),
            DistanceTextField(title: 'Left'),
            DistanceTextField(title: 'Right'),
            CustomRadioTile(
              title: 'Does Manlift Use “DOWN” Side Platform:',
              values: const ['Yes', 'No', 'Non Compliant'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: '# of Risers:'),
            CustomTextField(title: 'Height'),
            CustomTextField(title: 'Width'),
            CustomTextField(title: 'Depth'),
            CustomRadioTile(
              title: 'Describe Opening:',
              values: const ['Circular', 'Square'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title:
                  'Is There a Wall in Front of Dismount Platform Within 48” From Face of Belt:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Distance From Floor Opening to Guard Rail “Upside”:',
              values: const ['Compliant', 'Non-Compliant'],
              onChangeValue: (value) {},
            ),
            DistanceTextField(title: 'Back'),
            DistanceTextField(title: 'Left'),
            DistanceTextField(title: 'Right'),
            CustomRadioTile(
              title: 'Ladder Rungs',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Distance Between Rungs',
              values: const ['12”', 'Other'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Ladder Rungs',
              values: const ['Bolted', 'Welded'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Ladder Rungs Condition',
              values: const ['Replace Damaged', 'Replace Worn'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Maze',
              values: const ['Yes', 'No', 'N/A'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Are Gates-Self Closing',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Are Gates Needed',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'How Many',
              values: const ['1', '2', '3'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Open Outward',
              values: const ["Yes", "No"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Toeboard',
              values: const ["Yes", "No"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Add’l Toeboard Required:',
              values: const ["Yes", "No"],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Length'),
            CustomRadioTile(
              title: 'Toeboard Material:',
              values: const ["Steel", "Raised Concrete", "Other"],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Toeboard Height'),
            CustomTitle(
                title:
                    'Distance from Face of Belt to Back Edge of Floor Opening:'),
            CustomTextField(title: '“Upside”:'),
            CustomTextField(title: '“Downside”:'),
            CustomTitle(title: 'Guard Rail Height:'),
            CustomTextField(title: '“Upside”:'),
            CustomTextField(title: '“Downside”:'),
            CustomRadioTile(
              title: 'Guard Rail Material Used:',
              values: const ["Angle", "Square Tubing", "Round Tubing"],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Bottom Landing Notes/Comments:'),
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

class DistanceTextField extends StatelessWidget {
  const DistanceTextField(
      {super.key, required this.title, this.keyboard, this.from, this.to});

  final String title;
  final TextInputType? keyboard;
  final TextEditingController? from;
  final TextEditingController? to;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          TextFormField(
            controller: from,
            maxLines: null,
            keyboardType: keyboard,
          ),
          const Text(
            '” to ?',
            style: TextStyle(fontSize: 16),
          ),
          TextFormField(
            controller: to,
            maxLines: null,
            keyboardType: keyboard,
          ),
        ],
      ),
    );
  }
}
