import 'package:flutter/material.dart';
import 'package:manlift_app/feature/cage/annual/pages/cage_annual.dart';
import 'package:manlift_app/feature/cage/model/cage_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class AnnualCageElectricalControlForm extends StatelessWidget {
  const AnnualCageElectricalControlForm(
      {super.key, required this.pageController, required this.cageModel});

  final PageController pageController;
  final CageInspection cageModel;

  @override
  Widget build(BuildContext context) {
    var jsonData = CageAnnualJson.of(context)!.data;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormHeaderTitle(title: 'Electrical Control Panel'),
          CustomRadioTile(
            id: 'electrical_control_1',
            title: 'NEMA',
            values: const ["4-Dust Tight", "9-Explosive Dust"],
            onChangeValue: (val) {
              cageModel.electricalNema =
                  jsonData['electrical_control_panel']['nema'][val];
            },
          ),
          CustomRadioTile(
            id: 'electrical_control_2',
            title: 'Voltage',
            values: const ["208", "240", "440"],
            onChangeValue: (val) {
              cageModel.electricalVoltage =
                  jsonData['electrical_control_panel']['voltage'][val];
            },
          ),
          CustomRadioTile(
            id: 'electrical_control_3',
            title: 'Controls',
            values: const ["Panel", "Individual Controls"],
            onChangeValue: (val) {
              cageModel.electricalControls =
                  jsonData['electrical_control_panel']['controls'][val];
            },
          ),
          CustomRadioTile(
            id: 'electrical_control_4',
            title: 'Location',
            values: const ["By Manlift", "In MCC Room"],
            onChangeValue: (val) {
              cageModel.electricalLocation =
                  jsonData['electrical_control_panel']['location'][val];
            },
          ),
          CustomRadioTile(
            id: 'electrical_control_5',
            title: 'Starter',
            values: const ["Yes", "No"],
            onChangeValue: (val) {
              cageModel.electricalStarter =
                  jsonData['electrical_control_panel']['starter'][val];
            },
          ),
          CustomRadioTile(
            id: 'electrical_control_6',
            title: 'Control Relay',
            values: const ["Yes", "No"],
            onChangeValue: (val) {
              cageModel.electricalControlRelay =
                  jsonData['electrical_control_panel']['control_relay'][val];
            },
          ),
          CustomRadioTile(
            id: 'electrical_control_7',
            title: 'Phase Reversal Relay',
            values: const ["Yes", "No"],
            onChangeValue: (val) {
              cageModel.electricalPhaseReversalRelay =
                  jsonData['electrical_control_panel']['phase_reversal_relay']
                      [val];
            },
          ),
          CustomRadioTile(
            id: 'electrical_control_8',
            title: '3-Pole Contactor',
            values: const ["Yes", "No"],
            onChangeValue: (val) {
              cageModel.electrical3PoleContactor =
                  jsonData['electrical_control_panel']['3_pole_contactor'][val];
            },
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
