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
            FormHeaderTitle(title: "Drive Assembly"),
            CustomRadioTile(
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
              title: 'Belt Tracking:',
              values: const ['OK', 'Off'],
              onChangeValue: (value) {
                beltModel.driveAssemblyBeltTracking =
                    jsonData['drive_assembly_belttracking'][value];
              },
            ),
            CustomRadioTile(
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
              title: 'Is Head Pulley Centered:',
              values: const ['YES', 'NO'],
              onChangeValue: (value) {
                beltModel.driveAssemblyIsHeadPulleyCentered =
                    jsonData['drive_assembly_isheadpulleycentered'][value];
              },
            ),
            CustomRadioTile(
              title: 'Is Head Pulley Level:',
              values: const ['YES', 'NO'],
              onChangeValue: (value) {
                beltModel.driveAssemblyIsHeadPulleyLevel =
                    jsonData['drive_assembly_isheadpulleylevel'][value];
              },
            ),
            CustomRadioTile(
              title: 'Coupler Type',
              values: const [
                'Old Style',
                'Flender',
                'High Speed',
                'David Brown',
                'Other'
              ],
              isTextField: true,
              fieldTitle: 'Other',
              onChangeValue: (value) {
                beltModel.driveAssemblyCouplerType =
                    jsonData['drive_assembly_couplertype'][value];
              },
            ),
            CustomRadioTile(
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
              title: 'Gear Box Type',
              values: const ['Reliance', 'Dodge', 'Falk', 'Ehrsam', 'Other'],
              isTextField: true,
              fieldTitle: 'Other',
              onChangeValue: (value) {
                beltModel.driveAssemblyGearboxType =
                    jsonData['drive_assembly_gearboxtype'][value];
              },
            ),
            CustomRadioTile(
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
              title: 'Motor Type',
              values: const ['Reliance', 'Dodge', 'US Motors', 'GE', 'Other'],
              isTextField: true,
              fieldTitle: 'Other',
              onChangeValue: (value) {
                beltModel.driveAssemblyMotorType =
                    jsonData['drive_assembly_motortype'][value];
              },
            ),
            CustomRadioTile(
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
              fieldTitle: 'Other',
              onChangeValue: (value) {
                beltModel.driveAssemblyBrakeType =
                    jsonData['drive_assembly_braketype'][value];
              },
            ),
            CustomRadioTile(
              title: 'Is there a Skip in the Drive',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.driveAssemblyIsDriveSkip =
                    jsonData['drive_assembly_isdriveskip'][value];
              },
            ),
            CustomRadioTile(
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
              title: 'Saf-T-Stop Brake',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.driveAssemblySafTStopBrake =
                    jsonData['drive_assembly_saftstopbrake'][value];
              },
            ),
            CustomRadioTile(
              title: 'Linkage',
              values: const ['OK', 'Replace Damaged', 'Replace Worn'],
              onChangeValue: (value) {
                beltModel.driveAssemblySafTStopLinkage =
                    jsonData['drive_assembly_saftstoplinkage'][value];
              },
            ),
            CustomRadioTile(
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
              title: 'Drive Unit Support Type',
              values: const ['A-Frame', 'Beam'],
              onChangeValue: (value) {
                beltModel.driveAssemblyDriveSupportType =
                    jsonData['drive_assembly_drivesupporttype'][value];
              },
            ),

            // not in the json -------

            CustomRadioTile(
              title: 'Drive Unit Support Condition',
              values: const ['OK', 'Other'],
              onChangeValue: (value) {
                // beltModel.drivesup = value;
              },
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
