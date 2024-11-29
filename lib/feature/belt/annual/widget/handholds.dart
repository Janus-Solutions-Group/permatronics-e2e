import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../pages/belt_annual.dart';

class Handholds extends StatefulWidget {
  const Handholds(
      {super.key, required this.pageController, required this.beltModel});

  final PageController pageController;
  final BeltInspection beltModel;

  @override
  State<Handholds> createState() => _HandholdsState();
}

class _HandholdsState extends State<Handholds> {
  var beltVariable = BeltInspection();
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
            const FormHeaderTitle(title: "Handholds"),
            CustomRadioTile(
              title: 'Handhold Type',
              values: const ['L55', 'Cup', 'Open'],
              onChangeValue: (value) {
                widget.beltModel.handholdsHandholdType =
                    jsonData['handholds_handhold_type'][value];
              },
            ),
            CustomRadioTile(
              title: 'Handhold Color',
              values: const ['Blue', 'Yellow', 'Other'],
              onChangeValue: (value) {
                widget.beltModel.handholdsHandholdColor =
                    jsonData['handholds_handhold_color'][value];
              },
              fieldValue: "other",
              onFieldChange: (value) {
                widget.beltModel.handholdsHandholdColor = value;
              },
            ),
            CustomTextField(
              title: 'Number of Handholds',
              onChanged: (value) {
                widget.beltModel.handholdsNumberOfHandholds = value;
              },
            ),
            CustomRadioTile(
              title: 'Depth: (3”)',
              values: const ['OK', 'Non-Compliant'],
              onChangeValue: (value) {
                widget.beltModel.handholdsDepth =
                    jsonData['handholds_depth'][value];
              },
            ),
            CustomRadioTile(
              title: 'Distance from Belt: (2”)',
              values: const ['OK', 'Non-Compliant'],
              onChangeValue: (value) {
                widget.beltModel.handholdsDistanceFromBelt =
                    jsonData['handholds_distance_from_belt'][value];
              },
            ),
            CustomRadioTile(
              title: 'Distance from Step: (48”-56”)',
              values: const ['OK', 'Non-Compliant'],
              onChangeValue: (value) {
                widget.beltModel.handholdsDistanceFromStep =
                    jsonData['handholds_distance_from_step'][value];
              },
            ),
            CustomRadioTile(
              title: 'Punching Pattern:',
              values: const ['8 7/8”', '9” ', 'Other'],
              onChangeValue: (value) {
                widget.beltModel.handholdsPunchingPattern =
                    jsonData['handholds_punching_pattern'][value];
              },
              fieldValue: "other",
              onFieldChange: (value) {
                widget.beltModel.handholdsPunchingPattern = value;
              },
            ),
            CustomRadioTile(
              title: 'Condition of Bolts',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                widget.beltModel.handholdsConditionOfBolts =
                    jsonData['handholds_condition_of_bolts'][value];
              },
            ),
            CustomTextField(
              title: 'Handhold Comments:',
              onChanged: (value) {
                widget.beltModel.handholdsHandholdComments = value;
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
            ),
          ],
        ),
      ),
    );
  }
}
