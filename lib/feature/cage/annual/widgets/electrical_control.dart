import 'package:flutter/material.dart';
import 'package:manlift_app/feature/cage/widgets/section_title.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class AnnualCageElectricalControlForm extends StatelessWidget {
  const AnnualCageElectricalControlForm(
      {super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSectionTitle('Electrical Control Panel'),
          CustomRadioTile(
            title: 'NEMA',
            values: ["4-Dust Tight", "9-Explosive Dust"],
            onChangeValue: (val) {},
          ),
          CustomRadioTile(
            title: 'Voltage',
            values: ["208", "240", "440"],
            onChangeValue: (val) {},
          ),
          CustomRadioTile(
            title: 'Controls',
            values: ["Panel", "Individual Controls", "440"],
            onChangeValue: (val) {},
          ),
          CustomRadioTile(
            title: 'Location',
            values: ["By Manlift", "In MCC Room"],
            onChangeValue: (val) {},
          ),
          CustomRadioTile(
            title: 'Starter',
            values: ["Yes", "No"],
            onChangeValue: (val) {},
          ),
          CustomRadioTile(
            title: 'Control Relay',
            values: ["Yes", "No"],
            onChangeValue: (val) {},
          ),
          CustomRadioTile(
            title: 'Phase Reversal Relay',
            values: ["Yes", "No"],
            onChangeValue: (val) {},
          ),
          CustomRadioTile(
            title: '3-Pole Contactor',
            values: ["Yes", "No"],
            onChangeValue: (val) {},
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
    );
  }
}
