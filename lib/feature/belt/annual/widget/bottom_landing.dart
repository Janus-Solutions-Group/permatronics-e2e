import 'package:flutter/material.dart';
import 'package:manlift_app/data/models/original_model.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/custom_title.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/multiple_selection_widget.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../pages/belt_annual.dart';

class BottomLanding extends StatefulWidget {
  const BottomLanding(
      {super.key, required this.pageController, required this.beltModel});
  final PageController pageController;
  final BeltInspection beltModel;

  @override
  State<BottomLanding> createState() => _BottomLandingState();
}

class _BottomLandingState extends State<BottomLanding> {
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
            const FormHeaderTitle(title: "BOTTOM LANDING = LANDING#1"),
            CustomRadioTile(
              id: "bottom_landing_annual_1",
              title: 'Authorized Personnel Only" Sign: (2" letters)',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {
                widget.beltModel.bottomLandingAuthorizedPersonnelOnlySign =
                    jsonData["bottom_landing_authorized_personnel_only_sign"]
                        [value];
              },
            ),
            CustomRadioTile(
              id: "bottom_landing_annual_2",
              title: 'Instruction Sign: (1" letters)',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {
                widget.beltModel.bottomLandingInstructionSign =
                    jsonData["bottom_landing_instruction_sign"][value];
              },
            ),
            CustomRadioTile(
              id: "bottom_landing_annual_3",
              title: '"BOTTOM FLOOR - GET OFF" Sign: (2" letters) ',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {
                setState(() {
                  beltVariable.bottomLandingBottomFloorGetOffSign = value;
                });
                widget.beltModel.bottomLandingBottomFloorGetOffSign =
                    jsonData["bottom_landing_bottom_floor_get_off_sign"][value];
              },
            ),
            if (beltVariable.bottomLandingBottomFloorGetOffSign == "yes")
              CustomRadioTile(
                id: "bottom_landing_annual_4",
                title: "Sign Location",
                values: const ['OK', 'Relocate'],
                onChangeValue: (value) {
                  widget.beltModel
                      .bottomLandingBottomFloorGetOffSignLocation = jsonData[
                          "bottom_landing_bottom_floor_get_off_sign_location"]
                      [value];
                },
              ),
            CustomRadioTile(
              id: "bottom_landing_annual_5",
              title: "Red Warning Light:",
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                setState(() {
                  beltVariable.bottomLandingRedWarningLight = value;
                });
                widget.beltModel.bottomLandingRedWarningLight =
                    jsonData["bottom_landing_red_warning_light"][value];
              },
            ),
            if (beltVariable.bottomLandingRedWarningLight == "yes")
              CustomRadioTile(
                id: "bottom_landing_annual_6",
                title: "Red Warning Light Condition",
                values: const ['OK', 'Inoperable'],
                onChangeValue: (value) {
                  // beltModel.redligh =
                  //     jsonData["bottom_landing_light_location"][value];
                },
              ),
            if (beltVariable.bottomLandingRedWarningLight == "yes")
              CustomRadioTile(
                id: "bottom_landing_annual_7",
                title: "Light Location",
                values: const ['OK', 'Relocate'],
                onChangeValue: (value) {
                  widget.beltModel.bottomLandingLightLocation =
                      jsonData["bottom_landing_light_location"][value];
                },
              ),
            MultipleSelectionWidget(
              original: OriginalModel(
                id: "bottom_landing_annual_8",
                title: "Is Manlift in a Below Grade Pit",
                values: const ['Yes', 'No', 'Non Compliant'],
              ),
              onSelectionChanged: (val) {
                String res = "";
                for (var e in val) {
                  res +=
                      jsonData['bottom_landing_is_manlift_in_a_below_grade_pit']
                              [e] +
                          "\n";
                }
                widget.beltModel.bottomLandingIsManliftInABelowGradePit = res;
                setState(() {
                  beltVariable.bottomLandingIsManliftInABelowGradePit = res;
                });
              },
            ),
            // CustomRadioTile(
            //   id: "bottom_landing_annual_8",
            //   title: "Is Manlift in a Below Grade Pit",
            //   values: const ['Yes', 'No', 'Non Compliant'],
            //   onChangeValue: (value) {
            //     setState(() {
            //       beltVariable.bottomLandingIsManliftInABelowGradePit = value;
            //     });
            //     widget.beltModel.bottomLandingIsManliftInABelowGradePit =
            //         jsonData["bottom_landing_is_manlift_in_a_below_grade_pit"]
            //             [value];
            //   },
            // ),
            if (beltVariable.bottomLandingIsManliftInABelowGradePit == "yes")
              CustomTextField(
                id: "bottom_landing_annual_9",
                title: 'Depth',
                onChanged: (value) {
                  widget.beltModel.bottomLandingGradePitDepth = value;
                },
              ),
            if (beltVariable.bottomLandingIsManliftInABelowGradePit == "yes")
              CustomTextField(
                id: "bottom_landing_annual_10",
                title: 'Width',
                onChanged: (value) {
                  widget.beltModel.bottomLandingGradePitWidth = value;
                },
              ),
            if (beltVariable.bottomLandingIsManliftInABelowGradePit == "yes")
              CustomRadioTile(
                id: "bottom_landing_annual_11",
                title: "Clean",
                values: const ['Yes', 'No'],
                onChangeValue: (value) {
                  widget.beltModel.bottomLandingManliftClean =
                      jsonData["bottom_landing_manlift_clean"][value];
                },
              ),
            CustomRadioTile(
              id: "bottom_landing_annual_12",
              title: 'Does Manlift Use "UP" Side Platform:',
              values: const ['Yes', 'No', 'Non Compliant'],
              onChangeValue: (value) {
                widget.beltModel.bottomLandingDoesManliftUseUpSidePlatform =
                    jsonData["bottom_landing_does_manlift_use_up_side_platform"]
                        [value];
              },
            ),
            CustomTextField(
                id: "bottom_landing_annual_13", title: '# of Risers:'),
            CustomTextField(id: "bottom_landing_annual_14", title: 'Height'),
            CustomTextField(id: "bottom_landing_annual_15", title: 'Width'),
            CustomTextField(id: "bottom_landing_annual_16", title: 'Depth'),
            CustomRadioTile(
              id: "bottom_landing_annual_17",
              title: 'Describe Opening:',
              values: const ['Circular', 'Square'],
              onChangeValue: (value) {
                widget.beltModel.bottomLandingDescribeOpening =
                    jsonData["bottom_landing_describe_opening"][value];
              },
            ),
            CustomRadioTile(
              id: "bottom_landing_annual_18",
              title: 'Distance From Floor Opening to Guard Rail "Upside":',
              values: const ['Compliant', 'Non-Compliant'],
              onChangeValue: (value) {
                widget.beltModel
                        .bottomLandingDistanceFromFloorOpeningToGuardRailUpSide =
                    jsonData[
                            "bottom_landing_distance_from_floor_opening_to_guard_rail_up_side"]
                        [value];
              },
            ),
            DistanceTextField(
              // id: "bottom_landing_annual_19",
              title: 'Back',
            ),
            DistanceTextField(
              // id: "bottom_landing_annual_20",
              title: 'Left',
            ),
            DistanceTextField(
              // id: "bottom_landing_annual_21",
              title: 'Right',
            ),
            CustomRadioTile(
              id: "bottom_landing_annual_22",
              title: 'Does Manlift Use "DOWN" Side Platform:',
              values: const ['Yes', 'No', 'Non Compliant'],
              onChangeValue: (value) {
                widget.beltModel
                    .bottomLandingDoesManliftUseDownSidePlatform = jsonData[
                        "bottom_landing_does_manlift_use_down_side_platform"]
                    [value];
              },
            ),
            CustomTextField(
                id: "bottom_landing_annual_23", title: '# of Risers:'),
            CustomTextField(id: "bottom_landing_annual_24", title: 'Height'),
            CustomTextField(id: "bottom_landing_annual_25", title: 'Width'),
            CustomTextField(id: "bottom_landing_annual_26", title: 'Depth'),
            CustomRadioTile(
              id: "bottom_landing_annual_27",
              title: 'Describe Opening:',
              values: const ['Circular', 'Square'],
              onChangeValue: (value) {
                widget.beltModel.bottomLandingDescribeOpening =
                    jsonData["bottom_landing_describe_opening"][value];
              },
            ),
            CustomRadioTile(
              id: "bottom_landing_annual_28",
              title:
                  'Is There a Wall in Front of Dismount Platform Within 48" From Face of Belt:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel
                        .bottomLandingIsThereAWallInFrontOfDismountPlatformWithin48FromFaceOfBelt =
                    jsonData[
                            "bottom_landing_is_there_a_wall_in_front_of_dismount_platform_within_48_from_face_of_belt"]
                        [value];
              },
            ),
            CustomRadioTile(
              id: "bottom_landing_annual_28",
              title: 'Distance From Floor Opening to Guard Rail "Downside":',
              values: const ['Compliant', 'Non-Compliant'],
              onChangeValue: (value) {
                widget.beltModel
                        .bottomLandingDistanceFromFloorOpeningToGuardRailDownSide =
                    jsonData[
                            "bottom_landing_distance_from_floor_opening_to_guard_rail_down_side"]
                        [value];
              },
            ),
            DistanceTextField(
                // id: "bottom_landing_annual_29",

                title: 'Back'),
            DistanceTextField(
                // id: "bottom_landing_annual_30",

                title: 'Left'),
            DistanceTextField(
                // id: "bottom_landing_annual_31",

                title: 'Right'),
            CustomRadioTile(
              id: "bottom_landing_annual_32",
              title: 'Ladder Rungs',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                setState(() {
                  beltVariable.bottomLandingLadderRungs = value;
                });
                widget.beltModel.bottomLandingLadderRungs =
                    jsonData["bottom_landing_ladder_rungs"][value];
              },
            ),
            if (beltVariable.bottomLandingLadderRungs == "yes")
              CustomRadioTile(
                id: "bottom_landing_annual_33",
                title: 'Distance Between Rungs',
                values: const ['12"', 'Other'],
                onChangeValue: (value) {
                  widget.beltModel.bottomLandingDistanceBetweenRungs =
                      jsonData["bottom_landing_distance_between_rungs"][value];
                },
                fieldValue: "other",
                onFieldChange: (value) {
                  widget.beltModel.bottomLandingDistanceBetweenRungs = value;
                },
              ),

            if (beltVariable.bottomLandingLadderRungs == "yes")
              CustomRadioTile(
                id: "bottom_landing_annual_34",
                title: 'Ladder Rungs',
                values: const ['Bolted', 'Welded'],
                onChangeValue: (value) {
                  //   beltModel.bottomLandingLadderRungsCondition =
                  //       jsonData["bottom_landing_ladder_rungs"][value];
                },
              ),

            if (beltVariable.bottomLandingLadderRungs == "yes")
              CustomRadioTile(
                id: "bottom_landing_annual_35",
                title: 'Ladder Rungs Condition',
                values: const ['OK', 'Replace Damaged', 'Replace Worn'],
                onChangeValue: (value) {
                  widget.beltModel.bottomLandingLadderRungsCondition =
                      jsonData["bottom_landing_ladder_rungs_condition"][value];
                },
              ),
            CustomRadioTile(
              id: "bottom_landing_annual_36",
              title: 'Maze',
              values: const ['Yes', 'No', 'NA'],
              onChangeValue: (value) {
                setState(() {
                  beltVariable.bottomLandingMaze = value;
                });
                widget.beltModel.bottomLandingMaze =
                    jsonData["bottom_landing_maze"][value];
              },
            ),
            if (beltVariable.bottomLandingMaze == "no" ||
                beltVariable.bottomLandingMaze == "na")
              CustomRadioTile(
                id: "bottom_landing_annual_37",
                title: 'Self Closing Gates',
                values: const ['Yes', 'No', "NA"],
                onChangeValue: (value) {
                  setState(() {
                    beltVariable.bottomLandingSelfClosingGates = value;
                  });
                  widget.beltModel.bottomLandingSelfClosingGates =
                      jsonData["bottom_landing_self_closing_gates"][value];
                },
              ),
            if (beltVariable.bottomLandingSelfClosingGates == "yes")
              CustomRadioTile(
                id: "bottom_landing_annual_38",
                title: 'Are Gates-Self Closing',
                values: const ['Yes', 'No'],
                onChangeValue: (value) {
                  widget.beltModel.bottomLandingAreGatesSelfClosing =
                      jsonData["bottom_landing_are_gates_self_closing"][value];
                },
              ),
            if (beltVariable.bottomLandingSelfClosingGates == "yes")
              CustomRadioTile(
                id: "bottom_landing_annual_39",
                title: 'Are Gates Needed',
                values: const ['Yes', 'No'],
                onChangeValue: (value) {
                  widget.beltModel.bottomLandingAreGatesMissing =
                      jsonData["bottom_landing_are_gates_missing"][value];
                },
              ),
            if (beltVariable.bottomLandingSelfClosingGates == "yes")
              CustomRadioTile(
                id: "bottom_landing_annual_40",
                title: 'How Many',
                values: const ['1', '2', '3'],
                onChangeValue: (value) {
                  widget.beltModel.bottomLandingGatesMissingCount = value;
                },
              ),
            if (beltVariable.bottomLandingSelfClosingGates == "yes")
              CustomRadioTile(
                id: "bottom_landing_annual_41",
                title: 'Open Outward',
                values: const ["Yes", "No"],
                onChangeValue: (value) {
                  widget.beltModel.bottomLandingOpenOutward =
                      jsonData["bottom_landing_open_outward"][value];
                },
              ),
            CustomRadioTile(
              id: "bottom_landing_annual_42",
              title: 'Toeboard',
              values: const ["Yes", "No"],
              onChangeValue: (value) {
                setState(() {
                  beltVariable.bottomLandingToeboard = value;
                });
                widget.beltModel.bottomLandingToeboard =
                    jsonData["bottom_landing_toeboard"][value];
              },
            ),
            if (beltVariable.bottomLandingToeboard == "yes")
              CustomRadioTile(
                id: "bottom_landing_annual_43",
                title: 'Add\'l Toeboard Required:',
                values: const ["Yes", "No"],
                onChangeValue: (value) {
                  widget.beltModel.bottomLandingAddToeboard =
                      jsonData["bottom_landing_add_toeboard_required"][value];
                },
              ),
            CustomTextField(
              id: "bottom_landing_annual_44",
              title: 'Length',
              onChanged: (value) {
                widget.beltModel.bottomLandingToeboardLength = value;
              },
            ),
            if (beltVariable.bottomLandingToeboard == "yes")
              CustomRadioTile(
                id: "bottom_landing_annual_45",
                title: 'Toeboard Material:',
                values: const ["Steel", "Raised Concrete", "Other"],
                onChangeValue: (value) {
                  // beltModel.toeboard =
                  //     jsonData["bottom_landing_toeboard_height"][value];
                },
              ),
            if (beltVariable.bottomLandingToeboard == "yes")
              CustomTextField(
                id: "bottom_landing_annual_46",
                title: 'Toeboard Height',
                onChanged: (value) {
                  widget.beltModel.bottomLandingToeboardHeight = value;
                },
              ),
            const CustomTitle(
                title:
                    'Distance from Face of Belt to Back Edge of Floor Opening:'),
            CustomTextField(
              id: "bottom_landing_annual_48",
              title: '“Upside”:',
              onChanged: (val) {},
            ), // CustomTextField for Upside
            CustomTextField(
              id: "bottom_landing_annual_49",
              title: '"Downside":',
              onChanged: (val) {},
            ), // CustomTextField for Downside
            const CustomTitle(title: 'Guard Rail Height:'),
            CustomTextField(
              id: "bottom_landing_annual_51",
              title: '"Upside":',
              onChanged: (val) {},
            ), // Guard Rail Height - Upside
            CustomTextField(
              id: "bottom_landing_annual_52",
              title: '"Downside":',
              onChanged: (val) {},
            ), // Guard Rail Height - Downside
            CustomRadioTile(
              id: "bottom_landing_annual_53",
              title: 'Guard Rail Material Used:',
              values: const ["Angle", "Square Tubing", "Round Tubing"],
              onChangeValue: (value) {
                // beltModel.guardrailmat =
                //     jsonData["bottom_landing_distance_from_floor_opening_to_guard_rail_up_side"][value];
              },
            ),
            CustomTextField(
              id: "bottom_landing_annual_54",
              title: 'Bottom Landing Notes/Comments:',
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
            )
          ],
        ),
      ),
    );
  }
}

class DistanceTextField extends StatelessWidget {
  const DistanceTextField({
    super.key,
    this.id,
    required this.title,
    this.keyboard,
    this.from,
    this.to,
  });
  final String? id;
  final String title;
  final TextInputType? keyboard;
  final TextEditingController? from;
  final TextEditingController? to;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          TextFormField(
            controller: from,
            maxLines: null,
            keyboardType: keyboard,
            decoration: const InputDecoration(suffix: Text("inch")),
          ),
          const Center(
            child: Text(
              'to ?',
              style: TextStyle(fontSize: 16),
            ),
          ),
          TextFormField(
            controller: to,
            maxLines: null,
            keyboardType: keyboard,
            decoration: const InputDecoration(suffix: Text("inch")),
          ),
        ],
      ),
    );
  }
}
