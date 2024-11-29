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
            const FormHeaderTitle(title: "INTERMEDIATE LANDING#"),
            CustomRadioTile(
              id: 'intermediate_landing_1',
              title: '“Authorized Personnel Only” Sign: (2” letters)',
              values: const ['Yes', 'No', 'Non-Compliant'],
              onChangeValue: (value) {
                beltModel.intermediateLandingAuthorizedPersonnelSign =
                    jsonData['intermediate_landing_authorizedpersonnelsign']
                        [value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_2',
              title: 'Instruction Sign: (1” letters)',
              values: const ['Yes', 'No', 'Non-Compliant'],
              onChangeValue: (value) {
                beltModel.intermediateLandingInstructionSign =
                    jsonData['intermediate_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_3',
              title: 'Maze:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.intermediateLandingMaze =
                    jsonData['intermediate_landing_maze'][value];
              },
            ),
            CustomTextField(
              id: 'intermediate_landing_4',
              title: 'Description',
              onChanged: (val) {
                beltModel.stepsStepDescription = val;
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_5',
              title: 'Self Closing Gate:',
              values: const ['1', '2', '3', '4'],
              onChangeValue: (value) {
                // json keys are different--
                // beltModel.intermediateLandingSelfClosingGates =
                //   jsonData['intermediate_landing_selfclosinggates'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_6',
              title: 'Open Outward:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.intermediateLandingOpenOutward =
                    jsonData['intermediate_landing_openoutward'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_7',
              title: 'Toeboard:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.intermediateLandingToeboard =
                    jsonData['intermediate_landing_toeboard'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_8',
              title: 'Add’l Toeboard Required:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.topLandingAddlToeboard =
                    jsonData['intermediate_landing_addltoeboardrequired']
                        [value];
              },
            ),
            CustomTextField(
              id: 'intermediate_landing_9',
              title: 'Length',
              onChanged: (val) {},
            ),
            CustomRadioTile(
              id: 'intermediate_landing_10',
              title: 'Toeboard Material:',
              values: const ['Steel', 'Raised Concrete', 'Other'],
              onChangeValue: (value) {
                // beltModel. =
                //   jsonData['steps_step_rollers_bolts'][value];
              },
            ),
            CustomTextField(
              id: 'intermediate_landing_11',
              title: 'Toeboard Height:',
              onChanged: (val) {},
            ),
            CustomRadioTile(
              id: 'intermediate_landing_12',
              title: 'Type of Hood:',
              values: const ['Stationary', 'Moveable', 'Moveable Mini', 'None'],
              onChangeValue: (value) {
                // beltModel.hood =
                //   jsonData['steps_step_rollers_bolts'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_13',
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
              id: 'intermediate_landing_14',
              title: 'if Moveable, does Switch work:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                // beltModel.ifmo =
                //   jsonData['steps_step_rollers_bolts'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_15',
              title: 'Does Hood have a Rolled Edge:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.intermediateLandingDoesHoodHaveRolledEdge =
                    jsonData['intermediate_landing_doeshoodhaverollededge']
                        [value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_16',
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
              id: 'intermediate_landing_17',
              title: 'Lighting:',
              values: const ['OK', 'Poor,'],
              onChangeValue: (value) {
                beltModel.intermediateLandingLighting =
                    jsonData['intermediate_landing_lighting'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_18',
              title: 'Is Landing Clean/Free of Obstructions:',
              values: const ['Yes', 'No,'],
              onChangeValue: (value) {
                beltModel.intermediateLandingIsLandingClean =
                    jsonData['intermediate_landing_islandingclean'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_19',
              title: 'Lateral Bracing:',
              values: const ['OK', 'Needs Add’l,'],
              onChangeValue: (value) {
                beltModel.intermediateLandingLateralBracing =
                    jsonData['intermediate_landing_lateralbracing'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_20',
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
              id: 'intermediate_landing_21',
              title: 'Condition:',
              values: const ['OK', 'Missing'],
              onChangeValue: (value) {
                // beltModel.intermediatecondition =
                //   jsonData['steps_step_rollers_bolts'][value];
              },
            ),
            CustomTextField(
              id: 'intermediate_landing_22',
              title: 'How Many',
              onChanged: (val) {},
            ),
            CustomTextField(
              id: 'intermediate_landing_23',
              title: 'Intermediate Landing Comments:',
              onChanged: (val) {},
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
