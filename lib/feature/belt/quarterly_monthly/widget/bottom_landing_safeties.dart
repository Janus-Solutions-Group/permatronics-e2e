import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../pages/belt_quaterly.dart';

class BottomLandingSafeties extends StatelessWidget {
  const BottomLandingSafeties({
    super.key,
    required this.pageController,
    required this.beltModel,
  });

  final PageController pageController;
  final BeltInspection beltModel;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    // Assuming jsonData is available in your context
    var jsonData =
        BeltJson.of(context)!.data; // Replace with your actual JSON data

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormHeaderTitle(title: "Bottom Landing Safeties"),
            CustomRadioTile(
              id: 'bottom_landing_safeties_1',
              title: "Type 1:",
              values: const ["Treadle", "Photo Eye"],
              onChangeValue: (value) {
                beltModel.bottomLandingSafetiesType1 =
                    jsonData['bottom_landing_safeties_type_1'][value];
              },
            ),
            CustomRadioTile(
              id: 'bottom_landing_safeties_2',
              title: "Type 1 Condition:",
              values: const [
                'OK',
                'Inoperable',
                'Replace Switch',
                'Replace Whole Assembly'
              ],
              onChangeValue: (value) {
                beltModel.bottomLandingSafetiesType1Condition =
                    jsonData['bottom_landing_safeties_type_1_condition'][value];
              },
            ),
            Wrap(
              children: [
                CustomRadioTile(
                  id: 'bottom_landing_safeties_3',
                  title: "Type 2:",
                  values: const ["Photo Eye", "In-Track", "Split-Rail"],
                  onChangeValue: (value) {
                    beltModel.bottomLandingSafetiesType2 =
                        jsonData['bottom_landing_safeties_type_2'][value];
                  },
                ),
                CustomRadioTile(
                  id: 'bottom_landing_safeties_4',
                  title: "Location:",
                  values: const ["Right", "Left"],
                  onChangeValue: (value) {
                    // beltModel.bottomLandingSafetiesType2Location = jsonData['bottom_landing_safeties_type_2'][value];
                  },
                ),
              ],
            ),
            CustomRadioTile(
              id: 'bottom_landing_safeties_5',
              title: "Condition:",
              values: const [
                'OK',
                'Inoperable',
                'Replace Switch',
                'Replace Whole Assembly'
              ],
              onChangeValue: (value) {
                beltModel.bottomLandingSafetiesType2Condition =
                    jsonData['bottom_landing_safeties_type_2_condition'][value];
              },
            ),
            Wrap(
              children: [
                CustomRadioTile(
                  id: 'bottom_landing_safeties_6',
                  title: "Type 3:",
                  values: const ["Photo Eye", "In-Track", "Split-Rail"],
                  onChangeValue: (value) {
                    beltModel.bottomLandingSafetiesType3 =
                        jsonData['bottom_landing_safeties_type_3'][value];
                  },
                ),
                CustomRadioTile(
                  id: 'bottom_landing_safeties_7',
                  title: "Location:",
                  values: const ["Right", "Left"],
                  onChangeValue: (value) {
                    // beltModel.bottomLandingSafetiesType3Location = value;
                  },
                ),
              ],
            ),
            CustomRadioTile(
              id: 'bottom_landing_safeties_8',
              title: "Condition:",
              values: const [
                'OK',
                'Inoperable',
                'Replace Switch',
                'Replace Whole Assembly'
              ],
              onChangeValue: (value) {
                beltModel.bottomLandingSafetiesType3Condition =
                    jsonData['bottom_landing_safeties_type_3_condition'][value];
              },
            ),
            CustomRadioTile(
              id: 'bottom_landing_safeties_9',
              title: "Bottom Reset:",
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.bottomLandingSafetiesBottomReset =
                    jsonData['bottom_landing_safeties_bottom_reset'][value];
              },
            ),
            CustomTextField(
              id: 'bottom_landing_safeties_10',
              title: "Location:",
              onChanged: (val) {
                beltModel.bottomLandingSafetiesBottomResetLocation = val;
              },
            ),
            CustomTextField(
              id: 'bottom_landing_safeties_11',
              title: "Bottom Safeties Comments",
              onChanged: (val) {
                beltModel.bottomLandingSafetiesBottomSafetiesComments = val;
              },
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
