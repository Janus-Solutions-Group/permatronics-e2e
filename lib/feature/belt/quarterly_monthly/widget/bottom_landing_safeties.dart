import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../pages/belt_quaterly.dart';
import 'package:manlift_app/feature/common/widgets/multiple_selection_widget.dart';
import 'package:manlift_app/data/models/original_model.dart';

var beltVariable = BeltInspection();

class BottomLandingSafeties extends StatefulWidget {
  const BottomLandingSafeties({
    super.key,
    required this.pageController,
    required this.beltModel,
  });

  final PageController pageController;
  final BeltInspection beltModel;

  @override
  State<BottomLandingSafeties> createState() => _BottomLandingSafetiesState();
}

class _BottomLandingSafetiesState extends State<BottomLandingSafeties> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var jsonData = BeltJson.of(context)!.data;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FormHeaderTitle(
            //   title: "Bottom Landing Safeties",
            //   values: const ["Yes", "No"],
            //   currentValue: beltVariable.bottomLandingSafeties,
            //   onChanged: (value) {
            //     setState(() {
            //       beltVariable.bottomLandingSafeties = value;
            //     });
            //   },
            // ),
            CustomRadioTile(
              id: 'belt_bottom_landing_safeties',
              title: 'Bottom Landing Safeties',
              values: const ["Yes", "No"],
              onChangeValue: (value) {
                setState(() {
                  beltVariable.bottomLandingSafeties = value;
                });
              },
            ),
            if (beltVariable.bottomLandingSafeties == "yes")
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRadioTile(
                    id: 'bottom_landing_safeties_1',
                    title: "Type 1:",
                    values: const ["Treadle", "Photo Eye"],
                    onChangeValue: (value) {
                      widget.beltModel.bottomLandingSafetiesType1 =
                          jsonData['bottom_landing_safeties_type_1'][value];
                    },
                  ),
                  MultipleSelectionWidget(
                    original: OriginalModel(
                      id: 'bottom_landing_safeties_2',
                      title: 'Type 1 Condition:',
                      values: const [
                        'OK',
                        'Inoperable',
                        'Replace Switch',
                        'Replace Whole Assembly',
                      ],
                    ),
                    onSelectionChanged: (val) {
                      if (val.isEmpty) return;

                      // single-select behavior (radio equivalent)
                      final selected = val.last;

                      widget.beltModel.bottomLandingSafetiesType1Condition =
                          jsonData['bottom_landing_safeties_type_1_condition']
                              [selected];
                    },
                  ),
                  Wrap(
                    children: [
                      CustomRadioTile(
                        id: 'bottom_landing_safeties_3',
                        title: "Type 2:",
                        values: const ["Photo Eye", "In-Track", "Split-Rail"],
                        onChangeValue: (value) {
                          widget.beltModel.bottomLandingSafetiesType2 =
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
                  MultipleSelectionWidget(
                    original: OriginalModel(
                      id: 'bottom_landing_safeties_5',
                      title: 'Condition:',
                      values: const [
                        'OK',
                        'Inoperable',
                        'Replace Switch',
                        'Replace Whole Assembly',
                      ],
                    ),
                    onSelectionChanged: (val) {
                      if (val.isEmpty) return;

                      // radio-equivalent behavior
                      final selected = val.last;

                      widget.beltModel.bottomLandingSafetiesType2Condition =
                          jsonData['bottom_landing_safeties_type_2_condition']
                              [selected];
                    },
                  ),
                  Wrap(
                    children: [
                      CustomRadioTile(
                        id: 'bottom_landing_safeties_6',
                        title: "Type 3:",
                        values: const ["Photo Eye", "In-Track", "Split-Rail"],
                        onChangeValue: (value) {
                          widget.beltModel.bottomLandingSafetiesType3 =
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
                  MultipleSelectionWidget(
                    original: OriginalModel(
                      id: 'bottom_landing_safeties_8',
                      title: 'Condition:',
                      values: const [
                        'OK',
                        'Inoperable',
                        'Replace Switch',
                        'Replace Whole Assembly',
                      ],
                    ),
                    onSelectionChanged: (val) {
                      if (val.isEmpty) return;

                      // radio-style single selection
                      final selected = val.last;

                      widget.beltModel.bottomLandingSafetiesType3Condition =
                          jsonData['bottom_landing_safeties_type_3_condition']
                              [selected];
                    },
                  ),
                  CustomRadioTile(
                    id: 'bottom_landing_safeties_9',
                    title: "Bottom Reset:",
                    values: const ['Yes', 'No'],
                    onChangeValue: (value) {
                      setState(() {
                        beltVariable.bottomLandingSafetiesBottomReset = value;
                      });
                      widget.beltModel.bottomLandingSafetiesBottomReset =
                          jsonData['bottom_landing_safeties_bottom_reset']
                              [value];
                    },
                  ),
                  if (beltVariable.bottomLandingSafetiesBottomReset == "yes")
                    CustomTextField(
                      id: 'bottom_landing_safeties_10',
                      title: "Location:",
                      onChanged: (val) {
                        widget.beltModel
                            .bottomLandingSafetiesBottomResetLocation = val;
                      },
                    ),
                  CustomTextField(
                    id: 'bottom_landing_safeties_11',
                    title: "Bottom Safeties Comments",
                    onChanged: (val) {
                      widget.beltModel
                          .bottomLandingSafetiesBottomSafetiesComments = val;
                    },
                  ),
                ],
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
            )
          ],
        ),
      ),
    );
  }
}
