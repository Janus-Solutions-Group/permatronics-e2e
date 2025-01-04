import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/annual/widget/bottom_landing.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/custom_title.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../pages/belt_annual.dart';

class IntermediateLanding extends StatefulWidget {
  const IntermediateLanding(
      {super.key, required this.pageController, required this.beltModel});

  final PageController pageController;
  final BeltInspection beltModel;

  @override
  State<IntermediateLanding> createState() => _IntermediateLandingState();
}

class _IntermediateLandingState extends State<IntermediateLanding> {
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
            FormHeaderTitle(title: "INTERMEDIATE LANDING#"),
            CustomRadioTile(
              title: '“Authorized Personnel Only” Sign: (2” letters)',
              values: const ['Yes', 'No', 'Non-Compliant'],
              onChangeValue: (value) {
                widget.beltModel.intermediateLandingAuthorizedPersonnelSign =
                    jsonData['intermediate_landing_authorizedpersonnelsign']
                        [value];
              },
            ),
            CustomRadioTile(
              title: 'Instruction Sign: (1” letters)',
              values: const ['Yes', 'No', 'Non-Compliant'],
              onChangeValue: (value) {
                widget.beltModel.intermediateLandingInstructionSign =
                    jsonData['intermediate_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: 'Floor Opening Shape',
              values: const ['Circular', 'Shape'],
              onChangeValue: (value) {
                widget.beltModel.intermediateLandingFloorOpeningShape =
                    jsonData['intermediate_landing_flooropeningshape'][value];
              },
            ),
            CustomTextField(title: 'Thickness:'),
            CustomRadioTile(
              title: 'Material:',
              values: const ['Concrete', 'Steel'],
              onChangeValue: (value) {
                // beltModel.intermediate = value;
              },
            ),
            CustomTextField(title: 'Diameter “Upside”'),
            CustomTextField(title: 'Diameter “Downside”'),
            CustomTitle(
                title:
                    'Distance from Face of Belt to Back Edge of Floor Opening:'),
            CustomTextField(title: '“Upside”:'),
            CustomTextField(title: '“Downside”:'),
            CustomRadioTile(
              title: 'Distance from Floor Opening to Guard Rail “Upside”:',
              values: const ['Compliant', 'Non-Compliant'],
              onChangeValue: (value) {
                // beltModel
                //         .intermediateLandingDistanceFromFloorOpeningToGuardRailUpSideRight =
                //     value;
              },
            ),
            DistanceTextField(title: 'Back'),
            DistanceTextField(title: 'Left'),
            DistanceTextField(title: 'Right'),
            CustomRadioTile(
              title: 'Distance from Floor Opening to Guard Rail “Downside”:',
              values: const ['Compliant', 'Non-Compliant'],
              onChangeValue: (value) {
                // beltModel.distanceFromOpeningDownside = value;
                // beltModel
                //         .distance =
                //     value;
              },
            ),
            DistanceTextField(title: 'Back'),
            DistanceTextField(title: 'Left'),
            DistanceTextField(title: 'Right'),
            CustomTitle(title: 'Guard Rail Height:'),
            CustomTextField(title: '“Upside”:'),
            CustomTextField(title: '“Downside”:'),
            CustomRadioTile(
              title: 'Guard Rail Material Used:',
              values: const ['Angle', 'Square Tubing', 'Round Tubing', 'Woo'],
              onChangeValue: (value) {
                // beltModel.guard = value;
              },
            ),
            CustomRadioTile(
              title: 'Maze:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.intermediateLandingMaze =
                    jsonData['intermediate_landing_maze'][value];
              },
            ),
            CustomTextField(title: 'Description'),
            CustomRadioTile(
              title: 'Self Closing Gate:',
              values: const ['1', '2', '3', '4'],
              onChangeValue: (value) {
                widget.beltModel.intermediateLandingSelfClosingGates =
                    jsonData['intermediate_landing_selfclosinggates'][value];
              },
            ),
            CustomRadioTile(
              title: 'Open Outward:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.intermediateLandingOpenOutward =
                    jsonData['intermediate_landing_openoutward'][value];
              },
            ),
            CustomRadioTile(
              title: 'Are Gates Missing:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.intermediateLandingAreGatesMissing =
                    jsonData['intermediate_landing_aregatesmissing'][value];
              },
            ),
            CustomTextField(title: 'How Many'),
            CustomRadioTile(
              title: 'Toeboard:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.intermediateLandingToeboard =
                    jsonData['intermediate_landing_toeboard'][value];
              },
            ),
            CustomRadioTile(
              title: 'Add’l Toeboard Required:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.intermediateLandingAddlToeboard =
                    jsonData['intermediate_landing_addltoeboardrequired']
                        [value];
              },
            ),
            CustomTextField(title: 'Length'),
            CustomRadioTile(
              title: 'Toeboard Material:',
              values: const ['Steel', 'Raised Concrete', 'Other'],
              onChangeValue: (value) {
                // beltModel.toeboard = value;
              },
            ),
            CustomTextField(title: 'Toeboard Height:'),
            CustomRadioTile(
              title: 'Type of Hood:',
              values: const ['Stationary', 'Moveable', 'Moveable Mini', 'None'],
              onChangeValue: (value) {
                // beltModel. = value;
              },
            ),
            CustomRadioTile(
              title: 'Hood Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                widget.beltModel.intermediateLandingHoodCondition =
                    jsonData['intermediate_landing_hoodcondition'][value];
              },
            ),
            CustomRadioTile(
              title: 'Hood Clearance: : (Minimum 7’6”)',
              values: const ['OK', 'Non-Compliant'],
              onChangeValue: (value) {
                widget.beltModel.intermediateLandingHoodClearance =
                    jsonData['intermediate_landing_hoodclearance'][value];
              },
            ),
            CustomTextField(title: 'If Stationary, Distance from Face of Belt'),
            CustomTextField(title: 'Angle of Slope'),
            CustomRadioTile(
              title: 'Shape',
              values: const ['Circular', 'Square'],
              onChangeValue: (value) {
                // beltModel.intermediateLandingFloorOpeningShape = jsonData['intermediate_landing_selfclosinggates'][value];;
              },
            ),
            CustomRadioTile(
              title: 'if Moveable, What type of Switch:',
              values: const ['Mercury', 'Micro-Switch'],
              onChangeValue: (value) {
                // beltModel.ifmo = value;
              },
            ),
            CustomRadioTile(
              title: 'Location of Hinges:',
              values: const ['6”', 'More than 6” with Obstruction', 'Other'],
              onChangeValue: (value) {
                // beltModel.hinge = value;
              },
            ),
            CustomRadioTile(
              title: 'Counterweighted:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                // beltModel.counter = value;
              },
            ),
            CustomRadioTile(
              title: 'Does Hood Have a Rolled Edge:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.intermediateLandingDoesHoodHaveRolledEdge =
                    jsonData['intermediate_landing_doeshoodhaverollededge']
                        [value];
              },
            ),
            CustomRadioTile(
              title: 'Condition of Rolled Edge:',
              values: const [
                'OK',
                'Damaged, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                widget.beltModel.intermediateLandingConditionOfRolledEdge =
                    jsonData['intermediate_landing_conditionofrollededge']
                        [value];
              },
            ),
            CustomRadioTile(
              title: 'Ladder Rungs:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.intermediateLandingLadderRungs =
                    jsonData['intermediate_landing_ladderrungs'][value];
              },
            ),
            CustomRadioTile(
              title: 'Rung Attachment:',
              values: const ['Bolted', 'Welded'],
              onChangeValue: (value) {
                // beltModel.rung = value;
              },
            ),
            CustomRadioTile(
              title: 'Condition:',
              values: const ['OK', 'Replace Damaged'],
              onChangeValue: (value) {
                // beltModel.run = value;
              },
            ),
            CustomTextField(title: 'How Many'),
            CustomRadioTile(
              title: 'Distance Between Rungs:',
              values: const ['12”', 'Other'],
              onChangeValue: (value) {
                // beltModel.distanceb = value;
              },
              isTextField: true,
              fieldTitle: 'Other',
            ),
            CustomRadioTile(
              title: 'Facing “Up” Travel Side, Are the Ladder Rungs On:',
              values: const ['Left', 'Right'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Tension of Belt:',
              values: const ['OK', 'Loose', 'Tight'],
              onChangeValue: (value) {
                widget.beltModel.intermediateLandingTensionOfBelt =
                    jsonData['intermediate_landing_tensionofbelt'][value];
              },
            ),
            CustomRadioTile(
              title: 'Rope Guide Type:',
              values: const ['Humphrey'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Distance Between Rope Guides'),
            CustomRadioTile(
              title: 'Condition:',
              values: const ['OK', 'Replace Damaged', 'Replace Worn'],
              onChangeValue: (value) {
                widget.beltModel.intermediateLandingConditionOfRopeGuides =
                    jsonData['intermediate_landing_tensionofbelt'][value];
              },
            ),
            CustomRadioTile(
              title: 'Need Add’l:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.intermediateLandingConditionOfRopeGuides =
                    jsonData['intermediate_landing_needaddlropeguides'][value];
              },
            ),
            CustomTextField(title: 'How Many'),
            DistanceTextField(
                title: 'Measurement from Top of this Floor to Top of Floor #'),
            CustomRadioTile(
              title: 'Lighting:',
              values: const ['OK', 'Poor'],
              onChangeValue: (value) {
                widget.beltModel.intermediateLandingLighting =
                    jsonData['intermediate_landing_lighting'][value];
              },
            ),
            CustomRadioTile(
              title: 'Is Landing Clean/Free of Obstructions:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.intermediateLandingIsLandingClean =
                    jsonData['intermediate_landing_islandingclean'][value];
              },
            ),
            CustomRadioTile(
              title: 'Lateral Bracing:',
              values: const ['OK', 'Needs Add’l'],
              onChangeValue: (value) {
                widget.beltModel.intermediateLandingLateralBracing =
                    jsonData['intermediate_landing_lateralbracing'][value];
              },
            ),
            CustomRadioTile(
              title: 'Check Attachment Bolts:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.intermediateLandingCheckAttachmentBolts =
                    jsonData['intermediate_landing_checkattachmentbolts']
                        [value];
              },
            ),
            CustomRadioTile(
              title: 'Condition:',
              values: const ['OK', 'Missing'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'How Many'),
            CustomRadioTile(
              title: 'Is there a visual and audible alerting system:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Intermediate Landing Comments:'),
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
