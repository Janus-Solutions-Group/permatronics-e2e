import 'package:flutter/material.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../../model/belt_inspection_model.dart';
import '../pages/belt_quaterly.dart';

class Handholds extends StatelessWidget {
  const Handholds(
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
            const FormHeaderTitle(title: "Handholds"),
            CustomRadioTile(
              id: 'handholds_1',
              title: 'Handhold Color',
              values: const ['Blue', 'Yellow', 'Other'],
              onChangeValue: (value) {
                beltModel.handholdsHandholdColor =
                    jsonData['handholds_handhold_color'][value];
              },
            ),
            CustomRadioTile(
              id: 'handholds_2',
              title: 'Condition of Bolts',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.handholdsConditionOfBolts =
                    jsonData['handholds_condition_of_bolts'][value];
              },
            ),
            CustomTextField(
              id: 'handholds_3',
              title: 'Handhold Comments:',
              onChanged: (val) {
                beltModel.handholdsHandholdComments = val;
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
