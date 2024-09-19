import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../pages/belt_quaterly.dart';

class Belting extends StatelessWidget {
  const Belting(
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
            FormHeaderTitle(title: "BELTING"),
            CustomRadioTile(
              title: 'Belting Type',
              values: const ['PVC', 'Cotton', 'Rubber'],
              onChangeValue: (value) {
                beltModel.beltingBeltingType =
                    jsonData['belting_belting_type'][value];
              },
            ),
            CustomRadioTile(
              title: 'Width',
              values: const ['12”', '14”', '16”'],
              onChangeValue: (value) {
                beltModel.beltingWidth = jsonData['belting_width'][value];
              },
            ),
            CustomRadioTile(
              title: 'Splice Type',
              values: const ['Lap', 'Butt'],
              onChangeValue: (value) {
                beltModel.beltingSpliceType =
                    jsonData['belting_splice_type'][value];
              },
            ),
            CustomTextField(title: 'Splice Length:'),
            CustomTextField(title: 'Number of Bolts:'),
            CustomRadioTile(
              title: 'Splice Bolt Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.beltingSpliceBoltCondition =
                    jsonData['belting_splice_bolt_condition'][value];
              },
            ),
            CustomRadioTile(
              title: 'Instructions Stenciled on the Belt:',
              values: const ['OK', 'Non-Compliant', 'Faded'],
              onChangeValue: (value) {
                beltModel.beltingInstructionsStenciledOnTheBelt =
                    jsonData['belting_instructions_stenciled_on_the_belt']
                        [value];
              },
            ),
            CustomRadioTile(
              title: 'Directional Arrows Stenciled on the Belt:',
              values: const ['Yes', 'No', 'Faded'],
              onChangeValue: (value) {
                beltModel.beltingDirectionalArrowsStenciledOnTheBelt =
                    jsonData['belting_directional_arrows_stenciled_on_the_belt']
                        [value];
              },
            ),
            CustomRadioTile(
              title: 'Compressive Flex Failure:',
              values: const ['No', 'Slight', 'Extreme'],
              onChangeValue: (value) {
                beltModel.beltingCompressiveFlexFailure =
                    jsonData['belting_compressive_flex_failure'][value];
              },
            ),
            CustomRadioTile(
              title: 'Tension of Belt:',
              values: const ['Good', 'Needs to be adjusted'],
              onChangeValue: (value) {
                beltModel.beltingTensionOfBelt =
                    jsonData['belting_tension_of_belt'][value];
              },
            ),
            CustomTextField(title: 'Belt Condition Comments:'),
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
