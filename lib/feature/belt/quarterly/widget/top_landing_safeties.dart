import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';

import '../../../common/widgets/custom_textfield.dart';
import '../../../common/widgets/form_header.dart';
import '../../../common/widgets/page_navigation_button.dart';
import '../../../common/widgets/radio_tile.dart';
import '../pages/belt_quaterly.dart';

class TopLandingSafeties extends StatelessWidget {
  const TopLandingSafeties(
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
            FormHeaderTitle(title: "TOP LANDING SAFETIES"),
            CustomRadioTile(
              title: 'Type 1:',
              values: const ['Knock Out Bar', 'Photo Eye'],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesType1 =
                    jsonData['drive_assembly_toplandingsafeties_type1'][value];
              },
            ),
            CustomRadioTile(
              title: 'Type 1: Condition',
              values: const [
                'OK',
                'Inoperable',
                'Replace Switch',
                'Replace Whole Assembly'
              ],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesType1Condition =
                    jsonData['drive_assembly_toplandingsafeties_type1']
                        ['condition'][value];
              },
            ),
            CustomRadioTile(
              title: 'Type 2:',
              values: const ['Photo Eye', 'In-Track', 'Split Rail'],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesType2 =
                    jsonData['drive_assembly_toplandingsafeties_type2'][value];
              },
            ),
            CustomRadioTile(
              title: 'Location',
              values: const ['Right', 'Left'],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesType2Location =
                    jsonData['drive_assembly_toplandingsafeties_type2']
                        ['location'][value];
              },
            ),
            CustomRadioTile(
              title: 'Type 2: Condition',
              values: const [
                'OK',
                'Inoperable',
                'Replace Switch',
                'Replace Whole Assembly'
              ],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesType2Condition =
                    jsonData['drive_assembly_toplandingsafeties_type2']
                        ['condition'][value];
              },
            ),
            CustomRadioTile(
              title: 'Type 3:',
              values: const ['Photo Eye', 'In-Track', 'Split Rail'],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesType3 =
                    jsonData['drive_assembly_toplandingsafeties_type3'][value];
              },
            ),
            CustomRadioTile(
              title: 'Location',
              values: const ['Right', 'Left'],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesType3Location =
                    jsonData['drive_assembly_toplandingsafeties_type3']
                        ['location'][value];
              },
            ),
            CustomRadioTile(
              title: 'Type 3: Condition',
              values: const [
                'OK',
                'Inoperable',
                'Replace Switch',
                'Replace Whole Assembly'
              ],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesType3Condition =
                    jsonData['drive_assembly_toplandingsafeties_type3']
                        ['condition'][value];
              },
            ),
            CustomRadioTile(
              title: 'Type 4:',
              values: const ['Photo Eye', 'In-Track', 'Split Rail'],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesType4 =
                    jsonData['drive_assembly_toplandingsafeties_type4'][value];
              },
            ),
            CustomRadioTile(
              title: 'Location',
              values: const ['Right', 'Left'],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesType4Location =
                    jsonData['drive_assembly_toplandingsafeties_type4']
                        ['location'][value];
              },
            ),
            CustomRadioTile(
              title: 'Type 4: Condition',
              values: const [
                'OK',
                'Inoperable',
                'Replace Switch',
                'Replace Whole Assembly'
              ],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesType4Condition =
                    jsonData['drive_assembly_toplandingsafeties_type4']
                        ['condition'][value];
              },
            ),
            CustomRadioTile(
              title: 'Top Reset',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesTopReset =
                    jsonData['drive_assembly_toplandingsafeties_topreset']
                        [value];
              },
            ),
            CustomTextField(title: 'Location'),
            CustomRadioTile(
              title: 'Compliant',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesTopResetCompliant =
                    jsonData['compliant'][value];
              },
            ),
            CustomRadioTile(
              title: 'Condition',
              values: const ['Ok', 'Inoperable'],
              onChangeValue: (value) {
                beltModel
                    .driveAssemblyTopLandingSafetiesTopResetCondition = jsonData[
                        'drive_assembly_toplandingsafeties_topresetcondition']
                    [value];
              },
            ),
            CustomRadioTile(
              title: 'Are Safety Stop Device Switches:',
              values: const ['Manual', 'Self-Resetting', "Both"],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesSafetyDeviceSwitches =
                    jsonData['safetydeviceswitches'][value];
              },
            ),
            CustomRadioTile(
              title: 'Is there a visual and audible alerting system',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesHasAlertingSystem =
                    jsonData['hasalertingsystem'][value];
              },
            ),
            CustomTextField(title: 'Top Safeties Comments:'),
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
