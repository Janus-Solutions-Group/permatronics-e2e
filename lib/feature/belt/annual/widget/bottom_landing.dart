import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manlift_app/data/models/original_model.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/custom_title.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/multiple_selection_widget.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';
import 'package:manlift_app/provider/selection_ref_provider.dart';
import 'package:provider/provider.dart';

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
            MultipleSelectionWidget(
              original: OriginalModel(
                id: "bottom_landing_annual_1",
                title: 'Authorized Personnel Only" Sign: (2" letters)',
                values: const ["Yes", "No", "Non-Compliant"],
              ),
              onSelectionChanged: (val) {
                if (val.isEmpty) return;

                final selected = val.last; // enforce single selection

                widget.beltModel.bottomLandingAuthorizedPersonnelOnlySign =
                    jsonData["bottom_landing_authorized_personnel_only_sign"]
                        [selected];
              },
            ),
            MultipleSelectionWidget(
              original: OriginalModel(
                id: "bottom_landing_annual_2",
                title: 'Instruction Sign: (1" letters)',
                values: const ["Yes", "No", "Non-Compliant"],
              ),
              onSelectionChanged: (val) {
                if (val.isEmpty) return;

                final selected = val.last;

                widget.beltModel.bottomLandingInstructionSign =
                    jsonData["bottom_landing_instruction_sign"][selected];
              },
            ),
            MultipleSelectionWidget(
              original: OriginalModel(
                id: "bottom_landing_annual_3",
                title: '"BOTTOM FLOOR - GET OFF" Sign: (2" letters)',
                values: const ["Yes", "No", "Non-Compliant"],
              ),
              onSelectionChanged: (val) {
                if (val.isEmpty) return;

                final selected = val.last;

                setState(() {
                  beltVariable.bottomLandingBottomFloorGetOffSign = selected;
                });

                widget.beltModel.bottomLandingBottomFloorGetOffSign =
                    jsonData["bottom_landing_bottom_floor_get_off_sign"]
                        [selected];
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
              id: "bottom_landing_annual_19",
              title: 'Back',
              onChangeValue: (value) {
                widget.beltModel.bottomLandingBackDistance = value;
              },
            ),
            DistanceTextField(
              id: "bottom_landing_annual_20",
              title: 'Left',
              onChangeValue: (value) {
                widget.beltModel.bottomLandingLeftDistance = value;
              },
            ),
            DistanceTextField(
              id: "bottom_landing_annual_21",
              title: 'Right',
              onChangeValue: (value) {
                widget.beltModel.bottomLandingRightDistance = value;
              },
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
              id: "bottom_landing_annual_28a",
              title:
                  'Is There a Wall in Front of Dismount Platform Within 48" From Face of Belt:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel
                        .bottomLandingIsThereAWallInFrontOfDismountPlatformWithin48FromFaceOfBelt =
                    value;
              },
            ),
            CustomRadioTile(
              id: "bottom_landing_annual_28b",
              title: 'Distance From Floor Opening to Guard Rail "Downside":',
              values: const ['Compliant', 'Non-Compliant'],
              onChangeValue: (value) {
                widget.beltModel
                        .bottomLandingDistanceFromFloorOpeningToGuardRailDownSide =
                    value;
              },
            ),
            DistanceTextField(
              id: "bottom_landing_annual_29",
              title: 'Back',
              onChangeValue: (value) {},
            ),
            DistanceTextField(
              id: "bottom_landing_annual_30",
              title: 'Left',
              onChangeValue: (value) {},
            ),
            DistanceTextField(
              id: "bottom_landing_annual_31",
              title: 'Right',
              onChangeValue: (value) {},
            ),
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
                conditionalBuilder: (selected) {
                  if (selected == 'other') {
                    return CustomTextField(
                      id: "bottom_landing_annual_33a",
                      title: 'Specify Other',
                    );
                  }
                  return const SizedBox.shrink();
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
              title: 'Maze:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.bottomLandingMaze =
                    jsonData['bottom_landing_maze'][value];
              },
              conditionalBuilder: (selected) {
                if (selected == 'yes') {
                  return const CustomTextField(
                    id: 'bottom_landing_annual_37',
                    title: 'Description',
                  );
                } else if (selected == 'no') {
                  return Column(
                    children: [
                      CustomRadioTile(
                        id: 'bottom_landing_annual_38',
                        title: 'Self Closing Gate:',
                        values: const ['1', '2', '3', '4'],
                        onChangeValue: (value) {
                          if (jsonData['bottom_landing_instructionsign'] !=
                              null) {
                            widget.beltModel.bottomLandingInstructionSign =
                                jsonData['bottom_landing_instructionsign']
                                    [value];
                          }
                        },
                      ),
                      CustomRadioTile(
                        id: 'bottom_landing_annual_39',
                        title: 'Open Outward:',
                        values: const ['Yes', 'No'],
                        onChangeValue: (value) {
                          if (jsonData['bottom_landing_openoutward'] != null) {
                            widget.beltModel.bottomLandingOpenOutward =
                                jsonData['bottom_landing_openoutward'][value];
                          }
                        },
                      ),
                      CustomRadioTile(
                        id: 'bottom_landing_annual_40',
                        title: 'Are Gates Missing:',
                        values: const ['Yes', 'No'],
                        onChangeValue: (value) {},
                        conditionalBuilder: (selected) {
                          if (selected == 'yes') {
                            return CustomTextField(
                              id: 'bottom_landing_annual_41',
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
              id: "bottom_landing_annual_42",
              title: 'Toeboard',
              values: const ["Yes", "No", 'Some'],
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
              MultipleSelectionWidget(
                original: OriginalModel(
                  id: "bottom_landing_annual_45",
                  title: 'Toeboard Material:',
                  values: const ["Steel", "Raised Concrete", "Other"],
                ),

                // show textfield only when "other" is selected
                fieldValues: const ["other"],
                fieldLabelTitle: "Specify Other",

                onSelectionChanged: (val) {
                  // if (val.isEmpty) return;

                  // final selected = val.last; // enforce single-selection

                  // Uncomment when mapping is ready
                  // widget.beltModel.toeboardMaterial =
                  //     jsonData["bottom_landing_toeboard_material"][selected];
                },

                onFieldChange: (value) {
                  // handle "Specify Other" input
                  // widget.beltModel.toeboardMaterialOther = value;
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
            CustomTextField(
                id: "bottom_landing_annual_47",
                onChanged: (val) {},
                title:
                    'Distance from Face of Belt to Back Edge of Floor Opening:'),
            CustomTextField(
              id: "bottom_landing_annual_48",
              title: '"Upside":',
              onChanged: (val) {},
            ), // CustomTextField for Upside
            CustomTextField(
              id: "bottom_landing_annual_49",
              title: '"Downside":',
              onChanged: (val) {},
            ), // CustomTextField for Downside
            CustomTextField(
                id: "bottom_landing_annual_50",
                onChanged: (val) {},
                title: 'Guard Rail Height:'),
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
            MultipleSelectionWidget(
              original: OriginalModel(
                id: "bottom_landing_annual_53",
                title: 'Guard Rail Material Used:',
                values: const ["Angle", "Square Tubing", "Round Tubing"],
              ),
              onSelectionChanged: (val) {
                // Uncomment when mapping is ready
                // widget.beltModel.guardRailMaterialUsed =
                //     jsonData["bottom_landing_guard_rail_material_used"][selected];
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

class DistanceTextField extends StatefulWidget {
  const DistanceTextField({
    super.key,
    required this.id,
    required this.title,
    this.keyboard,
    this.onChangeValue,
  });

  final String id;
  final String title;
  final TextInputType? keyboard;
  final ValueChanged<String>? onChangeValue;

  @override
  State<DistanceTextField> createState() => _DistanceTextFieldState();
}

class _DistanceTextFieldState extends State<DistanceTextField> {
  late TextEditingController fromController;
  late TextEditingController toController;

  @override
  void initState() {
    super.initState();

    // Load stored values
    final box = GetStorage();
    final fromValue = box.read('${widget.id}_from') ?? '';
    final toValue = box.read('${widget.id}_to') ?? '';

    fromController = TextEditingController(text: fromValue);
    toController = TextEditingController(text: toValue);

    // Initialize provider state
    context.read<SelectionRefProvider>().updateSelection(
          '${widget.id}_from',
          '${widget.title} From',
          fromValue,
        );
    context.read<SelectionRefProvider>().updateSelection(
          '${widget.id}_to',
          '${widget.title} To',
          toValue,
        );
  }

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    super.dispose();
  }

  Future<void> _onChanged(String type, String value) async {
    final idKey = '${widget.id}_$type';
    final title =
        '${widget.title} ${type[0].toUpperCase()}${type.substring(1)}';

    context.read<SelectionRefProvider>().updateSelection(idKey, title, value);
    await GetStorage().write(idKey, value);

    widget.onChangeValue?.call('$title: $value');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: fromController,
                  keyboardType: widget.keyboard,
                  onChanged: (val) => _onChanged('from', val),
                  decoration: const InputDecoration(
                    labelText: 'From',
                    suffixText: 'inch',
                    isDense: true,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: toController,
                  keyboardType: widget.keyboard,
                  onChanged: (val) => _onChanged('to', val),
                  decoration: const InputDecoration(
                    labelText: 'To',
                    suffixText: 'inch',
                    isDense: true,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
