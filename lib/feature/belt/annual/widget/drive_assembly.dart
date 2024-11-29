import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../../../common/widgets/page_navigation_button.dart';
import '../pages/belt_annual.dart';

class DriveAssembly extends StatelessWidget {
  const DriveAssembly(
      {super.key, required this.pageController, required this.beltModel});

  final PageController pageController;
  final BeltInspection beltModel;

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
            FormHeaderTitle(title: "Drive Assembly#"),
            CustomRadioTile(
              title: 'Head Circle Type:',
              values: const ['Cast', 'Bands', 'None'],
              onChangeValue: (value) {
                beltModel.driveAssemblyHeadCircleType =
                    jsonData['driveassembly_headcircletype'][value];
              },
            ),
            CustomRadioTile(
              title: 'Circle Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace',
                'Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.driveAssemblyCircleCondition =
                    jsonData['driveassembly_circlecondition'][value];
              },
            ),
            CustomRadioTile(
              title: 'Belt Tracking:',
              values: const ['OK', 'Off', '', '', '', ''],
              onChangeValue: (value) {
                beltModel.driveAssemblyBeltTracking =
                    jsonData['driveassembly_belttracking'][value];
              },
            ),
            CustomRadioTile(
              title: 'Lagging Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace',
                'Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.driveAssemblyLaggingCondition =
                    jsonData['driveassembly_laggingcondition'][value];
              },
            ),
            CustomRadioTile(
              title: 'Fastening Method:',
              values: const ['Bolt', 'Drive Screws'],
              onChangeValue: (value) {
                beltModel.driveAssemblyFasteningMethod =
                    jsonData['driveassembly_fasteningmethod'][value];
              },
            ),
            CustomRadioTile(
              title: 'Head Shaft Bearing #:',
              values: const ['1', '2', '3', '4'],
              onChangeValue: (value) {
                // beltModel.driveAssemblyHeadShaftBearingNumber = value;
              },
            ),
            CustomRadioTile(
              title: 'Type:',
              values: const ['Pillow Block', 'High Box'],
              onChangeValue: (value) {
                beltModel.driveAssemblyHeadShaftBearingType =
                    jsonData['driveassembly_headshaftbearing']['type'][value];
              },
            ),
            CustomTextField(title: 'Head Shaft Bearing Size:'),
            CustomRadioTile(
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
            CustomTextField(title: 'Head Shaft Diameter:'),
            CustomTextField(title: 'Head Shaft Length:'),
            CustomRadioTile(
              title: 'Key:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.driveAssemblyKey =
                    jsonData['driveassembly_key'][value];
              },
            ),
            CustomRadioTile(
              title: 'Bushings:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.driveAssemblyBushings =
                    jsonData['driveassembly_bushings'][value];
              },
            ),
            CustomRadioTile(
              title: 'Set Screws:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.driveAssemblySetScrews =
                    jsonData['driveassembly_setscrews'][value];
              },
            ),
            CustomRadioTile(
              title: 'Shaft Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.driveAssemblyShaftCondition =
                    jsonData['driveassembly_shaftcondition'][value];
              },
            ),
            CustomRadioTile(
              title: 'Head Pulley Type:',
              values: const ['Spoked', 'Solid'],
              onChangeValue: (value) {
                beltModel.driveAssemblyHeadPulleyType =
                    jsonData['driveassembly_headpulleytype'][value];
              },
            ),
            CustomRadioTile(
              title: 'Size:',
              values: const ['20”', '21”'],
              onChangeValue: (value) {
                beltModel.driveAssemblyPulleySize =
                    jsonData['driveassembly_pulleysize'][value];
              },
            ),
            CustomRadioTile(
              title: 'Pulley Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.driveAssemblyPulleyCondition =
                    jsonData['driveassembly_pulleycondition'][value];
              },
            ),
            CustomRadioTile(
              title: 'Is Head Pulley Centered:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.driveAssemblyIsHeadPulleyCentered =
                    jsonData['driveassembly_isheadpulleycentered'][value];
              },
            ),
            CustomRadioTile(
              title: 'Level:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.driveAssemblyIsHeadPulleyLevel =
                    jsonData['driveassembly_isheadpulleylevel'][value];
              },
            ),
            CustomRadioTile(
              title: 'Coupler Type:',
              values: const [
                'Old Style',
                'Flender',
                'High Speed',
                'David Brown',
                'Other'
              ],
              onChangeValue: (value) {
                beltModel.driveAssemblyCouplerType = value;
              },
              isTextField: true,
              fieldTitle: "Other",
            ),
            CustomRadioTile(
              title: 'Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Inserts',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.driveAssemblyCouplerCondition =
                    jsonData['driveassembly_couplercondition'][value];
              },
            ),
            CustomRadioTile(
              title: 'Gear Box Type:',
              values: const ['Reliance', 'Dodge', 'Falk', 'Ehrsam', 'Other'],
              onChangeValue: (value) {
                beltModel.driveAssemblyGearboxType =
                    jsonData['drive_assembly_gearboxtype'][value];
              },
              isTextField: true,
              fieldTitle: "Other",
            ),
            CustomTextField(title: 'Gear Box ID#:'),
            CustomRadioTile(
              title: 'Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Seal Leaks',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.driveAssemblyGearboxCondition =
                    jsonData['driveassembly_gearboxcondition'][value];
              },
            ),
            CustomRadioTile(
              title: 'Motor Type:',
              values: const ['Reliance', 'Dodge', 'U.S. Motors', 'GE', 'Other'],
              onChangeValue: (value) {
                beltModel.driveAssemblyMotorType =
                    jsonData['drive_assembly_motortype'][value];
              },
            ),
            CustomTextField(title: 'Motor ID#:'),
            CustomTextField(title: 'H.P.:'),
            CustomRadioTile(
              title: 'Voltage:',
              values: const ['208', '230/240', '460/480'],
              onChangeValue: (value) {
                beltModel.driveAssemblyVoltage =
                    jsonData['drive_assembly_voltage'][value];
              },
            ),
            CustomRadioTile(
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
                beltModel.driveAssemblyBrakeType =
                    jsonData['drive_assembly_braketype'][value];
              },
              isTextField: true,
              fieldTitle: "Other",
            ),
            CustomTextField(title: 'Brake ID#:'),
            CustomTextField(title: 'FT. LBS.:'),
            CustomRadioTile(
              title: 'Is there a Skip in the Drive:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.driveAssemblyIsDriveSkip =
                    jsonData['drive_assembly_isdriveskip'][value];
              },
            ),
            CustomTextField(
              title:
                  'Reason: Coupler Play Worn Gearbox Key Way Loose Set Screws',
            ),
            CustomRadioTile(
              title: 'Saf-T-Stop Brake:',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.driveAssemblySafTStopBrake =
                    jsonData['drive_assembly_braketype'][value];
              },
            ),
            CustomRadioTile(
              title: 'Linkage:',
              values: const ['OK', 'Replace Damaged', 'Replace Worn'],
              onChangeValue: (value) {
                beltModel.driveAssemblySafTStopLinkage =
                    jsonData['drive_assembly_saftstoplinkage'][value];
              },
            ),
            CustomRadioTile(
              title: 'Overall Saf-T-Stop Brake Condition:',
              values: const [
                'OK',
                'Monitor',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.driveAssemblyOverallSafTStopCondition =
                    jsonData['drive_assembly_saftstoplinkage'][value];
              },
            ),
            CustomRadioTile(
              title: 'Drive Unit Support Type:',
              values: const ['A-Frame', 'Beam'],
              onChangeValue: (value) {
                beltModel.driveAssemblyDriveSupportType =
                    jsonData['drive_assembly_drivesupporttype'][value];
              },
            ),
            CustomRadioTile(
              title: 'Drive Unit Support Condition:',
              values: const ['OK', 'Other'],
              onChangeValue: (value) {
                // beltModel.driveAssemblyOverallSafTStopCondition =
                //     jsonData['drive_assembly_saftstoplinkage'][value];
              },
              isTextField: true,
              fieldTitle: "Other",
            ),
            CustomTextField(title: 'Drive Comments:'),
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
