import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';

import '../../../common/widgets/custom_textfield.dart';
import '../../../common/widgets/form_header.dart';
import '../../../common/widgets/page_navigation_button.dart';
import '../../../common/widgets/radio_tile.dart';
import '../pages/belt_quaterly.dart';

class DriveAssembly extends StatelessWidget {
  const DriveAssembly(
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
            const FormHeaderTitle(title: "Drive Assembly"),
            CustomRadioTile(
              id: 'drive_assembly_1',
              title: 'Head Circle Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.driveAssemblyCircleCondition =
                    jsonData['drive_assembly_circlecondition'][value];
              },
            ),
            CustomRadioTile(
              id: 'drive_assembly_2',
              title: 'Belt Tracking:',
              values: const ['OK', 'Off'],
              onChangeValue: (value) {
                beltModel.driveAssemblyBeltTracking =
                    jsonData['drive_assembly_belttracking'][value];
              },
              conditionalBuilder: (selected) {
                if (selected == 'off') {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRadioTile(
                        id: "drive_assembly_2a",
                        title: 'Direction:',
                        values: const ['Up', 'Down', 'Left', 'Right'],
                        onChangeValue: (value) {
                          // widget.beltModel.driveAssemblyBeltTrackingDirection = value;
                        },
                      ),
                      CustomTextField(
                        id: "drive_assembly_2b",
                        title: 'Inches Off:',
                        onChanged: (value) {
                          // widget.beltModel.driveAssemblyBeltTrackingInchesOff = value;
                        },
                      ),
                    ],
                  );
                }

