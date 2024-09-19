import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../pages/belt_quaterly.dart';

class BottomLanding extends StatelessWidget {
  const BottomLanding(
      {super.key, required this.pageController, required this.beltModel});
  final PageController pageController;
  final BeltInspection beltModel;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    // Assuming jsonData is available in your context
    var jsonData =
        BeltJson.of(context)!.data; // Replace with your actual JSON data

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormHeaderTitle(title: "BOTTOM LANDING = LANDING#1"),
            CustomRadioTile(
              title: '“Authorized Personnel Only” Sign: (2” letters)',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {
                // Update the beltModel's corresponding field
                beltModel.bottomLandingAuthorizedPersonnelOnlySign =
                    jsonData['bottom_landing_authorized_personnel_only_sign']
                        [value];
              },
            ),
            CustomRadioTile(
              title: 'Instruction Sign: (1” letters)',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {
                beltModel.bottomLandingInstructionSign =
                    jsonData['bottom_landing_instruction_sign'][value];
              },
            ),
            CustomRadioTile(
              title: '“BOTTOM FLOOR – GET OFF” Sign: (2” letters)',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {
                beltModel.bottomLandingBottomFloorGetOffSign =
                    jsonData['bottom_landing_bottom_floor_get_off_sign'][value];
              },
            ),

            // change in the json
            CustomRadioTile(
              title: "Red Warning Light:",
              values: const ['Yes', 'No', 'N/A'],
              onChangeValue: (value) {
                beltModel.bottomLandingRedWarningLight =
                    jsonData['bottom_landing_red_warning_light'][value];
              },
            ),
            CustomRadioTile(
              title: "Condition",
              values: const ['OK', 'Inoperable'],
              onChangeValue: (value) {
                // beltModel.redWarningLightCondition =
                //     jsonData['bottom_landing_red_warning_light'][value];
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
            ),
          ],
        ),
      ),
    );
  }
}
