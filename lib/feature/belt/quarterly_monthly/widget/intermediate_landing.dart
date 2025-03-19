import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/model/intermediate_landing.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../pages/belt_quaterly.dart';

class IntermediateLanding extends StatelessWidget {
  const IntermediateLanding(
      {super.key, required this.index, required this.model});

  final int index;
  final IntermediateLandingModel model;

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
              id: 'intermediate_landing_quartmonth_${index}_1',
              title: '“Authorized Personnel Only” Sign: (2” letters)',
              values: const ['Yes', 'No', 'Non-Compliant'],
              onChangeValue: (value) {
                model.intermediateLandingAuthorizedPersonnelSign =
                    jsonData['intermediate_landing_authorizedpersonnelsign']
                        [value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${index}_2',
              title: 'Instruction Sign: (1” letters)',
              values: const ['Yes', 'No', 'Non-Compliant'],
              onChangeValue: (value) {
                model.intermediateLandingInstructionSign =
                    jsonData['intermediate_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${index}_3',
              title: 'Maze:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                model.intermediateLandingMaze =
                    jsonData['intermediate_landing_maze'][value];
              },
            ),
            CustomTextField(
              id: 'intermediate_landing_quartmonth_${index}_4',
              title: 'Description',
              onChanged: (val) {
                // model.stepsStepDescription = val;
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${index}_5',
              title: 'Self Closing Gate:',
              values: const ['1', '2', '3', '4'],
              onChangeValue: (value) {
                // json keys are different--
                // model.intermediateLandingSelfClosingGates =
                //   jsonData['intermediate_landing_selfclosinggates'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${index}_6',
              title: 'Open Outward:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                model.intermediateLandingOpenOutward =
                    jsonData['intermediate_landing_openoutward'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${index}_7',
              title: 'Toeboard:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                model.intermediateLandingToeboard =
                    jsonData['intermediate_landing_toeboard'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${index}_8',
              title: 'Add’l Toeboard Required:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                model.intermediateLandingAddlToeboard =
                    jsonData['intermediate_landing_addltoeboardrequired']
                        [value];
              },
            ),
            CustomTextField(
              id: 'intermediate_landing_quartmonth_${index}_9',
              title: 'Length',
              onChanged: (val) {},
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${index}_10',
              title: 'Toeboard Material:',
              values: const ['Steel', 'Raised Concrete', 'Other'],
              onChangeValue: (value) {
                // model. =
                //   jsonData['steps_step_rollers_bolts'][value];
              },
            ),
            CustomTextField(
              id: 'intermediate_landing_quartmonth_${index}_11',
              title: 'Toeboard Height:',
              onChanged: (val) {},
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${index}_12',
              title: 'Type of Hood:',
              values: const ['Stationary', 'Moveable', 'Moveable Mini', 'None'],
              onChangeValue: (value) {
                // model.hood =
                //   jsonData['steps_step_rollers_bolts'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${index}_13',
              title: 'Hood Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                model.intermediateLandingHoodCondition =
                    jsonData['intermediate_landing_hoodcondition'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${index}_14',
              title: 'if Moveable, does Switch work:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                // model.ifmo =
                //   jsonData['steps_step_rollers_bolts'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${index}_15',
              title: 'Does Hood have a Rolled Edge:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                model.intermediateLandingDoesHoodHaveRolledEdge =
                    jsonData['intermediate_landing_doeshoodhaverollededge']
                        [value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${index}_16',
              title: 'Condition of Rolled Edge:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                model.intermediateLandingConditionOfRolledEdge =
                    jsonData['intermediate_landing_conditionofrollededge']
                        [value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${index}_17',
              title: 'Lighting:',
              values: const ['OK', 'Poor,'],
              onChangeValue: (value) {
                model.intermediateLandingLighting =
                    jsonData['intermediate_landing_lighting'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${index}_18',
              title: 'Is Landing Clean/Free of Obstructions:',
              values: const ['Yes', 'No,'],
              onChangeValue: (value) {
                model.intermediateLandingIsLandingClean =
                    jsonData['intermediate_landing_islandingclean'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${index}_19',
              title: 'Lateral Bracing:',
              values: const ['OK', 'Needs Add’l,'],
              onChangeValue: (value) {
                model.intermediateLandingLateralBracing =
                    jsonData['intermediate_landing_lateralbracing'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${index}_20',
              title: 'Check Attachment Bolts:',
              values: const [
                'Yes',
                'No',
              ],
              onChangeValue: (value) {
                model.intermediateLandingCheckAttachmentBolts =
                    jsonData['intermediate_landing_checkattachmentbolts']
                        [value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${index}_21',
              title: 'Condition:',
              values: const ['OK', 'Missing'],
              onChangeValue: (value) {
                // model.intermediatecondition =
                //   jsonData['steps_step_rollers_bolts'][value];
              },
            ),
            CustomTextField(
              id: 'intermediate_landing_quartmonth_${index}_22',
              title: 'How Many',
              onChanged: (val) {},
            ),
            CustomTextField(
              id: 'intermediate_landing_quartmonth_${index}_23',
              title: 'Intermediate Landing Comments:',
              onChanged: (val) {},
            ),
          ],
        ),
      ),
    );
  }
}