                // Default fallback when condition not met
                return const SizedBox.shrink();
              },
              
            ),
            CustomRadioTile(
              id: 'drive_assembly_3',
              title: 'Lagging Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.driveAssemblyLaggingCondition =
                    jsonData['drive_assembly_laggingcondition'][value];
              },
            ),
            CustomRadioTile(
              id: 'drive_assembly_4',
              title: 'Head Shaft Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.driveAssemblyShaftCondition =
                    jsonData['drive_assembly_shaftcondition'][value];
              },
            ),
            CustomRadioTile(
              id: 'drive_assembly_4a',
              title: 'Head Shaft Bearing Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn',
                'Dry'
              ],
              onChangeValue: (value) {
                beltModel.driveAssemblyBearingCondition =
                    jsonData['drive_assembly_bearingcondition'][value];
              },
            ),
            CustomRadioTile(
              id: 'drive_assembly_5',
              title: 'Head Pulley Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.driveAssemblyPulleyCondition =
                    jsonData['drive_assembly_pulleycondition'][value];
              },
            ),
            CustomRadioTile(
              id: 'drive_assembly_6',
              title: 'Is Head Pulley Centered:',
              values: const ['YES', 'NO'],
              onChangeValue: (value) {
                beltModel.driveAssemblyIsHeadPulleyCentered =
                    jsonData['drive_assembly_isheadpulleycentered'][value];
              },
            ),
            CustomRadioTile(
              id: 'drive_assembly_7',
              title: 'Is Head Pulley Level:',
              values: const ['YES', 'NO'],
              onChangeValue: (value) {
                beltModel.driveAssemblyIsHeadPulleyLevel =
                    jsonData['drive_assembly_isheadpulleylevel'][value];
              },
            ),
            CustomRadioTile(
              id: 'drive_assembly_8',
              title: 'Coupler Type',
              values: const [
                'Old Style',
                'Flender',
                'High Speed',
                'David Brown',
                'Other'
              ],
              isTextField: true,
              fieldLabelTitle: 'Other',
              onChangeValue: (value) {
                beltModel.driveAssemblyCouplerType =
                    jsonData['drive_assembly_couplertype'][value];
              },

               conditionalBuilder: (selected) {
                if (selected == 'other') {
                  return CustomTextField(
                    id: "drive_assembly_8a",
                    title: 'Specify Other Type',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomRadioTile(
              id: 'drive_assembly_9',
              title: 'Coupler Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.driveAssemblyCouplerCondition =
                    jsonData['drive_assembly_couplercondition'][value];
              },
            ),
            CustomRadioTile(
              id: 'drive_assembly_10',
              title: 'Gear Box Type',
              values: const ['Reliance', 'Dodge', 'Falk', 'Ehrsam', 'Other'],
              isTextField: true,
              fieldLabelTitle: 'Other',
              onChangeValue: (value) {
                beltModel.driveAssemblyGearboxType =
                    jsonData['drive_assembly_gearboxtype'][value];
              },

               conditionalBuilder: (selected) {
                if (selected == 'other') {
                  return CustomTextField(
                    id: "drive_assembly_10a",
                    title: 'Specify Other Type',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomRadioTile(
              id: 'drive_assembly_11',
              title: 'Gear Box Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.driveAssemblyGearboxCondition =
                    jsonData['drive_assembly_gearboxcondition'][value];
              },
            ),
            CustomRadioTile(
              id: 'drive_assembly_12',
              title: 'Motor Type',
              values: const ['Reliance', 'Dodge', 'US Motors', 'GE', 'Other'],
              isTextField: true,
              fieldLabelTitle: 'Other',
              onChangeValue: (value) {
                beltModel.driveAssemblyMotorType =
                    jsonData['drive_assembly_motortype'][value];
              },

               conditionalBuilder: (selected) {
                if (selected == 'other') {
                  return CustomTextField(
                    id: "drive_assembly_12a",
                    title: 'Specify Other Type',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomRadioTile(
              id: 'drive_assembly_13',
              title: 'Brake',
              values: const [
                'Reliance',
                'Dodge',
                'Dings',
                'Sterns',
                'Band/Clamp Type',
                'Other'
              ],
              isTextField: true,
              fieldLabelTitle: 'Other',
              onChangeValue: (value) {
                beltModel.driveAssemblyBrakeType =
                    jsonData['drive_assembly_braketype'][value];
              },

               conditionalBuilder: (selected) {
                if (selected == 'other') {
                  return CustomTextField(
                    id: "drive_assembly_13a",
                    title: 'Specify Other',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomRadioTile(
              id: 'drive_assembly_14',
              title: 'Is there a Skip in the Drive',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.driveAssemblyIsDriveSkip =
                    jsonData['drive_assembly_isdriveskip'][value];
              },
              
               conditionalBuilder: (selected) {
                if (selected == 'yes') {
                  return CustomRadioTile(
                    id: "drive_assembly_14a",
                    title: 'Skip reason',
                    values: const [
                      'Coupler Play',
                      'Worn Gearbox',
                      'Key Way',
                      'Loose Set Screws'
                    ],
                    onChangeValue: (value) {
                    },
                  );
                }
                return const SizedBox.shrink();
              },
       
            ),
            CustomRadioTile(
              id: 'drive_assembly_15',
              title: 'Reason',
              values: const [
                'Coupler Play',
                'Worn Gearbox',
                'Key Way',
                'Loose Set Screws'
              ],
              onChangeValue: (value) {
                beltModel.driveAssemblySkipReason =
                    jsonData['drive_assembly_skipreason'][value];
              },
            ),
            CustomRadioTile(
              id: 'drive_assembly_16',
              title: 'Saf-T-Stop Brake',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.driveAssemblySafTStopBrake =
                    jsonData['drive_assembly_saftstopbrake'][value];
              },
            ),
            CustomRadioTile(
              id: 'drive_assembly_17',
              title: 'Linkage',
              values: const ['OK', 'Replace Damaged', 'Replace Worn'],
              onChangeValue: (value) {
                beltModel.driveAssemblySafTStopLinkage =
                    jsonData['drive_assembly_saftstoplinkage'][value];
              },
            ),
            CustomRadioTile(
              id: 'drive_assembly_18',
              title:
                  'Overall Saf-T-Stop Brake Condition: (i.e. micro switch arms, castings etc.)',
              values: const [
                'OK',
                'Monitor',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.driveAssemblyOverallSafTStopCondition =
                    jsonData['drive_assembly_overallsaftstopcondition'][value];
              },
            ),
            CustomRadioTile(
              id: 'drive_assembly_19',
              title: 'Drive Unit Support Type',
              values: const ['A-Frame', 'Beam'],
              onChangeValue: (value) {
                beltModel.driveAssemblyDriveSupportType =
                    jsonData['drive_assembly_drivesupporttype'][value];
              },
            ),
            CustomRadioTile(
              id: 'drive_assembly_20',
              title: 'Drive Unit Support Condition',
              values: const ['OK', 'Other'],
              onChangeValue: (value) {
                // beltModel.drivesup = value;
              },

               conditionalBuilder: (selected) {
                if (selected == 'other') {
                  return CustomTextField(
                    id: "drive_assembly_20a",
                    title: 'Specify Other',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomTextField(
              id: 'drive_assembly_21',
              title: 'Drive Comments:',
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
