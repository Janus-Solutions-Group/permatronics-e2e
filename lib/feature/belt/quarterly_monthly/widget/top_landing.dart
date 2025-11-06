import 'package:flutter/material.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../../../common/widgets/page_navigation_button.dart';
import '../../model/belt_inspection_model.dart';
import '../pages/belt_quaterly.dart';

class TopLanding extends StatelessWidget {
  const TopLanding(
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
            const FormHeaderTitle(title: "TOP LANDING#"),
            CustomRadioTile(
              id: 'top_landing_1',
              title: '"Authorized Personnel Only" Sign: (2" letters)',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {
                beltModel.topLandingAuthorizedPersonnelSign =
                    jsonData['top_landing_authorizedpersonnelsign'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_2',
              title: 'Instruction Sign: (1" letters)',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {
                beltModel.topLandingInstructionSign =
                    jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_3',
              title: '"TOP FLOOR - GET OFF" Sign: (2" letters)',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {
                //  beltModel. =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_4',
              title: 'Location',
              values: const ["Below Landing", "Above Landing"],
              onChangeValue: (value) {
                //  beltModel.toplandingloca =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_5',
              title: "Red Warning Light:",
              values: const ['Yes', 'No', 'Inoperable'],
              onChangeValue: (value) {
                //  beltModel.topLandingInstructionSign =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_6',
              title: "Location",
              values: const ["Below Landing", "Above Landing"],
              onChangeValue: (value) {
                //  beltModel.toplandin =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_7',
              title: 'Maze:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                 beltModel.topLandingMaze =
                    jsonData['top_landing_maze'][value];
              },
               conditionalBuilder: (selected) {
                if (selected == 'yes') {
                  return CustomTextField(
                    id: 'top_landing_8',
                    title: 'Description',
                  );
                } else if (selected == 'no') {
                  return Column(
                    children: [
                      CustomRadioTile(
                       id: 'top_landing_9',
                        title: 'Self Closing Gate:',
                        values: const ['1', '2', '3', '4'],
                        onChangeValue: (value) {

                          beltModel.topLandingInstructionSign =
                              jsonData['top_landing_instructionsign'][value];
                        },
                      ),
                      CustomRadioTile(
                       id: 'top_landing_10',
                        title: 'Open Outward:',
                        values: const ['Yes', 'No'],
                        onChangeValue: (value) {

                          beltModel.topLandingOpenOutward =
                              jsonData['top_landing_openoutward'][value];
                        },
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomRadioTile(
              id: 'top_landing_11',
              title: 'Toeboard:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.topLandingToeboard =
                    jsonData['top_landing_toeboard'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_12',
              title: 'Add\'l Toeboard Required:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.topLandingAddlToeboard =
                    jsonData['top_landing_addltoeboardrequired'][value];
              },
            ),
            CustomTextField(
              id: 'top_landing_13',
              title: 'Length',
            ),
            CustomRadioTile(
              id: 'top_landing_14',
              title: 'Toeboard Material:',
              values: const ['Steel', 'Raised Concrete', 'Other'],
              onChangeValue: (value) {
                //  beltModel. =
                //     jsonData['top_landing_instructionsign'][value];
              },
              conditionalBuilder: (selected) {
                if (selected == 'other') {
                  return CustomTextField(
                    id: "top_landing_14a",
                    title: 'Specify Other Material',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomTextField(
              id: 'top_landing_15',
              title: 'Toeboard Height:',
            ),
            CustomTextField(
              id: 'top_landing_16',
              title: 'Control Rope Diameter',
            ),
            CustomRadioTile(
              id: 'top_landing_17',
              title: 'Type:',
              values: const ['Wire Center Cable', 'Non-Compliant'],
              onChangeValue: (value) {
                //  beltModel.toplandingrope =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_18',
              title: 'Control Rope Condition:',
              values: const ['OK', 'Replace Damaged', 'Replace Worn'],
              onChangeValue: (value) {
                beltModel.topLandingConditionOfRopeGuides =
                    jsonData['top_landing_conditionofropeguides'][value];
              },
            ),
            CustomTextField(
              id: 'top_landing_19',
              title: 'Control Rope Fasteners',
            ),
            CustomRadioTile(
              id: 'top_landing_20',
              title: 'Pinch Clips:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                //  beltModel.toplandin =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_21',
              title: 'U-Bolts:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                //  beltModel. =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_22',
              title: 'Tape:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                //  beltModel.topLandingDistanceFromFloorOpeningToGuardRailDownSideBack =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_23',
              title: 'Tied:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                //  beltModel.tied =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_24',
              title: 'Guide Rail Type:',
              values: const ['Channel', 'Angle'],
              onChangeValue: (value) {
                //  beltModel.g =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_25',
              title: 'Guide Rail Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                "Bowed",
                "Grooved",
                "Replace Damaged",
                "Replace Worn"
              ],
              onChangeValue: (value) {
                //  beltModel.topLandingInstructionSign =
                //     jsonData['top_landing_instructionsign'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_26',
              title: 'Lighting:',
              values: const ['OK', 'Poor,'],
              onChangeValue: (value) {
                beltModel.topLandingLighting =
                    jsonData['top_landing_lighting'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_27',
              title: 'Is Landing Clean/Free of Obstructions:',
              values: const ['Yes', 'No,'],
              onChangeValue: (value) {
                beltModel.topLandingIsLandingClean =
                    jsonData['top_landing_islandingclean'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_28',
              title: 'Lateral Bracing:',
              values: const ['OK', 'Needs Additional'],
              onChangeValue: (value) {
                beltModel.topLandingLateralBracing =
                    jsonData['top_landing_lateralbracing'][value];
              },

              conditionalBuilder: (selected) {
                debugPrint('Selected value: $selected');
                if (selected == 'needs_additional') {
                  return CustomTextField(
                    id: "top_landing_28a",
                    title: 'Add Additional',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomRadioTile(
              id: 'top_landing_29',
              title: 'Check Attachment Bolts:',
              values: const [
                'Yes',
                'No',
              ],
              onChangeValue: (value) {
                beltModel.topLandingCheckAttachmentBolts =
                    jsonData['top_landing_checkattachmentbolts'][value];
              },
              conditionalBuilder: (selected) {
                if (selected == 'yes')  {
                  return Column(
                    children: [
                    CustomRadioTile(
                      id: 'top_landing_30',
                      title: 'Condition:',
                      values: const ['OK', 'Missing'],
                      onChangeValue: (value) {
                        //  beltModel.topLandingInstructionSign =
                        //     jsonData['top_landing_instructionsign'][value];
                      },
                    ),
                    CustomTextField(
                      id: 'top_landing_31',
                      title: 'How Many',
                    )
                  ],
                  );
                }
                return const SizedBox.shrink();
              },
            
            ),
            CustomTextField(
              id: 'top_landing_32',
              title: 'Top Landing Comments:',
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
