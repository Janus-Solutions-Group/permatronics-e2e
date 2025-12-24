import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/model/intermediate_landing.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import 'package:manlift_app/feature/common/widgets/multiple_selection_widget.dart';
import 'package:manlift_app/data/models/original_model.dart';
import '../pages/belt_quaterly.dart';

class IntermediateLanding extends StatefulWidget {
  const IntermediateLanding(
      {super.key,
      required this.index,
      required this.model,
      required this.jsonData});

  final int index;
  final IntermediateLandingModel model;
  final Map<String, dynamic> jsonData;

  @override
  State<IntermediateLanding> createState() => _IntermediateLandingState();
}

class _IntermediateLandingState extends State<IntermediateLanding> {
  IntermediateLandingModel? intermediateLanding;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    intermediateLanding = widget.model; // or create a new instance
  }

  @override
  Widget build(BuildContext context) {
    var jsonData = widget.jsonData;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormHeaderTitle(title: "INTERMEDIATE LANDING#"),
            MultipleSelectionWidget(
              original: OriginalModel(
                id: 'intermediate_landing_quartmonth_${widget.index}_1',
                title: '"Authorized Personnel Only" Sign: (2" letters)',
                values: const ['Yes', 'No', 'Non-Compliant'],
              ),
              onSelectionChanged: (val) {
                if (val.isEmpty) return;

                final selected = val.last;

                widget.model.intermediateLandingAuthorizedPersonnelSign =
                    jsonData['intermediate_landing_authorizedpersonnelsign']
                        [selected];
              },
            ),
            MultipleSelectionWidget(
              original: OriginalModel(
                id: 'intermediate_landing_quartmonth_${widget.index}_2',
                title: 'Instruction Sign: (1" letters)',
                values: const ['Yes', 'No', 'Non-Compliant'],
              ),
              onSelectionChanged: (val) {
                if (val.isEmpty) return;

                final selected = val.last;

                widget.model.intermediateLandingInstructionSign =
                    jsonData['intermediate_landing_instructionsign'][selected];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${widget.index}_3',
              title: 'Maze:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.model.intermediateLandingMaze =
                    jsonData['intermediate_landing_maze'][value];
              },
              conditionalBuilder: (selected) {
                if (selected == 'yes') {
                  return CustomTextField(
                    id: 'intermediate_landing_quartmonth_${widget.index}_4',
                    title: 'Description',
                  );
                } else if (selected == 'no') {
                  return Column(
                    children: [
                      CustomRadioTile(
                        id: 'intermediate_landing_quartmonth_${widget.index}_5',
                        title: 'Self Closing Gate:',
                        values: const ['1', '2', '3', '4'],
                        onChangeValue: (value) {
                          widget.model.intermediateLandingInstructionSign =
                              jsonData['intermediate_landing_instructionsign']
                                  [value];
                        },
                      ),
                      CustomRadioTile(
                        id: 'intermediate_landing_quartmonth_${widget.index}_6',
                        title: 'Open Outward:',
                        values: const ['Yes', 'No'],
                        onChangeValue: (value) {
                          widget.model.intermediateLandingOpenOutward =
                              jsonData['intermediate_landing_openoutward']
                                  [value];
                        },
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${widget.index}_7',
              title: 'Toeboard:',
              values: const ['Yes', 'No', "Some"],
              onChangeValue: (value) {
                widget.model.intermediateLandingToeboard =
                    jsonData['intermediate_landing_toeboard'][value];
                setState(() {
                  widget.model.intermediateLandingToeboard = value;
                });
              },
              conditionalBuilder: (selected) {
                if (selected == 'yes') {
                  return CustomRadioTile(
                    id: 'intermediate_landing_quartmonth_${widget.index}_8',
                    title: 'Add\'l Toeboard Required:',
                    values: const ['Yes', 'No'],
                    onChangeValue: (value) {
                      widget.model.intermediateLandingAddlToeboard =
                          jsonData['intermediate_landing_addltoeboardrequired']
                              [value];
                    },
                    conditionalBuilder: (selected) {
                      if (selected == 'yes') {
                        return CustomTextField(
                          id: 'intermediate_landing_quartmonth_${widget.index}_9',
                          title: 'Length',
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${widget.index}_10',
              title: 'Toeboard Material:',
              values: const ['Steel', 'Raised Concrete', 'Other'],
              onChangeValue: (value) {
                // model. =
                //   jsonData['steps_step_rollers_bolts'][value];
              },
              fieldValue: "other",
              fieldLabelTitle: "Other",
              conditionalBuilder: (selected) {
                if (selected == 'other') {
                  return CustomTextField(
                    id: 'intermediate_landing_quartmonth_${widget.index}_10a',
                    title: 'Specify Other',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomTextField(
              id: 'intermediate_landing_quartmonth_${widget.index}_11',
              title: 'Toeboard Height:',
              onChanged: (val) {},
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${widget.index}_12',
              title: 'Type of Hood:',
              values: const ['Stationary', 'Moveable', 'Moveable Mini', 'None'],
              onChangeValue: (value) {
                // model.hood =
                //   jsonData['steps_step_rollers_bolts'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${widget.index}_13',
              title: 'Hood Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                widget.model.intermediateLandingHoodCondition =
                    jsonData['intermediate_landing_hoodcondition'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${widget.index}_14',
              title: 'if Moveable, does Switch work:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                // model.ifmo =
                //   jsonData['steps_step_rollers_bolts'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${widget.index}_15',
              title: 'Does Hood have a Rolled Edge:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.model.intermediateLandingDoesHoodHaveRolledEdge =
                    jsonData['intermediate_landing_doeshoodhaverollededge']
                        [value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${widget.index}_16',
              title: 'Condition of Rolled Edge:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                widget.model.intermediateLandingConditionOfRolledEdge =
                    jsonData['intermediate_landing_conditionofrollededge']
                        [value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${widget.index}_17',
              title: 'Lighting:',
              values: const ['OK', 'Poor,'],
              onChangeValue: (value) {
                widget.model.intermediateLandingLighting =
                    jsonData['intermediate_landing_lighting'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${widget.index}_18',
              title: 'Is Landing Clean/Free of Obstructions:',
              values: const ['Yes', 'No,'],
              onChangeValue: (value) {
                widget.model.intermediateLandingIsLandingClean =
                    jsonData['intermediate_landing_islandingclean'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${widget.index}_19',
              title: 'Lateral Bracing:',
              values: const ['OK', 'Needs Additional'],
              onChangeValue: (value) {
                widget.model.intermediateLandingLateralBracing =
                    jsonData['intermediate_landing_lateralbracing'][value];
              },
              conditionalBuilder: (selected) {
                if (selected == 'needs_additional') {
                  return CustomTextField(
                    id: 'intermediate_landing_quartmonth_${widget.index}_19a',
                    title: 'How Many',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${widget.index}_20',
              title: 'Check Attachment Bolts:',
              values: const [
                'Yes',
                'No',
              ],
              onChangeValue: (value) {
                widget.model.intermediateLandingCheckAttachmentBolts =
                    jsonData['intermediate_landing_checkattachmentbolts']
                        [value];
              },
              conditionalBuilder: (selected) {
                if (selected == 'yes') {
                  return CustomRadioTile(
                    id: 'intermediate_landing_quartmonth_${widget.index}_20a',
                    title: 'Condition:',
                    values: const ['OK', 'Missing'],
                    onChangeValue: (value) {
                      //  beltModel.topLandingInstructionSign =
                      //     jsonData['top_landing_instructionsign'][value];
                    },
                    conditionalBuilder: (selected) {
                      if (selected == 'missing') {
                        return CustomTextField(
                          id: 'intermediate_landing_quartmonth_${widget.index}_20b',
                          title: 'How Many',
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${widget.index}_21',
              title: 'Condition:',
              values: const ['OK', 'Missing'],
              onChangeValue: (value) {
                // model.intermediatecondition =
                //   jsonData['steps_step_rollers_bolts'][value];
              },
              conditionalBuilder: (selected) {
                if (selected == 'missing') {
                  return CustomTextField(
                    id: 'intermediate_landing_quartmonth_${widget.index}_22',
                    title: 'How Many',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomTextField(
              id: 'intermediate_landing_quartmonth_${widget.index}_23',
              title: 'Intermediate Landing Comments:',
              onChanged: (val) {},
            ),
          ],
        ),
      ),
    );
  }
}
