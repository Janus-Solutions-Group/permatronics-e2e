import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/annual/widget/bottom_landing.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../../../common/widgets/page_navigation_button.dart';
import '../pages/belt_annual.dart';

class TopLanding extends StatefulWidget {
  const TopLanding(
      {super.key, required this.pageController, required this.beltModel});

  final PageController pageController;
  final BeltInspection beltModel;

  @override
  State<TopLanding> createState() => _TopLandingState();
}

class _TopLandingState extends State<TopLanding> {
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
            const FormHeaderTitle(title: "TOP LANDING#"),
            CustomRadioTile(
              title: '“Authorized Personnel Only” Sign: (2” letters)',
              values: const ['Yes', 'No', 'Non-Compliant'],
              onChangeValue: (value) {
                widget.beltModel.topLandingAuthorizedPersonnelSign =
                    jsonData['top_landing_authorizedpersonnelsign'][value];
              },
            ),
            CustomRadioTile(
              title: 'Instruction Sign: (1” letters)',
              values: const ['Yes', 'No', 'Non-Compliant'],
              onChangeValue: (value) {
                widget.beltModel.topLandingInstructionSign =
                    jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: '“TOP FLOOR – GET OFF” Sign: (2” letters)',
              values: const ['Yes', 'No', 'Non-Compliant'],
              onChangeValue: (value) {
                // beltModel.top =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: 'Location:',
              values: const ['Below Landing', 'Above Landing'],
              onChangeValue: (value) {
                // beltModel.floor =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: 'Within 24” of Ceiling:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                // beltModel.w =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomTextField(title: 'Size of Letters:'),
            CustomRadioTile(
              title: 'Red Warning Light:',
              values: const ['Yes', 'No', 'Inoperable'],
              onChangeValue: (value) {
                // beltModel.redlight =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: 'Location:',
              values: const ['Below Landing', 'Above Landing'],
              onChangeValue: (value) {
                // beltModel. =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: 'Floor Opening Shape:',
              values: const ['Circular', 'Square'],
              onChangeValue: (value) {
                widget.beltModel.topLandingFloorOpeningShape =
                    jsonData['top_landing_flooropeningshape'][value];
              },
            ),
            CustomTextField(title: 'Thickness:'),
            CustomRadioTile(
              title: 'Material:',
              values: const ['Concrete', 'Steel', 'Other'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Diameter “Upside”:'),
            CustomTextField(title: 'Diameter “Downside”:'),
            CustomTextField(
                title:
                    'Distance from Face of Belt to Back Edge of Floor Opening “Upside”:'),
            CustomTextField(
                title:
                    'Distance from Face of Belt to Back Edge of Floor Opening “Downside”:'),
            CustomRadioTile(
              title: 'Distance from Floor Opening to Guard Rail “Upside”:',
              values: const ['Compliant', 'Non-Compliant'],
              onChangeValue: (value) {},
            ),
            DistanceTextField(title: 'Back'),
            DistanceTextField(title: 'Left'),
            DistanceTextField(title: 'Right'),
            CustomRadioTile(
              title: 'Distance From Floor Opening to Guard Rail “Downside”:',
              values: ['Compliant', 'Non-Compliant'],
              onChangeValue: (value) {},
            ),
            DistanceTextField(title: 'Back'),
            DistanceTextField(title: 'Left'),
            DistanceTextField(title: 'Right'),
            CustomTextField(title: 'Guard Rail Height “Upside”:'),
            CustomTextField(title: 'Guard Rail Height “Downside”:'),
            CustomRadioTile(
              title: 'Guard Rail Material Used:',
              values: const ['Angle', 'Square Tubing', 'Round Tubing', 'Wood'],
              onChangeValue: (value) {
                // beltModel.guardrailmater =
                // jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: 'Maze:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.topLandingMaze =
                    jsonData['top_landing_maze'][value];
              },
            ),
            CustomTextField(title: 'Description:'),
            CustomRadioTile(
              title: 'Self-Closing Gate:',
              values: const ['1', '2', '3', '4'],
              onChangeValue: (value) {
                // --values are diffe... in json
                // beltModel.topLandingSelfClosingGates =
                //     jsonData['top_landing_selfclosinggates'][value];
              },
            ),
            CustomRadioTile(
              title: 'Are Gates Self-Closing:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.topLandingAreGatesSelfClosing =
                    jsonData['top_landing_aregatesselfclosing'][value];
              },
            ),
            CustomRadioTile(
              title: 'Open Outward:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.topLandingOpenOutward =
                    jsonData['top_landing_openoutward'][value];
              },
            ),
            CustomRadioTile(
              title: 'Are Gates Missing:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.topLandingAreGatesMissing =
                    jsonData['top_landing_aregatesmissing'][value];
              },
            ),
            CustomTextField(title: 'How Many:'),
            CustomRadioTile(
              title: 'Toeboard:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.topLandingToeboard =
                    jsonData['top_landing_toeboard'][value];
              },
            ),
            CustomRadioTile(
              title: 'Add’l Toeboard Required:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.topLandingAddlToeboard =
                    jsonData['top_landing_addltoeboardrequired'][value];
              },
            ),
            CustomTextField(title: 'Length:'),
            CustomRadioTile(
              title: 'Toeboard Material:',
              values: const ['Steel', 'Raised Concrete', 'Other'],
              onChangeValue: (value) {
                // beltModel.toeboard =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomTextField(title: 'Toeboard Height:'),
            CustomTextField(title: 'Control Rope Diameter:'),
            CustomRadioTile(
              title: 'Type:',
              values: const ['Wire Center', 'Cable', 'Non-Compliant'],
              onChangeValue: (value) {
                // beltModel.type =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: 'Condition:',
              values: const ['OK', 'Replace Damaged', 'Replace Worn'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Control Rope Fasteners:',
              values: const ['Pinch Clips', 'U-Bolts', 'Tape', 'Tied'],
              onChangeValue: (value) {
                // beltModel.control =
                //     jsonData['control'][value];
              },
            ),
            CustomRadioTile(
              title: 'Facing the “UP” Travel, is Rope on the:',
              values: const ['Left', 'Right'],
              onChangeValue: (value) {
                // beltModel.facing =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomTextField(title: 'C/L of Head Shaft to Floor:'),
            CustomTextField(title: 'C/L of Head Shaft to Ceiling/Obstruction:'),
            DistanceTextField(
                title: 'Measurement from Top of this Floor to Top of Floor#'),
            CustomRadioTile(
              title: 'Guide Rail Type:',
              values: const ['Channel', 'Angle'],
              onChangeValue: (value) {
                // beltModel.guardrailtyp =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: 'Guard Rail Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Bowed',
                'Grooved',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {},
            ),
            CustomTextField(
                title: 'OS-OS Rail Measurement @ Frame Brace Facing Belt:'),
            CustomTextField(
                title: 'OS-OS Rail Measurement @ Frame Brace Facing Side:'),
            CustomRadioTile(
              title: 'Ladder Rungs:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.topLandingLadderRungs =
                    jsonData['top_landing_ladderrungs'][value];
              },
            ),
            CustomRadioTile(
              title: 'Rung Attachment:',
              values: const ['Bolted', 'Welded'],
              onChangeValue: (value) {
                // beltModel.rung =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              title: 'Condition:',
              values: const ['OK', 'Replace Damaged'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'How Many:'),
            CustomRadioTile(
              title: 'Distance Between:',
              values: const ['12”', 'Other'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Facing “Up” Travel Side, are the Ladder Rungs on:',
              values: const ['Left', 'Right'],
              onChangeValue: (value) {},
            ),
            CustomTextField(
                title: 'Distance From C/L of Head Shaft to Bottom Floor:'),
            CustomRadioTile(
              title: 'Does Manlift have a work platform:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Is there an under-floor hood below the work platform:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Type of Hood:',
              values: const ['Stationary', 'Moveable', 'Moveable Mini'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Hood Condition:',
              values: const [
                'OK',
                'Damaged, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                widget.beltModel.topLandingHoodCondition =
                    jsonData['top_landing_hoodcondition'][value];
              },
            ),
            CustomRadioTile(
              title: 'Hood Clearance: (Minimum 7’6”)',
              values: const ['OK', 'Non-Compliant'],
              onChangeValue: (value) {
                widget.beltModel.topLandingHoodClearance =
                    jsonData['top_landing_hoodclearance'][value];
              },
            ),
            CustomTextField(
                title: 'If Stationary, Distance from Face of Belt:'),
            CustomTextField(title: 'Angle of Slope: °'),
            CustomRadioTile(
              title: 'Shape:',
              values: const ['Circular', 'Square'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'If Moveable, What Type of Switch:',
              values: const ['Mercury', 'Micro-Switch'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Location of Hinges:',
              values: const ['6”', 'More than 6” with Obstruction', 'Other'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Counterweighted:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(
                title: 'Measurement From Top of This Floor to Top of Floor #:'),
            CustomRadioTile(
              title: 'Does Hood Have a Rolled Edge:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.topLandingDoesHoodHaveRolledEdge =
                    jsonData['top_landing_doeshoodhaverollededge'][value];
              },
            ),
            CustomRadioTile(
              title: 'Condition:',
              values: const [
                'OK',
                'Damaged, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                widget.beltModel.topLandingConditionOfRolledEdge =
                    jsonData['top_landing_conditionofrollededge'][value];
              },
            ),
            CustomRadioTile(
              title: 'Rope Guide Type:',
              values: ['Humphrey'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Distance Between Rope Guides:'),
            CustomRadioTile(
              title: 'Rope Guide Condition:',
              values: const ['OK', 'Replace Damaged', 'Replace Worn'],
              onChangeValue: (value) {
                widget.beltModel.topLandingConditionOfRopeGuides =
                    jsonData['top_landing_conditionofropeguides'][value];
              },
            ),
            CustomRadioTile(
              title: 'Need Add’l:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.topLandingNeedAddlRopeGuides =
                    jsonData['top_landing_needaddlropeguides'][value];
              },
            ),
            CustomTextField(title: 'How Many:'),
            CustomTextField(
                title: 'Measurement From Top of This Floor to Top of Floor #:'),
            CustomRadioTile(
              title: 'Lighting:',
              values: const ['OK', 'Poor'],
              onChangeValue: (value) {
                widget.beltModel.topLandingLighting =
                    jsonData['top_landing_lighting'][value];
              },
            ),
            CustomRadioTile(
              title: 'Is Landing Clean/Free of Obstructions:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.topLandingIsLandingClean =
                    jsonData['top_landing_islandingclean'][value];
              },
            ),
            CustomRadioTile(
              title: 'Lateral Bracing:',
              values: const ['OK', 'Needs Add’l'],
              onChangeValue: (value) {
                widget.beltModel.topLandingLateralBracing =
                    jsonData['top_landing_lateralbracing'][value];
              },
            ),
            CustomRadioTile(
              title: 'Check Attachment Bolts:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.topLandingCheckAttachmentBolts =
                    jsonData['top_landing_checkattachmentbolts'][value];
              },
            ),
            CustomRadioTile(
              title: 'Attachment Bolts Condition:',
              values: ['OK', 'Missing'],
              onChangeValue: (value) {
                // beltModel.attach =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomTextField(title: 'How Many:'),
            CustomRadioTile(
              title: 'Is there a visual and audible alerting system:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Top Landing Comments:'),
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
