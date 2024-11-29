import 'package:flutter/material.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../../model/belt_inspection_model.dart';
import '../pages/belt_quaterly.dart';

class Steps extends StatelessWidget {
  const Steps(
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
            const FormHeaderTitle(title: "STEPS"),
            CustomRadioTile(
              id: 'steps_1',
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
                beltModel.driveAssemblyTopLandingSafetiesTopReset =
                    jsonData['drive_assembly_toplandingsafeties_topreset']
                        [value];
              },
            ),
            Wrap(
              children: [
                CustomTextField(
                  id: 'steps_2',
                  title: '# of Steps:',
                  onChanged: (val) {
                    beltModel.stepsNumberOfSteps = val;
                  },
                ),
                CustomRadioTile(
                  id: 'steps_3',
                  title: 'Steps Missing',
                  values: const ['Yes', 'No'],
                  onChangeValue: (value) {
                    beltModel.stepsStepsMissing =
                        jsonData['steps_steps_missing'][value];
                  },
                ),
                CustomTextField(
                  id: 'steps_4',
                  title: 'How Many:',
                  onChanged: (val) {
                    beltModel.stepsMissingStepsNumber = val;
                  },
                ),
              ],
            ),
            CustomRadioTile(
              id: 'steps_5',
              title: 'Tread Color:',
              values: const ['Blue', 'Yellow', 'Other'],
              onChangeValue: (value) {
                beltModel.stepsTreadColor =
                    jsonData['steps_tread_color'][value];
              },
            ),
            CustomRadioTile(
              id: 'steps_6',
              title: '# of Elevator Bolts:',
              values: const ['3', '4', '5', '6'],
              onChangeValue: (value) {
                beltModel.stepsNumberOfStepBarBolts =
                    jsonData['steps_#_of_step_bar_bolts'][value];
              },
            ),
            CustomRadioTile(
              id: 'steps_7',
              title: 'Condition of Elevator Bolts:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.stepsConditionOfElevatorBolts =
                    jsonData['steps_condition_of_elevator_bolts'][value];
              },
            ),
            CustomRadioTile(
              id: 'steps_8',
              title: 'Step Roller Type:',
              values: const [
                'L-75 Flanged Cast',
                'L-75N Flanged Nylatron',
                'L-69V Rubber'
              ],
              onChangeValue: (value) {
                beltModel.stepsStepRollerType =
                    jsonData['steps_step_roller_type'];
              },
            ),
            CustomRadioTile(
              id: 'steps_9',
              title: 'Step Roller Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.stepsStepRollerCondition =
                    jsonData['steps_step_roller_condition'][value];
              },
            ),
            CustomRadioTile(
              id: 'steps_10',
              title: 'Step Roller Bolts:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.stepsStepRollersBolts =
                    jsonData['steps_step_rollers_bolts'][value];
              },
            ),
            CustomRadioTile(
              id: 'steps_11',
              title: 'Step Tread Material:',
              values: const ['Steel', 'Wood'],
              onChangeValue: (value) {
                beltModel.stepsStepTreadMaterial =
                    jsonData['steps_step_tread_material'];
              },
            ),
            CustomRadioTile(
              id: 'steps_12',
              title: 'Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.stepsConditionOfStepTreads =
                    jsonData['steps_condition_of_step_treads'][value];
              },
            ),
            CustomRadioTile(
              id: 'steps_13',
              title: 'Anti-Skid:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.stepsAntiSkid = jsonData['steps_anti-skid'][value];
              },
            ),
            CustomRadioTile(
              id: 'steps_14',
              title: 'Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.stepsConditionOfAntiSkid =
                    jsonData['steps_condition_of_anti-skid'][value];
              },
            ),
            CustomRadioTile(
              id: 'steps_15',
              title: 'X-Y Washer:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.stepsStepPinsAndXyWasher =
                    jsonData['steps_step_pins_and_x-y_washer'][value];
              },
            ),
            CustomRadioTile(
              id: 'steps_16',
              title: 'Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.stepsConditionOfStepPinsAndXyWasher =
                    jsonData['steps_condition_of_step_pins_and_x-y_washer']
                        [value];
              },
            ),
            CustomRadioTile(
              id: 'steps_17',
              title: 'Bracket Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.stepsStepBracketsCondition =
                    jsonData['steps_step_brackets_condition'][value];
              },
            ),
            CustomRadioTile(
              id: 'steps_18',
              title: 'Step Bar Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.stepsStepBarsCondition =
                    jsonData['steps_step_bars_condition'][value];
              },
            ),
            CustomTextField(
              id: 'steps_19',
              title: 'Step Comments:',
              onChanged: (val) {
                beltModel.stepsStepComments = val;
              },
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
