import 'package:flutter/material.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';
import 'package:manlift_app/feature/common/widgets/multiple_selection_widget.dart';
import 'package:manlift_app/data/models/original_model.dart';

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
            const FormHeaderTitle(title: "BELTING"),
            CustomRadioTile(
              id: "belting_annual_1",
              title: 'Belting Type',
              values: const ['PVC', 'Cotton', 'Rubber'],
              onChangeValue: (value) {
                widget.beltModel.beltingBeltingType =
                    jsonData['belting_belting_type'][value];
              },
            ),
            MultipleSelectionWidget(
              original: OriginalModel(
                id: "belting_annual_2",
                title: 'Belting Condition',
                values: const ['OK', 'Cuts', 'Frayed Edges', 'Replace Damaged'],
              ),
              onSelectionChanged: (val) {
                if (val.isEmpty) return;

                final selected = val.last; // enforce radio-style behavior

                widget.beltModel.beltingBeltingCondition =
                    jsonData['belting_belting_condition'][selected];
              },
            ),
            CustomRadioTile(
              id: "belting_annual_3",
              title: 'Width',
              values: const ['12"', '14"', '16"'],
              onChangeValue: (value) {
                widget.beltModel.beltingWidth =
                    jsonData['belting_width'][value];
              },
            ),
            CustomRadioTile(
              id: "belting_annual_4",
              title: 'Color',
              values: const ['Black', 'Yellow', 'Other'],
              onChangeValue: (value) {
                widget.beltModel.beltingColor =
                    jsonData['belting_color'][value];
              },
              onFieldChange: (value) {
                widget.beltModel.beltingColor = value;
              },
              conditionalBuilder: (selected) {
                if (selected == 'other') {
                  return CustomTextField(
                    id: "belting_annual_4a",
                    title: 'Specify Other',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomRadioTile(
              id: "belting_annual_5",
              title: 'Splice Type',
              values: const ['Lap', 'Butt'],
              onChangeValue: (value) {
                widget.beltModel.beltingSpliceType =
                    jsonData['belting_splice_type'][value];
              },
            ),
            CustomTextField(
              id: "belting_annual_6",
              title: 'Splice Length:',
              onChanged: (value) {
                widget.beltModel.beltingSpliceLength = value;
              },
            ),
            CustomTextField(
              id: "belting_annual_7",
              title: 'Number of Bolts:',
              onChanged: (value) {
                widget.beltModel.beltingNumberOfBolts = value;
              },
            ),
            CustomRadioTile(
              id: "belting_annual_8",
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
                id: "belting_annual_9",
                title: 'How Many:',
                onChanged: (value) {
                  widget.beltModel.beltingMissingBoltsNumber = value;
                },
              ),
            CustomRadioTile(
              id: "belting_annual_10",
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
            MultipleSelectionWidget(
              original: OriginalModel(
                id: "belting_annual_11",
                title: 'Instructions Stenciled on the Belt:',
                values: const ['OK', 'Non-Compliant', 'Faded'],
              ),
              onSelectionChanged: (val) {
                if (val.isEmpty) return;

                final selected = val.last;

                debugPrint(selected);

                setState(() {
                  beltVariable.beltingInstructionsStenciledOnTheBelt = selected;
                });

                widget.beltModel.beltingInstructionsStenciledOnTheBelt =
                    jsonData['belting_instructions_stenciled_on_the_belt']
                        [selected];
              },
            ),
            MultipleSelectionWidget(
              original: OriginalModel(
                id: "belting_annual_12",
                title: 'Directional Arrows Stenciled on the Belt:',
                values: const ['Yes', 'Non-Compliant', 'Faded'],
              ),
              onSelectionChanged: (val) {
                if (val.isEmpty) return;

                final selected = val.last;

                widget.beltModel.beltingDirectionalArrowsStenciledOnTheBelt =
                    jsonData['belting_directional_arrows_stenciled_on_the_belt']
                        [selected];
              },
            ),
            CustomRadioTile(
              id: "belting_annual_13",
              title: 'Compressive Flex Failure:',
              values: const ['No', 'Slight', 'Extreme'],
              onChangeValue: (value) {
                widget.beltModel.beltingCompressiveFlexFailure =
                    jsonData['belting_compressive_flex_failure'][value];
              },
            ),
            CustomRadioTile(
              id: "belting_annual_13",
              title: 'Tension of Belt:',
              values: const ['Good', 'Needs to be adjusted'],
              onChangeValue: (value) {
                widget.beltModel.beltingTensionOfBelt =
                    jsonData['belting_tension_of_belt'][value];
              },
            ),
            CustomTextField(
              id: "belting_annual_14",
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
