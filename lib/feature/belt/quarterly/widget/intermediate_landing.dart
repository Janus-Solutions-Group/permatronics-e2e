import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../pages/belt_quaterly.dart';

class IntermediateLanding extends StatelessWidget {
  const IntermediateLanding(
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
            FormHeaderTitle(title: "INTERMEDIATE LANDING#"),
            CustomRadioTile(
              title: '“Authorized Personnel Only” Sign: (2” letters)',
              values: const ['Yes', 'No', 'Non-Compliant'],
              onChangeValue: (value) {
                beltModel.intermediateLandingAuthorizedPersonnelSign =
                    jsonData['intermediate_landing_authorizedpersonnelsign']
                        [value];
              },
            ),
            CustomRadioTile(
              title: 'Instruction Sign: (1” letters)',
              values: const ['Yes', 'No', 'Non-Compliant'],
              onChangeValue: (value) {
                beltModel.intermediateLandingInstructionSign =
                    jsonData['intermediate_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: 'Maze:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.intermediateLandingMaze =
                    jsonData['intermediate_landing_maze'][value];
              },
            ),
            CustomTextField(title: 'Description'),
            CustomRadioTile(
              title: 'Self Closing Gate:',
              values: const ['1', '2', '3', '4'],
              onChangeValue: (value) {
                // json keys are different--
                // beltModel.intermediateLandingSelfClosingGates =
                //   jsonData['intermediate_landing_selfclosinggates'][value];
              },
            ),
            CustomRadioTile(
              title: 'Open Outward:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.intermediateLandingOpenOutward =
                    jsonData['intermediate_landing_openoutward'][value];
              },
            ),
            CustomRadioTile(
              title: 'Toeboard:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.intermediateLandingToeboard =
                    jsonData['intermediate_landing_toeboard'][value];
              },
            ),
            CustomRadioTile(
              title: 'Add’l Toeboard Required:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.topLandingAddlToeboard =
                    jsonData['intermediate_landing_addltoeboardrequired']
                        [value];
              },
            ),
            CustomTextField(title: 'Length'),
            CustomRadioTile(
              title: 'Toeboard Material:',
              values: const ['Steel', 'Raised Concrete', 'Other'],
              onChangeValue: (value) {
                // beltModel. =
                //   jsonData['steps_step_rollers_bolts'][value];
              },
            ),
            CustomTextField(title: 'Toeboard Height:'),
            CustomRadioTile(
              title: 'Type of Hood:',
              values: const ['Stationary', 'Moveable', 'Moveable Mini', 'None'],
              onChangeValue: (value) {
                // beltModel.hood =
                //   jsonData['steps_step_rollers_bolts'][value];
              },
            ),
            CustomRadioTile(
              title: 'Hood Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.intermediateLandingHoodCondition =
                    jsonData['intermediate_landing_hoodcondition'][value];
              },
            ),
            CustomRadioTile(
              title: 'if Moveable, does Switch work:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                // beltModel.ifmo =
                //   jsonData['steps_step_rollers_bolts'][value];
              },
            ),
            CustomRadioTile(
              title: 'Does Hood have a Rolled Edge:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.intermediateLandingDoesHoodHaveRolledEdge =
                    jsonData['intermediate_landing_doeshoodhaverollededge']
                        [value];
              },
            ),
            CustomRadioTile(
              title: 'Condition of Rolled Edge:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.intermediateLandingConditionOfRolledEdge =
                    jsonData['intermediate_landing_conditionofrollededge']
                        [value];
              },
            ),
            CustomRadioTile(
              title: 'Lighting:',
              values: const ['OK', 'Poor,'],
              onChangeValue: (value) {
                beltModel.intermediateLandingLighting =
                    jsonData['intermediate_landing_lighting'][value];
              },
            ),
            CustomRadioTile(
              title: 'Is Landing Clean/Free of Obstructions:',
              values: const ['Yes', 'No,'],
              onChangeValue: (value) {
                beltModel.intermediateLandingIsLandingClean =
                    jsonData['intermediate_landing_islandingclean'][value];
              },
            ),
            CustomRadioTile(
              title: 'Lateral Bracing:',
              values: const ['OK', 'Needs Add’l,'],
              onChangeValue: (value) {
                beltModel.intermediateLandingLateralBracing =
                    jsonData['intermediate_landing_lateralbracing'][value];
              },
            ),
            CustomRadioTile(
              title: 'Check Attachment Bolts:',
              values: const [
                'Yes',
                'No',
              ],
              onChangeValue: (value) {
                beltModel.intermediateLandingCheckAttachmentBolts =
                    jsonData['intermediate_landing_checkattachmentbolts']
                        [value];
              },
            ),
            CustomRadioTile(
              title: 'Condition:',
              values: const ['OK', 'Missing'],
              onChangeValue: (value) {
                // beltModel.intermediatecondition =
                //   jsonData['steps_step_rollers_bolts'][value];
              },
            ),
            CustomTextField(title: 'How Many'),
            CustomTextField(title: 'Intermediate Landing Comments:'),
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
