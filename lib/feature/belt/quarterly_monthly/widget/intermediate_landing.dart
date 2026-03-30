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
                      CustomRadioTile(
                        id: 'intermediate_landing_quartmonth_${widget.index}_6a',
                        title: 'Are Gates Missing:',
                        values: const ['Yes', 'No'],
                        onChangeValue: (value) {},
                        conditionalBuilder: (selected) {
                          if (selected == 'yes') {
                            return CustomTextField(
                              id: 'intermediate_landing_quartmonth_${widget.index}_6b',
                              title: 'How Many',
                            );
                          }
                          return const SizedBox.shrink();
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
            MultipleSelectionWidget(
              original: OriginalModel(
                id: 'intermediate_landing_quartmonth_${widget.index}_10',
                title: 'Toeboard Material:',
                values: const ['Steel', 'Raised Concrete', 'Other'],
              ),
              onSelectionChanged: (selected) {},
              conditionalBuilder: (selected) {
                if (selected.contains('other')) {
                  return CustomTextField(
                    id: 'intermediate_landing_quartmonth_${widget.index}_10a',
                    title: 'Specify Other',
                    onChanged: (value) {},
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
              onChangeValue: (value) {},
              conditionalBuilder: (selected) {
                final sel = selected.toLowerCase();

                if (sel == 'none' || sel.isEmpty) {
                  return const SizedBox.shrink();
                }

                List<Widget> widgets = [];

                // ==========================================================
                // ====================== STATIONARY ========================
                // ==========================================================
                if (sel == 'stationary') {
                  widgets.addAll([
                    /// 13 - Hood Condition
                    CustomRadioTile(
                      id: 'intermediate_landing_quartmonth_${widget.index}_13',
                      title: 'Hood Condition',
                      values: const [
                        "OK",
                        "Damaged, but OK",
                        "Replace Damaged",
                        "Replace Worn"
                      ],
                      onChangeValue: (value) {},
                    ),

                    /// 14 - Angle of Slope
                    CustomTextField(
                      id: 'intermediate_landing_quartmonth_${widget.index}_14',
                      title: 'Angle of Slope (Measurement):',
                    ),

                    /// 15 - Hood Clearance
                    CustomRadioTile(
                      id: 'intermediate_landing_quartmonth_${widget.index}_15',
                      title: 'Hood Clearance:',
                      values: const [
                        '(Minimum 7\'6")',
                        'Compliant',
                        'Non-Compliant'
                      ],
                      onChangeValue: (value) {},
                    ),
                  ]);
                }

                // ==========================================================
                // ================= MOVEABLE / MINI ========================
                // ==========================================================
                if (sel == 'moveable' || sel == 'moveable_mini') {
                  widgets.addAll([
                    /// 16 - Hood Condition
                    CustomRadioTile(
                      id: 'intermediate_landing_quartmonth_${widget.index}_16',
                      title: 'Hood Condition',
                      values: const [
                        "OK",
                        "Damaged, but OK",
                        "Replace Damaged",
                        "Replace Worn"
                      ],
                      onChangeValue: (value) {},
                    ),

                    /// 17 - Does Switch Work
                    CustomRadioTile(
                      id: 'intermediate_landing_quartmonth_${widget.index}_17',
                      title: 'Does the Switch Work?',
                      values: const ['Yes', 'No'],
                      onChangeValue: (value) {},
                    ),

                    /// 19 - Location of Hinges
                    CustomRadioTile(
                      id: 'intermediate_landing_quartmonth_${widget.index}_19',
                      title: 'Location of Hinges:',
                      values: const ['6"', 'Other'],
                      onChangeValue: (value) {},
                      conditionalBuilder: (selected) {
                        if (selected.toLowerCase() == 'other') {
                          return CustomTextField(
                            id: 'intermediate_landing_quartmonth_${widget.index}_20',
                            title: 'Measurement in inches:',
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),

                    /// 21 - Does Hood have a Rolled Edge?
                    CustomRadioTile(
                      id: 'intermediate_landing_quartmonth_${widget.index}_21',
                      title: 'Does Hood have a Rolled Edge?',
                      values: const ['Yes', 'No'],
                      onChangeValue: (value) {},
                      conditionalBuilder: (selected) {
                        if (selected.toLowerCase() == 'yes') {
                          return CustomRadioTile(
                            id: 'intermediate_landing_quartmonth_${widget.index}_22',
                            title: 'Condition of Rolled Edge:',
                            values: const [
                              'OK',
                              'Worn, but OK',
                              'Replace Damaged',
                              'Replace Worn'
                            ],
                            onChangeValue: (value) {},
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),

                    /// 18 - Hood Clearance
                    CustomRadioTile(
                      id: 'intermediate_landing_quartmonth_${widget.index}_18',
                      title: 'Hood Clearance:',
                      values: const [
                        '(Minimum 7\'6")',
                        'Compliant',
                        'Non-Compliant'
                      ],
                      onChangeValue: (value) {},
                      conditionalBuilder: (selected) {
                        if (selected.toLowerCase() == 'non-compliant') {
                          return CustomTextField(
                            id: 'intermediate_landing_quartmonth_${widget.index}_18a',
                            title: 'Non-Compliant Reason:',
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ]);
                }

                // ==========================================================
                // ===================== COMMON SECTION =====================
                // ==========================================================

                if (sel == 'stationary') {
                  widgets.add(
                    CustomRadioTile(
                      id: 'intermediate_landing_quartmonth_${widget.index}_21',
                      title: 'Does Hood have a Rolled Edge?',
                      values: const ['Yes', 'No'],
                      onChangeValue: (value) {},
                      conditionalBuilder: (selected) {
                        if (selected.toLowerCase() == 'yes') {
                          return CustomRadioTile(
                            id: 'intermediate_landing_quartmonth_${widget.index}_22',
                            title: 'Condition of Rolled Edge:',
                            values: const [
                              'OK',
                              'Worn, but OK',
                              'Replace Damaged',
                              'Replace Worn'
                            ],
                            onChangeValue: (value) {},
                          );
                        }

                        /// 23 - Bottom Hood Comments
                        return CustomTextField(
                          id: 'intermediate_landing_quartmonth_${widget.index}_23',
                          title: 'Bottom Hood Comments:',
                        );
                      },
                    ),
                  );
                }

                return Column(children: widgets);
              },
            ),

            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${widget.index}_24',
              title: 'Lighting:',
              values: const ['OK', 'Poor,'],
              onChangeValue: (value) {
                widget.model.intermediateLandingLighting =
                    jsonData['intermediate_landing_lighting'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${widget.index}_25',
              title: 'Is Landing Clean/Free of Obstructions:',
              values: const ['Yes', 'No,'],
              onChangeValue: (value) {
                widget.model.intermediateLandingIsLandingClean =
                    jsonData['intermediate_landing_islandingclean'][value];
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${widget.index}_26',
              title: 'Lateral Bracing:',
              values: const ['OK', 'Needs Additional'],
              onChangeValue: (value) {
                widget.model.intermediateLandingLateralBracing =
                    jsonData['intermediate_landing_lateralbracing'][value];
              },
              conditionalBuilder: (selected) {
                if (selected == 'needs_additional') {
                  return CustomTextField(
                    id: 'intermediate_landing_quartmonth_${widget.index}_27',
                    title: 'How Many',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomRadioTile(
              id: 'intermediate_landing_quartmonth_${widget.index}_28',
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
                    id: 'intermediate_landing_quartmonth_${widget.index}_29',
                    title: 'Condition:',
                    values: const ['OK', 'Missing'],
                    onChangeValue: (value) {
                      //  beltModel.topLandingInstructionSign =
                      //     jsonData['top_landing_instructionsign'][value];
                    },
                    conditionalBuilder: (selected) {
                      if (selected == 'missing') {
                        return CustomTextField(
                          id: 'intermediate_landing_quartmonth_${widget.index}_30',
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
              id: 'intermediate_landing_quartmonth_${widget.index}_31',
              title: 'Condition:',
              values: const ['OK', 'Missing'],
              onChangeValue: (value) {
                // model.intermediatecondition =
                //   jsonData['steps_step_rollers_bolts'][value];
              },
              conditionalBuilder: (selected) {
                if (selected == 'missing') {
                  return CustomTextField(
                    id: 'intermediate_landing_quartmonth_${widget.index}_32',
                    title: 'How Many',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomTextField(
              id: 'intermediate_landing_quartmonth_${widget.index}_33',
              title: 'Intermediate Landing Comments:',
              onChanged: (val) {},
            ),

            const SizedBox(height: 8),

            // Row for button aligned to the end
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
