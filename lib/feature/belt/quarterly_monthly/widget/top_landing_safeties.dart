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
            const FormHeaderTitle(title: "TOP LANDING SAFETIES"),
            CustomRadioTile(
              id: 'top_landing_safeties_1',
              title: 'Type 1:',
              values: const ['Knock Out Bar', 'Photo Eye'],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesType1 =
                    jsonData['drive_assembly_toplandingsafeties_type1'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_safeties_2',
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
              id: 'top_landing_safeties_3',
              title: 'Type 2:',
              values: const ['Photo Eye', 'In-Track', 'Split Rail'],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesType2 =
                    jsonData['drive_assembly_toplandingsafeties_type2'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_safeties_4',
              title: 'Location',
              values: const ['Right', 'Left'],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesType2Location =
                    jsonData['drive_assembly_toplandingsafeties_type2']
                        ['location'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_safeties_5',
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
              id: 'top_landing_safeties_6',
              title: 'Type 3:',
              values: const ['Photo Eye', 'In-Track', 'Split Rail'],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesType3 =
                    jsonData['drive_assembly_toplandingsafeties_type3'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_safeties_7',
              title: 'Location',
              values: const ['Right', 'Left'],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesType3Location =
                    jsonData['drive_assembly_toplandingsafeties_type3']
                        ['location'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_safeties_8',
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
              id: 'top_landing_safeties_9',
              title: 'Type 4:',
              values: const ['Photo Eye', 'In-Track', 'Split Rail'],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesType4 =
                    jsonData['drive_assembly_toplandingsafeties_type4'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_safeties_10',
              title: 'Location',
              values: const ['Right', 'Left'],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesType4Location =
                    jsonData['drive_assembly_toplandingsafeties_type4']
                        ['location'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_safeties_11',
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
              id: 'top_landing_safeties_12',
              title: 'Top Reset',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesTopReset =
                    jsonData['drive_assembly_toplandingsafeties_topreset']
                        [value];
              },
            ),
            CustomTextField(
              id: 'top_landing_safeties_13',
              title: 'Location',
            ),
            CustomRadioTile(
              id: 'top_landing_safeties_14',
              title: 'Compliant',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesTopResetCompliant =
                    jsonData['compliant'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_safeties_15',
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
              id: 'top_landing_safeties_16',
              title: 'Are Safety Stop Device Switches:',
              values: const ['Manual', 'Self-Resetting', "Both"],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesSafetyDeviceSwitches =
                    jsonData['safetydeviceswitches'][value];
              },
            ),
            CustomRadioTile(
              id: 'top_landing_safeties_17',
              title: 'Is there a visual and audible alerting system',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.driveAssemblyTopLandingSafetiesHasAlertingSystem =
                    jsonData['hasalertingsystem'][value];
              },
            ),
            CustomTextField(
              id: 'top_landing_safeties_18',
              title: 'Top Safeties Comments:',
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
