import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../../../common/widgets/page_navigation_button.dart';
import '../pages/belt_annual.dart';

class DriveAssembly extends StatefulWidget {
  const DriveAssembly(
      {super.key, required this.pageController, required this.beltModel});

  final PageController pageController;
  final BeltInspection beltModel;

  @override
  State<DriveAssembly> createState() => _DriveAssemblyState();
}

class _DriveAssemblyState extends State<DriveAssembly> {
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
            const FormHeaderTitle(title: "Drive Assembly#"),
            CustomRadioTile(
              id: "drive_assembly_annual_1",
              title: 'Head Circle Type:',
              values: const ['Cast', 'Bands', 'None'],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyHeadCircleType =
                    jsonData['drive_assembly_headcircletype'][value];
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_2",
              title: 'Circle Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace',
                'Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyCircleCondition =
                    jsonData['drive_assembly_circlecondition'][value];
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_3",
              title: 'Belt Tracking:',
              values: const ['OK', 'Off', 'Up', 'Down', 'Left', 'Right'],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyBeltTracking =
                    jsonData['drive_assembly_belttracking'][value];
              },
              conditionalBuilder: (selected) {
              if (selected == 'off') {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRadioTile(
                      id: "drive_assembly_annual_3_direction",
                      title: 'Direction:',
                      values: const ['Up', 'Down', 'Left', 'Right'],
                      onChangeValue: (value) {
                        // widget.beltModel.driveAssemblyBeltTrackingDirection = value;
                      },
                    ),
                    CustomTextField(
                      id: "drive_assembly_annual_3_inches_off",
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
              id: "drive_assembly_annual_4",
              title: 'Lagging Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace',
                'Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyLaggingCondition =
                    jsonData['drive_assembly_laggingcondition'][value];
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_5",
              title: 'Fastening Method:',
              values: const ['Bolt', 'Drive Screws'],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyFasteningMethod =
                    jsonData['drive_assembly_fasteningmethod'][value];
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_6",
              title: 'Head Shaft Bearing #:',
              values: const ['1', '2', '3', '4'],
              onChangeValue: (value) {
                // beltModel.driveAssemblyHeadShaftBearingNumber = value;
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_7",
              title: 'Type:',
              values: const ['Pillow Block', 'High Box'],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyHeadShaftBearingType =
                    jsonData['drive_assembly_headshaftbearing']['type'][value];
              },
            ),
            CustomTextField(
              id: "drive_assembly_annual_8",
              title: 'Head Shaft Bearing Size:',
              onChanged: (value) {
                widget.beltModel.driveAssemblyHeadShaftBearingSize = value;
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_9",
              title: 'Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Dry',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                // beltModel.driveAssemblyShaftCondition = jsonData['drive_assembly_shaftcondition'][value];
              },
            ),
            CustomTextField(
              id: "drive_assembly_annual_10",
              title: 'Head Shaft Diameter:',
              onChanged: (value) {
                widget.beltModel.driveAssemblyHeadShaftDiameter = value;
              },
            ),
            CustomTextField(
              id: "drive_assembly_annual_11",
              title: 'Head Shaft Length:',
              onChanged: (value) {
                widget.beltModel.driveAssemblyHeadShaftLength = value;
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_12",
              title: 'Key:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyKey =
                    jsonData['drive_assembly_key'][value];
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_13",
              title: 'Bushings:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyBushings =
                    jsonData['drive_assembly_bushings'][value];
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_14",
              title: 'Set Screws:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblySetScrews =
                    jsonData['drive_assembly_setscrews'][value];
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_15",
              title: 'Shaft Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyShaftCondition =
                    jsonData['drive_assembly_shaftcondition'][value];
              },
            ),

            CustomRadioTile(
              id: 'drive_assembly_annual_15a',
              title: 'Head Shaft Bearing Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn',
                'Dry'
              ],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyBearingCondition =
                    jsonData['drive_assembly_bearingcondition'][value];
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_16",
              title: 'Head Pulley Type:',
              values: const ['Spoked', 'Solid'],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyHeadPulleyType =
                    jsonData['drive_assembly_headpulleytype'][value];
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_17",
              title: 'Size:',
              values: const ['20"', '21"'],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyPulleySize =
                    jsonData['drive_assembly_pulleysize'][value];
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_18",
              title: 'Pulley Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyPulleyCondition =
                    jsonData['drive_assembly_pulleycondition'][value];
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_19",
              title: 'Is Head Pulley Centered:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyIsHeadPulleyCentered =
                    jsonData['drive_assembly_isheadpulleycentered'][value];
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_20",
              title: 'Level:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyIsHeadPulleyLevel =
                    jsonData['drive_assembly_isheadpulleylevel'][value];
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_21",
              title: 'Coupler Type:',
              values: const [
                'Old Style',
                'Flender',
                'High Speed',
                'David Brown',
                'Other'
              ],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyCouplerType =
                    jsonData['drive_assembly_couplertype'][value];
              },
              fieldValue: "other",
              onFieldChange: (value) {
                widget.beltModel.driveAssemblyCouplerType = value;
              },
               conditionalBuilder: (selected) {
                if (selected == 'other') {
                  return CustomTextField(
                    id: "drive_assembly_annual_21a",
                    title: 'Specify Other Type',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_22",
              title: 'Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Inserts',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyCouplerCondition =
                    jsonData['drive_assembly_couplercondition'][value];
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_23",
              title: 'Gear Box Type:',
              values: const ['Reliance', 'Dodge', 'Falk', 'Ehrsam', 'Other'],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyGearboxType =
                    jsonData['drive_assembly_gearboxtype'][value];
              },
              fieldValue: "other",
              onFieldChange: (value) {
                widget.beltModel.driveAssemblyGearboxType = value;
              },

               conditionalBuilder: (selected) {
                if (selected == 'other') {
                  return CustomTextField(
                    id: "drive_assembly_annual_23a",
                    title: 'Specify Other Type',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomTextField(
              id: "drive_assembly_annual_24",
              title: 'Gear Box ID#:',
              onChanged: (value) {
                widget.beltModel.driveAssemblyGearboxId = value;
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_15",
              title: 'Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Seal Leaks',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyGearboxCondition =
                    jsonData['drive_assembly_gearboxcondition'][value];
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_26",
              title: 'Motor Type:',
              values: const ['Reliance', 'Dodge', 'U.S. Motors', 'GE', 'Other'],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyMotorType =
                    jsonData['drive_assembly_motortype'][value];
              },
              fieldValue: "other",
              onFieldChange: (value) {
                widget.beltModel.driveAssemblyMotorType = value;
              },

               conditionalBuilder: (selected) {
                if (selected == 'other') {
                  return CustomTextField(
                    id: "drive_assembly_annual_26a",
                    title: 'Specify Other Type',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomTextField(
              id: "drive_assembly_annual_27",
              title: 'Motor ID#:',
              onChanged: (value) {
                widget.beltModel.driveAssemblyMotorId = value;
              },
            ),
            CustomTextField(
              id: "drive_assembly_annual_28",
              title: 'H.P.:',
              onChanged: (value) {
                widget.beltModel.driveAssemblyHp = value;
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_29",
              title: 'Voltage:',
              values: const ['208', '230/240', '460/480'],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyVoltage =
                    jsonData['drive_assembly_voltage'][value];
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_30",
              title: 'Brake:',
              values: const [
                'Reliance',
                'Dodge',
                'Dings',
                'Sterns',
                'Band/Clamp Type',
                'Other'
              ],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyBrakeType =
                    jsonData['drive_assembly_braketype'][value];
              },
              fieldValue: "other",
              onFieldChange: (value) {
                widget.beltModel.driveAssemblyBrakeType = value;
              },

               conditionalBuilder: (selected) {
                if (selected == 'other') {
                  return CustomTextField(
                    id: "drive_assembly_annual_23a",
                    title: 'Specify Other',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomTextField(
              id: "drive_assembly_annual_31",
              title: 'Brake ID#:',
              onChanged: (value) {
                widget.beltModel.driveAssemblyBrakeId = value;
              },
            ),
            CustomTextField(
              id: "drive_assembly_annual_32",
              title: 'FT. LBS.:',
              onChanged: (value) {
                widget.beltModel.driveAssemblyFtLbs = value;
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_33",
              title: 'Is there a Skip in the Drive:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyIsDriveSkip =
                    jsonData['drive_assembly_isdriveskip'][value];
              },

               conditionalBuilder: (selected) {
                if (selected == 'yes') {
                  return CustomRadioTile(
                    id: "drive_assembly_annual_34",
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
              id: "drive_assembly_annual_35",
              title: 'Saf-T-Stop Brake:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblySafTStopBrake =
                    jsonData['drive_assembly_braketype'][value];
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_36",
              title: 'Linkage:',
              values: const ['OK', 'Replace Damaged', 'Replace Worn'],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblySafTStopLinkage =
                    jsonData['drive_assembly_saftstoplinkage'][value];
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_37",
              title: 'Overall Saf-T-Stop Brake Condition:',
              values: const [
                'OK',
                'Monitor',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyOverallSafTStopCondition =
                    jsonData['drive_assembly_saftstoplinkage'][value];
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_38",
              title: 'Drive Unit Support Type:',
              values: const ['A-Frame', 'Beam'],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyDriveSupportType =
                    jsonData['drive_assembly_drivesupporttype'][value];
              },
            ),
            CustomRadioTile(
              id: "drive_assembly_annual_39",
              title: 'Drive Unit Support Condition:',
              values: const ['OK', 'Other'],
              onChangeValue: (value) {
                // beltModel.driveAssemblyOverallSafTStopCondition =
                //     jsonData['drive_assembly_saftstoplinkage'][value];
              },
              
               conditionalBuilder: (selected) {
                if (selected == 'other') {
                  return CustomTextField(
                    id: "drive_assembly_annual_21a",
                    title: 'Specify Other',
                  );
                }
                return const SizedBox.shrink();
              },
              isTextField: true,
              fieldLabelTitle: "Other",
            ),
            CustomTextField(
              id: "drive_assembly_annual_40",
              title: 'Drive Comments:',
              onChanged: (value) {
                widget.beltModel.driveAssemblyDriveComments = value;
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
