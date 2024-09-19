import 'package:flutter/material.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../../../common/widgets/page_navigation_button.dart';
import '../../model/belt_inspection_model.dart';
import '../pages/belt_quaterly.dart';

class TopLanding extends StatelessWidget {
  const TopLanding(
      {super.key, required this.pageController, required this.beltModel});

  final PageController pageController;
  final BeltInspection beltModel;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var jsonData = BeltJson.of(context)!.data;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHeaderTitle(title: "TOP LANDING#"),
            CustomRadioTile(
              title: '“Authorized Personnel Only” Sign: (2” letters)',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {
                beltModel.topLandingAuthorizedPersonnelSign =
                    jsonData['top_landing_authorizedpersonnelsign'][value];
              },
            ),
            CustomRadioTile(
              title: 'Instruction Sign: (1” letters)',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {
                beltModel.topLandingInstructionSign =
                    jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: '“TOP FLOOR – GET OFF” Sign: (2” letters)',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {
                //  beltModel. =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: 'Location',
              values: const ["Below Landing", "Above Landing"],
              onChangeValue: (value) {
                //  beltModel.toplandingloca =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: "Red Warning Light:",
              values: const ['Yes', 'No', 'Inoperable'],
              onChangeValue: (value) {
                //  beltModel.topLandingInstructionSign =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: "Location",
              values: const ["Below Landing", "Above Landing"],
              onChangeValue: (value) {
                //  beltModel.toplandin =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: 'Maze:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                //  beltModel.topLandingMaze =
                //     jsonData['top_landing_maze'][value];
              },
            ),
            CustomTextField(title: 'Description'),
            CustomRadioTile(
              title: 'Self Closing Gate:',
              values: const ['1', '2', '3', '4'],
              onChangeValue: (value) {
                //  beltModel.topLandingInstructionSign =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: 'Open Outward:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.topLandingOpenOutward =
                    jsonData['top_landing_openoutward'][value];
              },
            ),
            CustomRadioTile(
              title: 'Toeboard:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.topLandingToeboard =
                    jsonData['top_landing_toeboard'][value];
              },
            ),
            CustomRadioTile(
              title: 'Add’l Toeboard Required:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.topLandingAddlToeboard =
                    jsonData['top_landing_addltoeboardrequired'][value];
              },
            ),
            CustomTextField(title: 'Length'),
            CustomRadioTile(
              title: 'Toeboard Material:',
              values: const ['Steel', 'Raised Concrete', 'Other'],
              onChangeValue: (value) {
                //  beltModel. =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomTextField(title: 'Toeboard Height:'),
            CustomTextField(title: 'Control Rope Diameter'),
            CustomRadioTile(
              title: 'Type:',
              values: const ['Wire Center Cable', 'Non-Compliant'],
              onChangeValue: (value) {
                //  beltModel.toplandingrope =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: 'Control Rope Condition:',
              values: const ['OK', 'Replace Damaged', 'Replace Worn'],
              onChangeValue: (value) {
                beltModel.topLandingConditionOfRopeGuides =
                    jsonData['top_landing_conditionofropeguides'][value];
              },
            ),
            CustomTextField(title: 'Control Rope Fasteners'),
            CustomRadioTile(
              title: 'Pinch Clips:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                //  beltModel.toplandin =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: 'U-Bolts:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                //  beltModel. =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: 'Tape:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                //  beltModel.topLandingDistanceFromFloorOpeningToGuardRailDownSideBack =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: 'Tied:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                //  beltModel.tied =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: 'Guide Rail Type:',
              values: const ['Channel', 'Angle'],
              onChangeValue: (value) {
                //  beltModel.g =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: 'Guide Rail Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                "Bowed",
                "Grooved",
                "Replace Damaged",
                "Replace Worn"
              ],
              onChangeValue: (value) {
                //  beltModel.topLandingInstructionSign =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: 'Lighting:',
              values: const ['OK', 'Poor,'],
              onChangeValue: (value) {
                beltModel.topLandingLighting =
                    jsonData['top_landing_lighting'][value];
              },
            ),
            CustomRadioTile(
              title: 'Is Landing Clean/Free of Obstructions:',
              values: const ['Yes', 'No,'],
              onChangeValue: (value) {
                beltModel.topLandingIsLandingClean =
                    jsonData['top_landing_islandingclean'][value];
              },
            ),
            CustomRadioTile(
              title: 'Lateral Bracing:',
              values: const ['OK', 'Needs Add’l,'],
              onChangeValue: (value) {
                beltModel.topLandingLateralBracing =
                    jsonData['top_landing_lateralbracing'][value];
              },
            ),
            CustomRadioTile(
              title: 'Check Attachment Bolts:',
              values: const [
                'Yes',
                'No',
              ],
              onChangeValue: (value) {
                beltModel.topLandingCheckAttachmentBolts =
                    jsonData['top_landing_checkattachmentbolts'][value];
              },
            ),
            CustomRadioTile(
              title: 'Condition:',
              values: const ['OK', 'Missing'],
              onChangeValue: (value) {
                //  beltModel.topLandingInstructionSign =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomTextField(title: 'How Many'),
            CustomTextField(title: 'Top Landing Comments:'),
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
