import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/custom_title.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
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
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
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
              title: '“Authorized Personnel Only” Sign: (2” letters)',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {
                widget.beltModel.bottomLandingAuthorizedPersonnelOnlySign =
                    jsonData["bottom_landing_authorized_personnel_only_sign"]
                        [value];
              },
            ),
            CustomRadioTile(
              title: 'Instruction Sign: (1” letters)',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {
                widget.beltModel.bottomLandingInstructionSign =
                    jsonData["bottom_landing_instruction_sign"][value];
              },
            ),
            CustomRadioTile(
              title: '“BOTTOM FLOOR – GET OFF” Sign: (2” letters) ',
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
                title: "Red Warning Light Condition",
                values: const ['OK', 'Inoperable'],
                onChangeValue: (value) {
                  // beltModel.redligh =
                  //     jsonData["bottom_landing_light_location"][value];
                },
              ),
            if (beltVariable.bottomLandingRedWarningLight == "yes")
              CustomRadioTile(
                title: "Light Location",
                values: const ['OK', 'Relocate'],
                onChangeValue: (value) {
                  widget.beltModel.bottomLandingLightLocation =
                      jsonData["bottom_landing_light_location"][value];
                },
              ),
            CustomRadioTile(
              title: "Is Manlift in a Below Grade Pit",
              values: const ['Yes', 'No', 'Non Compliant'],
              onChangeValue: (value) {
                setState(() {
                  beltVariable.bottomLandingIsManliftInABelowGradePit = value;
                });
                widget.beltModel.bottomLandingIsManliftInABelowGradePit =
                    jsonData["bottom_landing_is_manlift_in_a_below_grade_pit"]
                        [value];
              },
            ),
            if (beltVariable.bottomLandingIsManliftInABelowGradePit == "yes")
              CustomTextField(
                title: 'Depth',
                onChanged: (value) {
                  widget.beltModel.bottomLandingGradePitDepth = value;
                },
              ),
            if (beltVariable.bottomLandingIsManliftInABelowGradePit == "yes")
              CustomTextField(
                title: 'Width',
                onChanged: (value) {
                  widget.beltModel.bottomLandingGradePitWidth = value;
                },
              ),
            if (beltVariable.bottomLandingIsManliftInABelowGradePit == "yes")
              CustomRadioTile(
                title: "Clean",
                values: const ['Yes', 'No'],
                onChangeValue: (value) {
                  widget.beltModel.bottomLandingManliftClean =
                      jsonData["bottom_landing_manlift_clean"][value];
                },
              ),
            CustomRadioTile(
              title: 'Does Manlift Use “UP” Side Platform:',
              values: const ['Yes', 'No', 'Non Compliant'],
              onChangeValue: (value) {
                widget.beltModel.bottomLandingDoesManliftUseUpSidePlatform =
                    jsonData["bottom_landing_does_manlift_use_up_side_platform"]
                        [value];
              },
            ),
            CustomTextField(title: '# of Risers:'),
            CustomTextField(title: 'Height'),
            CustomTextField(title: 'Width'),
            CustomTextField(title: 'Depth'),
            CustomRadioTile(
              title: 'Describe Opening:',
              values: const ['Circular', 'Square'],
              onChangeValue: (value) {
                widget.beltModel.bottomLandingDescribeOpening =
                    jsonData["bottom_landing_describe_opening"][value];
              },
            ),
            CustomRadioTile(
              title: 'Distance From Floor Opening to Guard Rail “Upside”:',
              values: const ['Compliant', 'Non-Compliant'],
              onChangeValue: (value) {
                widget.beltModel
                        .bottomLandingDistanceFromFloorOpeningToGuardRailUpSide =
                    jsonData[
                            "bottom_landing_distance_from_floor_opening_to_guard_rail_up_side"]
                        [value];
              },
            ),
            DistanceTextField(title: 'Back'),
            DistanceTextField(title: 'Left'),
            DistanceTextField(title: 'Right'),
            CustomRadioTile(
              title: 'Does Manlift Use “DOWN” Side Platform:',
              values: const ['Yes', 'No', 'Non Compliant'],
              onChangeValue: (value) {
                widget.beltModel
                    .bottomLandingDoesManliftUseDownSidePlatform = jsonData[
                        "bottom_landing_does_manlift_use_down_side_platform"]
                    [value];
              },
            ),
            CustomTextField(title: '# of Risers:'),
            CustomTextField(title: 'Height'),
            CustomTextField(title: 'Width'),
            CustomTextField(title: 'Depth'),
            CustomRadioTile(
              title: 'Describe Opening:',
              values: const ['Circular', 'Square'],
              onChangeValue: (value) {
                widget.beltModel.bottomLandingDescribeOpening =
                    jsonData["bottom_landing_describe_opening"][value];
              },
            ),
            CustomRadioTile(
              title:
                  'Is There a Wall in Front of Dismount Platform Within 48” From Face of Belt:',
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
              title: 'Distance From Floor Opening to Guard Rail “Downside”:',
              values: const ['Compliant', 'Non-Compliant'],
              onChangeValue: (value) {
                widget.beltModel
                        .bottomLandingDistanceFromFloorOpeningToGuardRailDownSide =
                    jsonData[
                            "bottom_landing_distance_from_floor_opening_to_guard_rail_down_side"]
                        [value];
              },
            ),
            DistanceTextField(title: 'Back'),
            DistanceTextField(title: 'Left'),
            DistanceTextField(title: 'Right'),
            CustomRadioTile(
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
                title: 'Distance Between Rungs',
                values: const ['12”', 'Other'],
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
                title: 'Ladder Rungs',
                values: const ['Bolted', 'Welded'],
                onChangeValue: (value) {
                  //   beltModel.bottomLandingLadderRungsCondition =
                  //       jsonData["bottom_landing_ladder_rungs"][value];
                },
              ),

            if (beltVariable.bottomLandingLadderRungs == "yes")
              CustomRadioTile(
                title: 'Ladder Rungs Condition',
                values: const ['OK', 'Replace Damaged', 'Replace Worn'],
                onChangeValue: (value) {
                  widget.beltModel.bottomLandingLadderRungsCondition =
                      jsonData["bottom_landing_ladder_rungs_condition"][value];
                },
              ),
            CustomRadioTile(
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
                title: 'Are Gates-Self Closing',
                values: const ['Yes', 'No'],
                onChangeValue: (value) {
                  widget.beltModel.bottomLandingAreGatesSelfClosing =
                      jsonData["bottom_landing_are_gates_self_closing"][value];
                },
              ),
            if (beltVariable.bottomLandingSelfClosingGates == "yes")
              CustomRadioTile(
                title: 'Are Gates Needed',
                values: const ['Yes', 'No'],
                onChangeValue: (value) {
                  widget.beltModel.bottomLandingAreGatesMissing =
                      jsonData["bottom_landing_are_gates_missing"][value];
                },
              ),
            if (beltVariable.bottomLandingSelfClosingGates == "yes")
              CustomRadioTile(
                title: 'How Many',
                values: const ['1', '2', '3'],
                onChangeValue: (value) {
                  widget.beltModel.bottomLandingGatesMissingCount = value;
                },
              ),
            if (beltVariable.bottomLandingSelfClosingGates == "yes")
              CustomRadioTile(
                title: 'Open Outward',
                values: const ["Yes", "No"],
                onChangeValue: (value) {
                  widget.beltModel.bottomLandingOpenOutward =
                      jsonData["bottom_landing_open_outward"][value];
                },
              ),
            CustomRadioTile(
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
                title: 'Add’l Toeboard Required:',
                values: const ["Yes", "No"],
                onChangeValue: (value) {
                  widget.beltModel.bottomLandingAddToeboard =
                      jsonData["bottom_landing_add_toeboard_required"][value];
                },
              ),
            CustomTextField(
              title: 'Length',
              onChanged: (value) {
                widget.beltModel.bottomLandingToeboardLength = value;
              },
            ),
            if (beltVariable.bottomLandingToeboard == "yes")
              CustomRadioTile(
                title: 'Toeboard Material:',
                values: const ["Steel", "Raised Concrete", "Other"],
                onChangeValue: (value) {
                  // beltModel.toeboard =
                  //     jsonData["bottom_landing_toeboard_height"][value];
                },
              ),
            if (beltVariable.bottomLandingToeboard == "yes")
              CustomTextField(
                title: 'Toeboard Height',
                onChanged: (value) {
                  widget.beltModel.bottomLandingToeboardHeight = value;
                },
              ),
            CustomTitle(
                title:
                    'Distance from Face of Belt to Back Edge of Floor Opening:'),
            CustomTextField(title: '“Upside”:'), // CustomTextField for Upside
            CustomTextField(
                title: '“Downside”:'), // CustomTextField for Downside
            CustomTitle(title: 'Guard Rail Height:'),
            CustomTextField(title: '“Upside”:'), // Guard Rail Height - Upside
            CustomTextField(
                title: '“Downside”:'), // Guard Rail Height - Downside
            CustomRadioTile(
              title: 'Guard Rail Material Used:',
              values: const ["Angle", "Square Tubing", "Round Tubing"],
              onChangeValue: (value) {
                // beltModel.guardrailmat =
                //     jsonData["bottom_landing_distance_from_floor_opening_to_guard_rail_up_side"][value];
              },
            ),
            CustomTextField(
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
  const DistanceTextField(
      {super.key, required this.title, this.keyboard, this.from, this.to});

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
          ),
          const Text(
            '” to ?',
            style: TextStyle(fontSize: 16),
          ),
          TextFormField(
            controller: to,
            maxLines: null,
            keyboardType: keyboard,
          ),
        ],
      ),
    );
  }
}
