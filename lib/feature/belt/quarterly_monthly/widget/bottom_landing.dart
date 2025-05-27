import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../pages/belt_quaterly.dart';

class BottomLanding extends StatefulWidget {
  const BottomLanding(
      {super.key, required this.pageController, required this.beltModel});
  final PageController pageController;
  final BeltInspection beltModel;

  @override
  State<BottomLanding> createState() => _BottomLandingState();
}

class _BottomLandingState extends State<BottomLanding> {
  final formKey = GlobalKey<FormState>();
  var beltVariable = BeltInspection();

  @override
  Widget build(BuildContext context) {
    var jsonData = BeltJson.of(context)!.data;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormHeaderTitle(title: "BOTTOM LANDING = LANDING#1"),
            CustomRadioTile(
              id: 'bottom_landing_1',
              title: '"Authorized Personnel Only" Sign: (2" letters)',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {
                // Update the beltModel's corresponding field
                widget.beltModel.bottomLandingAuthorizedPersonnelOnlySign =
                    jsonData['bottom_landing_authorized_personnel_only_sign']
                        [value];
              },
            ),
            CustomRadioTile(
              id: 'bottom_landing_2',
              title: 'Instruction Sign: (1" letters)',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {
                widget.beltModel.bottomLandingInstructionSign =
                    jsonData['bottom_landing_instruction_sign'][value];
              },
            ),
            CustomRadioTile(
              id: 'bottom_landing_3',
              title: 'BOTTOM FLOOR - GET OFF" Sign: (2" letters)',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {
                widget.beltModel.bottomLandingBottomFloorGetOffSign =
                    jsonData['bottom_landing_bottom_floor_get_off_sign'][value];
              },
            ),

            // change in the json
            CustomRadioTile(
              id: 'bottom_landing_4',
              title: "Red Warning Light:",
              values: const ['Yes', 'No', 'N/A'],
              onChangeValue: (value) {
                setState(() {
                  beltVariable.bottomLandingRedWarningLight = value;
                });
                widget.beltModel.bottomLandingRedWarningLight =
                    jsonData['bottom_landing_red_warning_light'][value];
              },
            ),
            if (beltVariable.bottomLandingRedWarningLight == "yes")
              CustomRadioTile(
                id: 'bottom_landing_5',
                title: "Condition",
                values: const ['OK', 'Inoperable'],
                onChangeValue: (value) {
                  // beltModel.redWarningLightCondition =
                  //     jsonData['bottom_landing_red_warning_light'][value];
                },
              ),
            CustomTextField(
              id: "bottom_landing_annual_6",
              title: 'Bottom Landing Comments:',
              onChanged: (value) {
                widget.beltModel.bottomLandingBottomLandingNotesComments =
                    value;
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
            ),
          ],
        ),
      ),
    );
  }
}
