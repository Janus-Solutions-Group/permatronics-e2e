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
              id: "top_landing_belt_annual_1",
              title: '"Authorized Personnel Only" Sign: (2" letters)',
              values: const ['Yes', 'No', 'Non-Compliant'],
              onChangeValue: (value) {
                widget.beltModel.topLandingAuthorizedPersonnelSign =
                    jsonData['top_landing_authorizedpersonnelsign'][value];
              },
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_2",
              title: 'Instruction Sign: (1" letters)',
              values: const ['Yes', 'No', 'Non-Compliant'],
              onChangeValue: (value) {
                widget.beltModel.topLandingInstructionSign =
                    jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_3",
              title: '"TOP FLOOR - GET OFF" Sign: (2" letters)',
              values: const ['Yes', 'No', 'Non-Compliant'],
              onChangeValue: (value) {
                // beltModel.top =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_4",
              title: 'Location:',
              values: const ['Below Landing', 'Above Landing'],
              onChangeValue: (value) {
                // beltModel.floor =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_5",
              title: 'Within 24" of Ceiling:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                // beltModel.w =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomTextField(
              id: "top_landing_belt_annual_5",
              title: 'Size of Letters:',
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_6",
              title: 'Red Warning Light:',
              values: const ['Yes', 'No', 'Inoperable'],
              onChangeValue: (value) {
                // beltModel.redlight =
                //     jsonData['top_landing_instructionsign'][value]; 
              },
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_7",
              title: 'Location:',
              values: const ['Below Landing', 'Above Landing'],
              onChangeValue: (value) {
                // beltModel. =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_8",
              title: 'Floor Opening Shape:',
              values: const ['Circular', 'Square'],
              onChangeValue: (value) {
                widget.beltModel.topLandingFloorOpeningShape =
                    jsonData['top_landing_flooropeningshape'][value];
              },
            ),
            CustomTextField(
                id: "top_landing_belt_annual_9", title: 'Thickness:'),
            CustomRadioTile(
              id: "top_landing_belt_annual_10",
              title: 'Material:',
              values: const ['Concrete', 'Steel', 'Other'],
              onChangeValue: (value) {},
            ),
            CustomTextField(
                id: "top_landing_belt_annual_11", title: 'Diameter "Upside":'),
            CustomTextField(
                id: "top_landing_belt_annual_12",
                title: 'Diameter "Downside":'),
            CustomTextField(
                id: "top_landing_belt_annual_13",
                title:
                    'Distance from Face of Belt to Back Edge of Floor Opening "Upside":'),
            CustomTextField(
                id: "top_landing_belt_annual_14",
                title:
                    'Distance from Face of Belt to Back Edge of Floor Opening "Downside":'),
            CustomRadioTile(
              id: "top_landing_belt_annual_15",
              title: 'Distance from Floor Opening to Guard Rail "Upside":',
              values: const ['Compliant', 'Non-Compliant'],
              onChangeValue: (value) {},
            ),
            DistanceTextField(
                id: "top_landing_belt_annual_16",
                title: 'Back',
                onChangeValue: (value) {}
            ),
            DistanceTextField(
                id: "top_landing_belt_annual_17",
                onChangeValue: (value) {},
                title: 'Left'),
            DistanceTextField(
                id: "top_landing_belt_annual_18",
                onChangeValue: (value) {},
                title: 'Right'),
            CustomRadioTile(
              id: "top_landing_belt_annual_19",
              title: 'Distance From Floor Opening to Guard Rail "Downside":',
              values: const ['Compliant', 'Non-Compliant'],
              onChangeValue: (value) {},
            ),
            DistanceTextField(id: "top_landing_belt_annual_20", title: 'Back',
                onChangeValue: (value) {},),
            DistanceTextField(id: "top_landing_belt_annual_21", title: 'Left',
                onChangeValue: (value) {},),
            DistanceTextField(id: "top_landing_belt_annual_22", title: 'Right',
                onChangeValue: (value) {},),
            CustomTextField(
                id: "top_landing_belt_annual_23",
                title: 'Guard Rail Height "Upside":',),
            CustomTextField(
                id: "top_landing_belt_annual_24",
                title: 'Guard Rail Height "Downside":'),
            CustomRadioTile(
              id: "top_landing_belt_annual_25",
              title: 'Guard Rail Material Used:',
              values: const ['Angle', 'Square Tubing', 'Round Tubing', 'Wood'],
              onChangeValue: (value) {
                // beltModel.guardrailmater =
                // jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_26",
              title: 'Maze:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                 widget.beltModel.topLandingMaze =
                    jsonData['top_landing_maze'][value];
              },
               conditionalBuilder: (selected) {
                if (selected == 'Yes') {
                  return CustomTextField(
                    id: 'top_landing_belt_annual_27',
                    title: 'Description',
                  );
                } else if (selected == 'No') {
                  return Column(
                    children: [
                      CustomRadioTile(
                       id: 'top_landing_belt_annual_28',
                        title: 'Self Closing Gate:',
                        values: const ['1', '2', '3', '4'],
                        onChangeValue: (value) {

                          widget.beltModel.topLandingInstructionSign =
                              jsonData['top_landing_instructionsign'][value];
                        },
                      ),
                      CustomRadioTile(
                       id: 'top_landing_belt_annual_30',
                        title: 'Open Outward:',
                        values: const ['Yes', 'No'],
                        onChangeValue: (value) {

                          widget.beltModel.topLandingOpenOutward =
                              jsonData['top_landing_openoutward'][value];
                        },
                      ),
                      CustomRadioTile(
                        id: "top_landing_belt_annual_31",
                        title: 'Are Gates Missing:',
                        values: const ['Yes', 'No'],
                        onChangeValue: (value) {
                          widget.beltModel.topLandingAreGatesMissing =
                              jsonData['top_landing_aregatesmissing'][value];
                        },
                      ),
                      CustomTextField(
                          id: "top_landing_belt_annual_32", title: 'How Many:'),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_33",
              title: 'Toeboard:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.topLandingToeboard =
                    jsonData['top_landing_toeboard'][value];
              },
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_34",
              title: 'Add\'l Toeboard Required:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.topLandingAddlToeboard =
                    jsonData['top_landing_addltoeboardrequired'][value];
              },
            ),
            CustomTextField(id: "top_landing_belt_annual_35", title: 'Length:'),
            CustomRadioTile(
              id: "top_landing_belt_annual_36",
              title: 'Toeboard Material:',
              values: const ['Steel', 'Raised Concrete', 'Other'],
              onChangeValue: (value) {
                // beltModel.toeboard =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomTextField(
                id: "top_landing_belt_annual_37", title: 'Toeboard Height:'),
            CustomTextField(
                id: "top_landing_belt_annual_38",
                title: 'Control Rope Diameter:'),
            CustomRadioTile(
              id: "top_landing_belt_annual_39",
              title: 'Type:',
              values: const ['Wire Center', 'Cable', 'Non-Compliant'],
              onChangeValue: (value) {
                // beltModel.type =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_40",
              title: 'Condition:',
              values: const ['OK', 'Replace Damaged', 'Replace Worn'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_41",
              title: 'Control Rope Fasteners:',
              values: const ['Pinch Clips', 'U-Bolts', 'Tape', 'Tied'],
              onChangeValue: (value) {
                // beltModel.control =
                //     jsonData['control'][value];
              },
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_42",
              title: 'Facing the "UP" Travel, is Rope on the:',
              values: const ['Left', 'Right'],
              onChangeValue: (value) {
                // beltModel.facing =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
          const  CustomTextField(
                id: "top_landing_belt_annual_43",
                title: 'C/L of Head Shaft to Floor:'),
          const  CustomTextField(
                id: "top_landing_belt_annual_44",
                title: 'C/L of Head Shaft to Ceiling/Obstruction:'),
           const DistanceTextField(
                id: "top_landing_belt_annual_45",
                title: 'Measurement from Top of this Floor to Top of Floor#'),
            CustomRadioTile(
              id: "top_landing_belt_annual_46",
              title: 'Guide Rail Type:',
              values: const ['Channel', 'Angle'],
              onChangeValue: (value) {
                // beltModel.guardrailtyp =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_47",
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
                id: "top_landing_belt_annual_48",
                title: 'OS-OS Rail Measurement @ Frame Brace Facing Belt:'),
            CustomTextField(
                id: "top_landing_belt_annual_49",
                title: 'OS-OS Rail Measurement @ Frame Brace Facing Side:'),
            CustomRadioTile(
              id: "top_landing_belt_annual_50",
              title: 'Ladder Rungs:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.topLandingLadderRungs =
                    jsonData['top_landing_ladderrungs'][value];
              },
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_51",
              title: 'Rung Attachment:',
              values: const ['Bolted', 'Welded'],
              onChangeValue: (value) {
                // beltModel.rung =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_52",
              title: 'Condition:',
              values: const ['OK', 'Replace Damaged'],
              onChangeValue: (value) {},
            ),
            const CustomTextField(
                id: "top_landing_belt_annual_53", title: 'How Many:'),
            CustomRadioTile(
              id: "top_landing_belt_annual_54",
              title: 'Distance Between:',
              values: const ['12"', 'Other'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_55",
              title: 'Facing "UP" Travel Side, are the Ladder Rungs on:',
              values: const ['Left', 'Right'],
              onChangeValue: (value) {},
            ),
            CustomTextField(
                id: "top_landing_belt_annual_56",
                title: 'Distance From C/L of Head Shaft to Bottom Floor:'),
            CustomRadioTile(
              id: "top_landing_belt_annual_57",
              title: 'Does Manlift have a work platform:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_58",
              title: 'Is there an under-floor hood below the work platform:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_59",
              title: 'Type of Hood:',
              values: const ['Stationary', 'Moveable', 'Moveable Mini'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_60",
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
              id: "top_landing_belt_annual_61",
              title: 'Hood Clearance: (Minimum 7\'6")',
              values: const ['OK', 'Non-Compliant'],
              onChangeValue: (value) {
                widget.beltModel.topLandingHoodClearance =
                    jsonData['top_landing_hoodclearance'][value];
              },
            ),
            CustomTextField(
                id: "top_landing_belt_annual_62",
                title: 'If Stationary, Distance from Face of Belt:'),
            CustomTextField(
                id: "top_landing_belt_annual_63", title: 'Angle of Slope: °'),
            CustomRadioTile(
              id: "top_landing_belt_annual_64",
              title: 'Shape:',
              values: const ['Circular', 'Square'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_65",
              title: 'If Moveable, What Type of Switch:',
              values: const ['Mercury', 'Micro-Switch'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_66",
              title: 'Location of Hinges:',
              values: const ['6"', 'More than 6" with Obstruction', 'Other'],
              onChangeValue: (value) {},

              conditionalBuilder: (selected) {
                if (selected == 'other') {
                  return CustomTextField(
                    id: "top_landing_belt_annual_66a",
                    title: 'Specify Other',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_67",
              title: 'Counterweighted:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(
                id: "top_landing_belt_annual_68",
                title: 'Measurement From Top of This Floor to Top of Floor #:'),
            CustomRadioTile(
              id: "top_landing_belt_annual_69",
              title: 'Does Hood Have a Rolled Edge:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.topLandingDoesHoodHaveRolledEdge =
                    jsonData['top_landing_doeshoodhaverollededge'][value];
              },
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_70",
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
              id: "top_landing_belt_annual_71",
              title: 'Rope Guide Type:',
              values: ['Humphrey'],
              onChangeValue: (value) {},
            ),
            CustomTextField(
                id: "top_landing_belt_annual_72",
                title: 'Distance Between Rope Guides:'),
            CustomRadioTile(
              id: "top_landing_belt_annual_73",
              title: 'Rope Guide Condition:',
              values: const ['OK', 'Replace Damaged', 'Replace Worn'],
              onChangeValue: (value) {
                widget.beltModel.topLandingConditionOfRopeGuides =
                    jsonData['top_landing_conditionofropeguides'][value];
              },
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_74",
              title: 'Need Add\'l:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.topLandingNeedAddlRopeGuides =
                    jsonData['top_landing_needaddlropeguides'][value];
              },
            ),
            CustomTextField(
                id: "top_landing_belt_annual_75", title: 'How Many:'),
            CustomTextField(
                id: "top_landing_belt_annual_76",
                title: 'Measurement From Top of This Floor to Top of Floor #:'),
            CustomRadioTile(
              id: "top_landing_belt_annual_77",
              title: 'Lighting:',
              values: const ['OK', 'Poor'],
              onChangeValue: (value) {
                widget.beltModel.topLandingLighting =
                    jsonData['top_landing_lighting'][value];
              },
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_78",
              title: 'Is Landing Clean/Free of Obstructions:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.topLandingIsLandingClean =
                    jsonData['top_landing_islandingclean'][value];
              },
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_79",
              title: 'Lateral Bracing:',
              values: const ['OK', 'Needs Add\'l'],
              onChangeValue: (value) {
                widget.beltModel.topLandingLateralBracing =
                    jsonData['top_landing_lateralbracing'][value];
              },
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_80",
              title: 'Check Attachment Bolts:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.topLandingCheckAttachmentBolts =
                    jsonData['top_landing_checkattachmentbolts'][value];
              },
            ),
            CustomRadioTile(
              id: "top_landing_belt_annual_81",
              title: 'Attachment Bolts Condition:',
              values: ['OK', 'Missing'],
              onChangeValue: (value) {
                // beltModel.attach =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomTextField(
                id: "top_landing_belt_annual_82", title: 'How Many:'),
            CustomRadioTile(
              id: "top_landing_belt_annual_83",
              title: 'Is there a visual and audible alerting system:',
              values: ['Yes', 'No'],
              onChangeValue: (value) {},
            ),
            CustomTextField(
                id: "top_landing_belt_annual_82",
                title: 'Top Landing Comments:'),
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
