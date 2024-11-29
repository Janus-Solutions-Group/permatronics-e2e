import 'package:flutter/material.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../../model/belt_inspection_model.dart';
import '../pages/belt_annual.dart';

class Belting extends StatefulWidget {
  const Belting(
      {super.key, required this.pageController, required this.beltModel});

  final PageController pageController;
  final BeltInspection beltModel;

  @override
  State<Belting> createState() => _BeltingState();
}

class _BeltingState extends State<Belting> {
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
            const FormHeaderTitle(title: "BELTING"),
            CustomRadioTile(
              title: 'Belting Type',
              values: const ['PVC', 'Cotton', 'Rubber'],
              onChangeValue: (value) {
                widget.beltModel.beltingBeltingType =
                    jsonData['belting_belting_type'][value];
              },
            ),
            CustomRadioTile(
              title: 'Belting Condition',
              values: const ['OK', 'Cuts', 'Frayed Edges', 'Replace Damaged'],
              onChangeValue: (value) {
                widget.beltModel.beltingBeltingCondition =
                    jsonData['belting_belting_condition'][value];
              },
            ),
            CustomRadioTile(
              title: 'Width',
              values: const ['12”', '14”', '16”'],
              onChangeValue: (value) {
                widget.beltModel.beltingWidth =
                    jsonData['belting_width'][value];
              },
            ),
            CustomRadioTile(
              title: 'Color',
              values: const ['Black', 'Yellow', 'Other'],
              onChangeValue: (value) {
                widget.beltModel.beltingColor =
                    jsonData['belting_color'][value];
              },
              fieldValue: "other",
              fieldTitle: "Other",
              onFieldChange: (value) {
                widget.beltModel.beltingColor = value;
              },
            ),
            CustomRadioTile(
              title: 'Splice Type',
              values: const ['Lap', 'Butt'],
              onChangeValue: (value) {
                widget.beltModel.beltingSpliceType =
                    jsonData['belting_splice_type'][value];
              },
            ),
            CustomTextField(
              title: 'Splice Length:',
              onChanged: (value) {
                widget.beltModel.beltingSpliceLength = value;
              },
            ),
            CustomTextField(
              title: 'Number of Bolts:',
              onChanged: (value) {
                widget.beltModel.beltingNumberOfBolts = value;
              },
            ),
            CustomRadioTile(
              title: 'Missing Bolts',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                setState(() {
                  beltVariable.stepsMissingBolts = value;
                });
                widget.beltModel.stepsMissingBolts =
                    jsonData['belting_missing_bolts'][value];
              },
            ),
            if (beltVariable.stepsMissingBolts == "yes")
              CustomTextField(
                title: 'How Many:',
                onChanged: (value) {
                  widget.beltModel.beltingMissingBoltsNumber = value;
                },
              ),
            CustomRadioTile(
              title: 'Splice Bolt Condition:',
              values: const [
                'OK',
                'Worn, but OK',
                'Replace Damaged',
                'Replace Worn'
              ],
              onChangeValue: (value) {
                widget.beltModel.beltingSpliceBoltCondition =
                    jsonData['belting_splice_bolt_condition'][value];
              },
            ),
            CustomRadioTile(
              title: 'Instructions Stenciled on the Belt:',
              values: const ['OK', 'Non-Compliant', 'Faded'],
              onChangeValue: (value) {
                widget.beltModel.beltingInstructionsStenciledOnTheBelt =
                    jsonData['belting_instructions_stenciled_on_the_belt']
                        [value];
              },
            ),
            CustomRadioTile(
              title: 'Directional Arrows Stenciled on the Belt:',
              values: const ['Yes', 'No', 'Faded'],
              onChangeValue: (value) {
                widget.beltModel.beltingDirectionalArrowsStenciledOnTheBelt =
                    jsonData['belting_directional_arrows_stenciled_on_the_belt']
                        [value];
              },
            ),
            CustomRadioTile(
              title: 'Compressive Flex Failure:',
              values: const ['No', 'Slight', 'Extreme'],
              onChangeValue: (value) {
                widget.beltModel.beltingCompressiveFlexFailure =
                    jsonData['belting_compressive_flex_failure'][value];
              },
            ),
            CustomRadioTile(
              title: 'Tension of Belt:',
              values: const ['Good', 'Needs to be adjusted'],
              onChangeValue: (value) {
                widget.beltModel.beltingTensionOfBelt =
                    jsonData['belting_tension_of_belt'][value];
              },
            ),
            CustomTextField(
              title: 'Belt Condition Comments:',
              onChanged: (value) {
                widget.beltModel.beltingBeltConditionComments = value;
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
