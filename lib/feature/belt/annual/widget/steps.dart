import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../pages/belt_annual.dart';

class Steps extends StatefulWidget {
  const Steps(
      {super.key, required this.pageController, required this.beltModel});

  final PageController pageController;
  final BeltInspection beltModel;

  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
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
            const FormHeaderTitle(title: "STEPS"),
            CustomRadioTile(
              id: "step_belt_annual_1",
              title: 'Step Description',
              values: const [
                'Viola',
                'Humphrey',
                'Ersham',
                'B&L',
                'Allis-Chalmers',
                'Day'
              ],
              onChangeValue: (value) {
                widget.beltModel.stepsStepDescription =
                    jsonData['steps_step_description'];
              },
            ),
            Wrap(
              children: [
                CustomTextField(
                  id: "step_belt_annual_2",
                  title: '# of Steps:',
                  onChanged: (value) {
                    // widget.beltModel.stepsNumberOfSteps = value;
                  },
                ),
                CustomRadioTile(
                  id: "step_belt_annual_3",
                  title: 'Steps Missing',
                  values: const ['Yes', 'No'],
                  onChangeValue: (value) {
                    setState(() {
                      beltVariable.stepsStepsMissing = value;
                    });
                    widget.beltModel.stepsStepsMissing =
                        jsonData['steps_steps_missing'][value];
                  },
                ),
                if (beltVariable.stepsStepsMissing == "yes")
                  CustomTextField(
                    id: "step_belt_annual_4",
                    title: 'How Many:',
                    onChanged: (value) {
                      widget.beltModel.stepsMissingStepsNumber = value;
                    },
                  ),
              ],
            ),
            CustomRadioTile(
              id: "step_belt_annual_5",
              title: 'Tread Color:',
              values: const ['Blue', 'Yellow', 'Other'],
              onChangeValue: (value) {
                widget.beltModel.stepsTreadColor =
                    jsonData['steps_tread_color'][value];
              },
              conditionalBuilder: (selected) {
                if (selected == 'other') {
                  return CustomTextField(
                    id: "step_belt_annual_5a",
                    title: 'Specify Other',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomRadioTile(
              id: "step_belt_annual_6",
              title: '# of Elevator Bolts:',
              values: const ['3', '4', '5', '6'],
              onChangeValue: (value) {
                widget.beltModel.stepsNumberOfStepBarBolts =
                    jsonData['steps_#_of_step_bar_bolts'][value];
              },
            ),
            CustomRadioTile(
              id: "step_belt_annual_7",
              title: 'Condition of Elevator Bolts:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                widget.beltModel.stepsConditionOfElevatorBolts =
                    jsonData['steps_condition_of_elevator_bolts'][value];
              },
            ),
            CustomRadioTile(
              id: "step_belt_annual_8",
              title: 'Missing Bolts:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.stepsMissingBolts =
                    jsonData['steps_missing_bolts'][value];
              },
              conditionalBuilder: (selected) {
                if (selected == 'yes') {
                  return CustomTextField(
                    id: 'step_belt_annual_9',
                    title: 'How Many',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomTextField(
              id: "step_belt_annual_10",
              title: 'Step Bar Bolt Hole Pattern:',
              subtitle: '" Centerline',
              onChanged: (value) {
                widget.beltModel.stepsStepBarBoltHolePattern = value;
              },
            ),
            CustomTextField(
              id: "step_belt_annual_11",
              title: 'Step Bar to Step Bar Centers:',
              subtitle: '" to Centerline of Bolts',
              onChanged: (value) {
                widget.beltModel.stepsStepBarToStepBarCenters = value;
              },
            ),
            CustomRadioTile(
              id: "step_belt_annual_12",
              title: 'Step Roller Type:',
              values: const [
                'L-75 Flanged Cast',
                'L-75N Flanged Nylatron',
                'L-69V Rubber'
              ],
              onChangeValue: (value) {
                // value is not passed in json
                widget.beltModel.stepsStepRollerType =
                    jsonData['steps_step_roller_type'];
              },
            ),
            CustomRadioTile(
              id: "step_belt_annual_13",
              title: 'Step Roller Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                widget.beltModel.stepsStepRollerCondition =
                    jsonData['steps_step_roller_condition'][value];
              },
            ),
            CustomRadioTile(
              id: "step_belt_annual_14",
              title: 'Step Roller Bolts:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                widget.beltModel.stepsStepRollersBolts =
                    jsonData['steps_step_rollers_bolts'][value];
              },
            ),
            CustomRadioTile(
              id: "step_belt_annual_15",
              title: 'Step Tread Material:',
              values: const ['Steel', 'Wood'],
              onChangeValue: (value) {
                // value is not in json
                widget.beltModel.stepsStepTreadMaterial =
                    jsonData['steps_step_tread_material'];
              },
            ),
            CustomRadioTile(
              id: "step_belt_annual_16",
              title: 'Step Tread Material Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                widget.beltModel.stepsConditionOfStepTreads =
                    jsonData['steps_condition_of_step_treads'][value];
              },
            ),
            CustomRadioTile(
              id: "step_belt_annual_17",
              title: 'Anti-Skid:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                setState(() {
                  beltVariable.stepsAntiSkid = value;
                });
                widget.beltModel.stepsAntiSkid =
                    jsonData['steps_anti-skid'][value];
              },
            ),
            if (beltVariable.stepsAntiSkid == "yes")
              CustomRadioTile(
                id: "step_belt_annual_18",
                title: 'Anti-Skid Condition:',
                values: const [
                  'OK',
                  'Worn, but OK',
                  'Replace Damaged',
                  'Replace Worn'
                ],
                onChangeValue: (value) {
                  widget.beltModel.stepsConditionOfAntiSkid =
                      jsonData['steps_condition_of_anti-skid'][value];
                },
              ),
            CustomRadioTile(
              id: "step_belt_annual_19",
              title: 'Step Pins & X-Y Washer:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                setState(() {
                  beltVariable.stepsStepPinsAndXyWasher = value;
                });
                widget.beltModel.stepsStepPinsAndXyWasher =
                    jsonData['steps_step_pins_and_x-y_washer'][value];
              },
            ),
            if (beltVariable.stepsStepPinsAndXyWasher == "yes")
              CustomRadioTile(
                id: "step_belt_annual_20",
                title: 'Step Pins & X-Y Washer Condition:',
                values: const [
                  'OK',
                  'Worn, but OK',
                  'Replace Damaged',
                  'Replace Worn'
                ],
                onChangeValue: (value) {
                  widget.beltModel.stepsConditionOfStepPinsAndXyWasher =
                      jsonData['steps_condition_of_step_pins_and_x-y_washer']
                          [value];
                },
              ),
            CustomRadioTile(
              id: "step_belt_annual_21",
              title: 'Bracket Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                widget.beltModel.stepsStepBracketsCondition =
                    jsonData['steps_step_brackets_condition'][value];
              },
            ),
            CustomRadioTile(
              id: "step_belt_annual_22",
              title: 'Step Bar Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                widget.beltModel.stepsStepBarsCondition =
                    jsonData['steps_step_bars_condition'][value];
              },
            ),
            CustomTextField(
              id: "step_belt_annual_23",
              title: 'Step Comments:',
              onChanged: (value) {
                beltVariable.stepsStepComments = value;
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
            ),
          ],
        ),
      ),
    );
  }
}
