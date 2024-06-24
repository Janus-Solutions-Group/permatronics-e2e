import 'package:flutter/material.dart';
import 'package:manlift_app/feature/cage/widgets/section_title.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class BottomLandingHood extends StatelessWidget {
  const BottomLandingHood({super.key, required this.pageController});

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
            buildSectionTitle('BOTTOM LANDING HOOD'),
            CustomRadioTile(
              title: 'Type of Hood',
              values: const [
                "Stationary",
                "Moveable",
                "Moverable Mini",
                'None'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Hood Condition',
              values: const [
                "OK",
                "Damaged, but OK",
                "Replace Damaged",
                'Replace Worn'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'If moveable, does the switch work',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Does Hood have a Rolled Edge',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Bottom Hood Comments:'),
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
