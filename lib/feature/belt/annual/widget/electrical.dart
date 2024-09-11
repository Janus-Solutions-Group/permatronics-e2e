import 'package:flutter/material.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../../../common/widgets/page_navigation_button.dart';

class Electrical extends StatelessWidget {
  const Electrical({super.key, required this.pageController});

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
            FormHeaderTitle(title: "Electrical".toUpperCase()),
            CustomRadioTile(
              title: 'NEMA:',
              values: [
                '4 (Dust Tight)',
                '7 (Explosive Vapors)',
                '9 (Explosive Dust)'
              ],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Voltage:',
              values: ['208', '230/240', '460/480'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Does Manlift Have A Control Panel:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Location:',
              values: ['By Manlift', 'In MCC Room'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Individual Control Location:',
              values: ['By Manlift', 'In MCC Room'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Starter:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Control Relay:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Phase Reversal Relay:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: '3-Pole Contactor:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
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
