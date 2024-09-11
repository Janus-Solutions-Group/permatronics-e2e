import 'package:flutter/material.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class Belting extends StatelessWidget {
  const Belting({super.key, required this.pageController});

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
            FormHeaderTitle(title: "BELTING"),
            CustomRadioTile(
              title: 'Belting Type',
              values: const ['PVC', 'Cotton', 'Rubber'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Belting Condition',
              values: const ['OK', 'Cuts', 'Frayed Edges', 'Replace Damaged'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Width',
              values: const ['12”', '14”', '16”'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Color',
              values: const ['Black', 'Yellow', '16”'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Splice Type',
              values: const ['Lap', 'Butt'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Splice Length:'),
            CustomTextField(title: 'Number of Bolts:'),
            CustomRadioTile(
              title: 'Missing Bolts',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'How Many:'),
            CustomRadioTile(
              title: 'Splice Bolt Condition:',
              values: const [
                'OK',
                'worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Instructions Stenciled on the Belt:',
              values: const ['OK', 'Non- Compliant', 'Faded'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Directional Arrows Stenciled on the Belt:',
              values: const ['Yes', 'No', 'Faded'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Compressive Flex Failure:',
              values: const ['No', 'Slight', 'Extreme'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Tension of Belt:',
              values: const ['Good', 'Needs to be adjusted'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Belt Condition Commnets:'),
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
