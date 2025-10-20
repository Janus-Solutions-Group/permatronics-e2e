import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../../../common/widgets/page_navigation_button.dart';
import '../pages/belt_annual.dart';

class Electrical extends StatefulWidget {
  const Electrical(
      {super.key, required this.pageController, required this.beltModel});

  final PageController pageController;
  final BeltInspection beltModel;

  @override
  State<Electrical> createState() => _ElectricalState();
}

class _ElectricalState extends State<Electrical> {
  var beltVariable = BeltInspection();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
              id: "electrical_annual_1",
              title: 'NEMA:',
              values: const [
                '4 (Dust Tight)',
                '7 (Explosive Vapors)',
                '9 (Explosive Dust)'
              ],
              onChangeValue: (value) {
                widget.beltModel.electricalNemaType =
                    jsonData['electrical_nematype'][value];
              },
            ),
            CustomRadioTile(
              id: "electrical_annual_2",
              title: 'Voltage:',
              values: const ['208', '230/240', '460/480'],
              onChangeValue: (value) {
                widget.beltModel.electricalVoltage =
                    jsonData['electrical_voltage'][value];
              },
            ),
            CustomRadioTile(
              id: "electrical_annual_3",
              title: 'Does Manlift Have A Control Panel:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                setState(() {
                  beltVariable.electricalHasControlPanel = value;
                });
                widget.beltModel.electricalHasControlPanel =
                    jsonData['electrical_hascontrolpanel'][value];
              },
            ),
            if (beltVariable.electricalHasControlPanel == "yes")
              CustomRadioTile(
                id: "electrical_annual_5",
                title: 'Location:',
                values: const ['By Manlift', 'In MCC Room'],
                onChangeValue: (value) {
                  widget.beltModel.electricalControlPanelLocation =
                      jsonData['electrical_hascontrolpanel']['location'][value];
                },
              ),
            CustomRadioTile(
              id: "electrical_annual_6",
              title: 'Individual Control Location:',
              values: const ['By Manlift', 'In MCC Room'],
              onChangeValue: (value) {
                widget.beltModel.electricalIndividualControlLocation =
                    jsonData['electrical_individualcontrollocation'][value];
              },
            ),
            CustomRadioTile(
              id: "electrical_annual_8",
              title: 'Starter:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.electricalHasStarter =
                    jsonData['electrical_hasstarter'][value];
              },
            ),
            CustomRadioTile(
              id: "electrical_annual_9",
              title: 'Control Relay:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.electricalHasControlRelay =
                    jsonData['electrical_hascontrolrelay'][value];
              },
            ),
            CustomRadioTile(
              id: "electrical_annual_10",
              title: 'Phase Reversal Relay:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.electricalHasPhaseReversalRelay =
                    jsonData['electrical_hasphasereversalrelay'][value];
              },
            ),
            CustomRadioTile(
              id: "electrical_annual_11",
              title: '3-Pole Contactor:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.electricalHas3PoleContactor =
                    jsonData['electrical_has3polecontactor'][value];
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PageNavigationButton(
                  pageController: widget.pageController,
                  right: false,
                ),
                PageNavigationButton(
                  pageController: widget.pageController,
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
