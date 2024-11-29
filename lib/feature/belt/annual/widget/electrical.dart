import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../../../common/widgets/page_navigation_button.dart';
import '../pages/belt_annual.dart';

class Electrical extends StatelessWidget {
  const Electrical(
      {super.key, required this.pageController, required this.beltModel});

  final PageController pageController;
  final BeltInspection beltModel;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var jsonData = BeltAnnualJson.of(context)!.data;

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
              values: const [
                '4 (Dust Tight)',
                '7 (Explosive Vapors)',
                '9 (Explosive Dust)'
              ],
              onChangeValue: (value) {
                beltModel.electricalNemaType =
                    jsonData['electrical_nematype'][value];
              },
            ),
            CustomRadioTile(
              title: 'Voltage:',
              values: const ['208', '230/240', '460/480'],
              onChangeValue: (value) {
                beltModel.electricalVoltage =
                    jsonData['electrical_voltage'][value];
              },
            ),
            CustomRadioTile(
              title: 'Does Manlift Have A Control Panel:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.electricalHasControlPanel =
                    jsonData['electrical_hascontrolpanel'][value];
              },
            ),
            CustomRadioTile(
              title: 'Location:',
              values: const ['By Manlift', 'In MCC Room'],
              onChangeValue: (value) {
                beltModel.electricalControlPanelLocation =
                    jsonData['electrical_hascontrolpanel']['location'][value];
              },
            ),
            CustomRadioTile(
              title: 'Individual Control Location:',
              values: const ['By Manlift', 'In MCC Room'],
              onChangeValue: (value) {
                beltModel.electricalIndividualControlLocation =
                    jsonData['electrical_individualcontrollocation'][value];
              },
            ),
            CustomRadioTile(
              title: 'Starter:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.electricalHasStarter =
                    jsonData['electrical_hasstarter'][value];
              },
            ),
            CustomRadioTile(
              title: 'Control Relay:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.electricalHasControlRelay =
                    jsonData['electrical_hascontrolrelay'][value];
              },
            ),
            CustomRadioTile(
              title: 'Phase Reversal Relay:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.electricalHasPhaseReversalRelay =
                    jsonData['electrical_hasphasereversalrelay'][value];
              },
            ),
            CustomRadioTile(
              title: '3-Pole Contactor:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.electricalHas3PoleContactor =
                    jsonData['electrical_has3polecontactor'][value];
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
      ),
    );
  }
}
