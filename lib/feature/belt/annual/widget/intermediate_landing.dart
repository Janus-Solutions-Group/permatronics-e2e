import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/annual/widget/bottom_landing.dart';
// import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/belt/model/intermediate_landing.dart';
import 'package:manlift_app/feature/common/widgets/custom_title.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
// import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import 'package:manlift_app/feature/common/widgets/multiple_selection_widget.dart';
import 'package:manlift_app/data/models/original_model.dart';
import '../pages/belt_annual.dart';

class IntermediateLanding extends StatefulWidget {
  const IntermediateLanding(
      {super.key,
      required this.model,
      // required this.selectedValues,
      required this.index,
      required this.jsonData});
  final int index;
  final IntermediateLandingModel model;
  // final IntermediateLandingModel selectedValues;
  final Map<String, dynamic> jsonData;

  @override
  State<IntermediateLanding> createState() => _IntermediateLandingState();
}

class _IntermediateLandingState extends State<IntermediateLanding> {
  final formKey = GlobalKey<FormState>();
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
                id: 'landing_${widget.index}_belt_annual_1',
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
                id: 'landing_${widget.index}_belt_annual_2',
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
              id: 'landing_${widget.index}_belt_annual_3',
              title: 'Floor Opening Shape',
              values: const ['Circular', 'Square'],
              onChangeValue: (value) {
                widget.model.intermediateLandingFloorOpeningShape =
                    jsonData['intermediate_landing_flooropeningshape'][value];
              },
            ),
            CustomTextField(
                id: 'landing_${widget.index}_belt_annual_4',
                title: 'Thickness:'),
            CustomRadioTile(
              id: 'landing_${widget.index}_belt_annual_4a',
              title: 'Material:',
              values: const ['Concrete', 'Steel'],
              onChangeValue: (value) {
                // beltModel.intermediate = value;
              },
            ),
            CustomTextField(
                id: 'landing_${widget.index}_belt_annual_5',
                title: 'Diameter "Upside"'),
            CustomTextField(
                id: 'landing_${widget.index}_belt_annual_6',
                title: 'Diameter "Downside"'),
            CustomTextField(
                id: 'landing_${widget.index}_belt_annual_6a',
                title:
                    'Distance from Face of Belt to Back Edge of Floor Opening:'),
            CustomTextField(
                id: 'landing_${widget.index}_belt_annual_7',
                title: '"Upside":'),
            CustomTextField(
                id: 'landing_${widget.index}_belt_annual_8',
                title: '"Downside":'),
            CustomRadioTile(
              id: 'landing_${widget.index}_belt_annual_9',
              title: 'Distance from Floor Opening to Guard Rail "Upside":',
              values: const ['Compliant', 'Non-Compliant'],
              onChangeValue: (value) {
                // beltModel
                //         .intermediateLandingDistanceFromFloorOpeningToGuardRailUpSideRight =
                //     value;
              },
            ),
            DistanceTextField(
                title: 'Back', id: 'landing_${widget.index}_belt_annual_9a'),
            DistanceTextField(
                title: 'Left', id: 'landing_${widget.index}_belt_annual_9b'),
            DistanceTextField(
                title: 'Right', id: 'landing_${widget.index}_belt_annual_9c'),
            CustomRadioTile(
              id: 'landing_${widget.index}_belt_annual_10',
              title: 'Distance from Floor Opening to Guard Rail "Downside":',
              values: const ['Compliant', 'Non-Compliant'],
              onChangeValue: (value) {
                // beltModel.distanceFromOpeningDownside = value;
                // beltModel
                //         .distance =
                //     value;
              },
            ),
            DistanceTextField(
              title: 'Back',
              id: 'landing_${widget.index}_belt_annual_11a',
              onChangeValue: (value) {},
            ),
            DistanceTextField(
              title: 'Left',
              id: 'landing_${widget.index}_belt_annual_11b',
              onChangeValue: (value) {},
            ),
            DistanceTextField(
              title: 'Right',
              id: 'landing_${widget.index}_belt_annual_11c',
              onChangeValue: (value) {},
            ),
            CustomTextField(
                id: 'landing_${widget.index}_belt_annual_11d',
                title: 'Guard Rail Height:'),
            CustomTextField(
                id: 'landing_${widget.index}_belt_annual_12a',
                title: '"Upside":'),
            CustomTextField(
                id: 'landing_${widget.index}_belt_annual_12b',
                title: '"Downside":'),
            CustomRadioTile(
              id: 'landing_${widget.index}_belt_annual_13',
              title: 'Guard Rail Material Used:',
              values: const ['Angle', 'Square Tubing', 'Round Tubing', 'Wood'],
              onChangeValue: (value) {
                // beltModel.guard = value;
              },
            ),
            CustomRadioTile(
              id: 'landing_${widget.index}_belt_annual_14',
              title: 'Maze:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                //  beltModel.topLandingMaze =
                //     jsonData['bottom_landing_maze'][value];
              },
              conditionalBuilder: (selected) {
                if (selected == 'yes') {
                  return CustomTextField(
                    id: 'landing_${widget.index}_belt_annual_15',
                    title: 'Description',
                  );
                } else if (selected == 'no') {
                  return Column(
                    children: [
                      CustomRadioTile(
                        id: 'landing_${widget.index}_belt_annual_16',
                        title: 'Self Closing Gate:',
                        values: const ['1', '2', '3', '4'],
                        onChangeValue: (value) {
                          // widget.beltModel.topLandingInstructionSign =
                          //     jsonData['top_landing_instructionsign'][value];
                        },
                      ),
                      CustomRadioTile(
                        id: 'landing_${widget.index}_belt_annual_17',
                        title: 'Open Outward:',
                        values: const ['Yes', 'No'],
                        onChangeValue: (value) {
                          // widget.beltModel.topLandingOpenOutward =
                          //     jsonData['top_landing_openoutward'][value];
                        },
                      ),
                      CustomRadioTile(
                        id: 'landing_${widget.index}_belt_annual_18',
                        title: 'Are Gates Missing:',
                        values: const ['Yes', 'No'],
                        onChangeValue: (value) {},
                        conditionalBuilder: (selected) {
                          if (selected == 'yes') {
                            return CustomTextField(
                              id: 'landing_${widget.index}_belt_annual_19',
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
              id: 'landing_${widget.index}_belt_annual_20',
              title: 'Toeboard:',
              values: const ['Yes', 'No', "Some"],
              onChangeValue: (value) {
                widget.model.intermediateLandingToeboard =
                    jsonData['intermediate_landing_toeboard'][value];
              },
              conditionalBuilder: (selected) {
                if (selected == 'yes') {
                  return CustomRadioTile(
                    id: 'landing_${widget.index}_belt_annual_21',
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
                          id: 'landing_${widget.index}_belt_annual_22',
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
                id: 'landing_${widget.index}_belt_annual_23a',
                title: 'Toeboard Material:',
                values: const ['Steel', 'Raised Concrete', 'Other'],
              ),
              onSelectionChanged: (val) {
                if (val.isEmpty) return;
                // beltModel.toeboard = val.last;
              },
              conditionalBuilder: (selected) {
                if (selected.contains('other')) {
                  return CustomTextField(
                    id: 'landing_${widget.index}_belt_annual_23b',
                    title: 'Specify Other',
                  );
                }
                return const SizedBox.shrink();
              },
            ),

            CustomTextField(
                id: 'landing_${widget.index}_belt_annual_23c',
                title: 'Toeboard Height:'),
            CustomRadioTile(
              id: 'landing_${widget.index}_belt_annual_24',
              title: 'Type of Hood:',
              values: const ['Stationary', 'Moveable', 'Moveable Mini', 'None'],
              onChangeValue: (value) {
                // beltModel. = value;
              },
              conditionalBuilder: (selected) {
                final sel = selected.toLowerCase();

                // If NONE → return nothing
                if (sel == "none" || sel.isEmpty) {
                  return const SizedBox.shrink();
                }

                // Prepare list to fill
                List<Widget> widgets = [];

                // ----------------------------------------
                // CASE 1: STATIONARY
                // ----------------------------------------
                if (sel == "stationary") {
                  widgets.addAll([
                    CustomTextField(
                      id: 'landing_${widget.index}_belt_annual_25a',
                      title: 'Distance from Face of Belt:',
                    ),
                    CustomTextField(
                      id: 'landing_${widget.index}_belt_annual_25b',
                      title: 'Angle of Slope:',
                    ),
                    CustomRadioTile(
                      id: 'landing_${widget.index}_belt_annual_25c',
                      title: 'Shape',
                      values: const ['Circular', 'Square'],
                      onChangeValue: (value) {},
                    ),
                  ]);
                }

                // ----------------------------------------
                // CASE 2: MOVEABLE
                // ----------------------------------------
                else if (["moveable", 'moveable_mini'].contains(sel)) {
                  widgets.addAll([
                    CustomRadioTile(
                      id: 'landing_${widget.index}_belt_annual_25d',
                      title: 'What Type of Switch:',
                      values: const ['Mercury', 'Micro-Switch'],
                      onChangeValue: (value) {},
                    ),
                    CustomRadioTile(
                      id: 'landing_${widget.index}_belt_annual_25e',
                      title: 'Does the Switch Work',
                      values: const ['Yes', 'No'],
                      onChangeValue: (value) {},
                    ),
                    CustomRadioTile(
                      id: 'landing_${widget.index}_belt_annual_25f',
                      title: 'Location of Hinges',
                      values: const [
                        '6"',
                        'More than 6" with obstruction',
                        'Other'
                      ],
                      onChangeValue: (value) {},
                      fieldValue: "other",
                      fieldLabelTitle: "Measurement in inches",
                    ),
                  ]);
                }

                widgets.addAll([
                  CustomRadioTile(
                    id: 'landing_${widget.index}_belt_annual_25h',
                    title: 'Hood Condition',
                    values: const [
                      "OK",
                      "Damaged, but OK",
                      "Replace Damaged",
                      'Replace Worn'
                    ],
                    onChangeValue: (value) {},
                  ),
                  CustomRadioTile(
                    id: 'landing_${widget.index}_belt_annual_25i',
                    title: 'Hood Clearance:',
                    values: const [
                      '(Minimum 7\'6")',
                      'Compliant',
                      'Non-Compliant'
                    ],
                    onChangeValue: (value) {},
                  ),
                  CustomRadioTile(
                    id: 'landing_${widget.index}_belt_annual_25j',
                    title: 'Does Hood have a Rolled Edge',
                    values: const ['Yes', 'No'],
                    onChangeValue: (value) {},
                    conditionalBuilder: (selected) {
                      if (selected == 'yes') {
                        return CustomRadioTile(
                          id: 'landing_${widget.index}_belt_annual_25k',
                          title: 'Condition of Rolled Edge:',
                          values: const [
                            'OK',
                            'Damaged, but OK',
                            'Replace Damaged',
                            'Replace Worn'
                          ],
                          onChangeValue: (value) {},
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  CustomTextField(
                    id: 'landing_${widget.index}_belt_annual_25l',
                    title: 'Hood Comments:',
                    onChanged: (value) {},
                  ),
                ]);

                return Column(children: widgets);
              },
            ),
            CustomRadioTile(
              id: 'landing_${widget.index}_belt_annual_35',
              title: 'Ladder Rungs:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.model.intermediateLandingLadderRungs =
                    jsonData['intermediate_landing_ladderrungs'][value];
              },
            ),
            CustomRadioTile(
              id: 'landing_${widget.index}_belt_annual_36',
              title: 'Rung Attachment:',
              values: const ['Bolted', 'Welded'],
              onChangeValue: (value) {
                // beltModel.rung = value;
              },
            ),
            CustomRadioTile(
              id: 'landing_${widget.index}_belt_annual_37',
              title: 'Condition:',
              values: const ['OK', 'Replace Damaged'],
              onChangeValue: (value) {
                // beltModel.run = value;
              },
            ),
            CustomTextField(
                id: 'landing_${widget.index}_belt_annual_38',
                title: 'How Many'),

            CustomRadioTile(
              id: 'landing_${widget.index}_belt_annual_38a',
              title: 'Need Additional Ladder Rungs:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
              conditionalBuilder: (selected) {
                if (selected == 'yes') {
                  return CustomTextField(
                    id: 'landing_${widget.index}_belt_annual_38b',
                    title: 'How Many',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomRadioTile(
              id: 'landing_${widget.index}_belt_annual_39',
              title: 'Distance Between Rungs:',
              values: const ['12"', 'Other'],
              onChangeValue: (value) {
                // beltModel.distanceb = value;
              },
              conditionalBuilder: (selected) {
                if (selected == 'other') {
                  return CustomTextField(
                    id: 'landing_${widget.index}_belt_annual_39a',
                    title: 'Specify Other',
                  );
                }
                return const SizedBox.shrink();
              },
              isTextField: true,
              fieldLabelTitle: 'Other',
            ),
            CustomRadioTile(
              id: 'landing_${widget.index}_belt_annual_40',
              title: 'Facing "Up" Travel Side, Are the Ladder Rungs On:',
              values: const ['Left', 'Right'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              id: 'landing_${widget.index}_belt_annual_41',
              title: 'Tension of Belt:',
              values: const ['OK', 'Loose', 'Tight'],
              onChangeValue: (value) {
                widget.model.intermediateLandingTensionOfBelt =
                    jsonData['intermediate_landing_tensionofbelt'][value];
              },
            ),
            CustomRadioTile(
              id: 'landing_${widget.index}_belt_annual_42',
              title: 'Rope Guide Type:',
              values: const ['Humphrey', "Eyes"],
              onChangeValue: (value) {},
            ),
            CustomTextField(
                id: 'landing_${widget.index}_belt_annual_43',
                title: 'Distance Between Rope Guides'),
            CustomRadioTile(
              id: 'landing_${widget.index}_belt_annual_44',
              title: 'Condition:',
              values: const ['OK', 'Replace Damaged', 'Replace Worn'],
              onChangeValue: (value) {
                widget.model.intermediateLandingConditionOfRopeGuides =
                    jsonData['intermediate_landing_tensionofbelt'][value];
              },
            ),

            DistanceTextField(
                id: 'landing_${widget.index}_belt_annual_46a',
                title: 'Measurement from Top of this Floor to Top of Floor #'),
            CustomRadioTile(
              id: 'landing_${widget.index}_belt_annual_47',
              title: 'Lighting:',
              values: const ['OK', 'Poor'],
              onChangeValue: (value) {
                widget.model.intermediateLandingLighting =
                    jsonData['intermediate_landing_lighting'][value];
              },
            ),
            CustomRadioTile(
              id: 'landing_${widget.index}_belt_annual_48',
              title: 'Is Landing Clean/Free of Obstructions:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.model.intermediateLandingIsLandingClean =
                    jsonData['intermediate_landing_islandingclean'][value];
              },
            ),
            CustomRadioTile(
              id: 'landing_${widget.index}_belt_annual_49',
              title: 'Lateral Bracing:',
              values: const ['OK', 'Needs Additional'],
              onChangeValue: (value) {
                widget.model.intermediateLandingLateralBracing =
                    jsonData['intermediate_landing_lateralbracing'][value];
              },
              conditionalBuilder: (selected) {
                if (selected == 'needs_additional') {
                  return CustomTextField(
                    id: 'landing_${widget.index}_belt_annual_49a',
                    title: 'How Many',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomRadioTile(
              id: 'landing_${widget.index}_belt_annual_50',
              title: 'Check Attachment Bolts:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.model.intermediateLandingCheckAttachmentBolts =
                    jsonData['intermediate_landing_checkattachmentbolts']
                        [value];
              },
              conditionalBuilder: (selected) {
                if (selected == 'yes') {
                  return CustomRadioTile(
                    id: 'landing_${widget.index}_belt_annual_51',
                    title: 'Condition:',
                    values: const ['OK', 'Missing'],
                    onChangeValue: (value) {
                      //  beltModel.topLandingInstructionSign =
                      //     jsonData['top_landing_instructionsign'][value];
                    },
                    conditionalBuilder: (selected) {
                      if (selected == 'missing') {
                        return CustomTextField(
                          id: 'landing_${widget.index}_belt_annual_52',
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
              id: 'landing_${widget.index}_belt_annual_53',
              title: 'Is there a visual and audible alerting system:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(
              id: 'landing_${widget.index}_belt_annual_54',
              title: 'Intermediate Landing Comments:',
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

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     PageNavigationButton(
            //       pageController: widget.pageController,
            //       right: false,
            //     ),
            //     PageNavigationButton(
            //       pageController: widget.pageController,
            //       right: true,
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
