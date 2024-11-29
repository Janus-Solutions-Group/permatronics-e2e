import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/annual/pages/belt_annual.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

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
  String? wantToAddThisPage;
  var beltVariable = BeltInspection();

  @override
  Widget build(BuildContext context) {
    var jsonData = BeltAnnualJson.of(context)!.data;
    final formKey = GlobalKey<FormState>();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHeaderTitle(
              title: "Bottom Landing Safeties",
              values: const ["Yes", "No"],
              currentValue: wantToAddThisPage,
              onChanged: (value) {
                setState(() {
                  wantToAddThisPage = value;
                });
              },
            ),
            if (wantToAddThisPage == "Yes")
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRadioTile(
                    id: "Bottom Landing Safeties 1",
                    title: "Type 1:",
                    values: const ["Treadle", "Photo Eye"],
                    onChangeValue: (value) {
                      widget.beltModel.bottomLandingSafetiesType1 =
                          jsonData["bottom_landing_safeties_type_1"][value];
                    },
                  ),
                  CustomRadioTile(
                    id: "Bottom Landing Safeties 2",
                    title: "Condition:",
                    values: const [
                      'OK',
                      'Inoperable',
                      'Replace Switch',
                      'Replace Whole Assembly'
                    ],
                    onChangeValue: (value) {
                      widget.beltModel.bottomLandingSafetiesType1Condition =
                          jsonData["bottom_landing_safeties_type_1_condition"]
                              [value];
                    },
                  ),
                  Wrap(
                    children: [
                      CustomRadioTile(
                        id: "Bottom Landing Safeties 3",
                        title: "Type 2:",
                        values: const ["Photo Eye", "In-Track", "Split Rail"],
                        onChangeValue: (value) {
                          widget.beltModel.bottomLandingSafetiesType2 =
                              jsonData["bottom_landing_safeties_type_2"][value];
                        },
                      ),
                      CustomRadioTile(
                        id: "Bottom Landing Safeties 4",
                        title: "Location:",
                        values: const ["Right", "Left"],
                        onChangeValue: (value) {
                          widget.beltModel.bottomLandingSafetiesType2Location =
                              jsonData[
                                      "bottom_landing_safeties_type_2_location"]
                                  [value];
                        },
                      ),
                    ],
                  ),
                  CustomRadioTile(
                    id: "Bottom Landing Safeties 5",
                    title: "Condition:",
                    values: const [
                      'OK',
                      'Inoperable',
                      'Replace Switch',
                      'Replace Whole Assembly'
                    ],
                    onChangeValue: (value) {
                      widget.beltModel.bottomLandingSafetiesType2Condition =
                          jsonData["bottom_landing_safeties_type_2_condition"]
                              [value];
                    },
                  ),
                  Wrap(
                    children: [
                      CustomRadioTile(
                        id: "Bottom Landing Safeties 6",
                        title: "Type 3:",
                        values: const ["Photo Eye", "In-Track", "Split Rail"],
                        onChangeValue: (value) {
                          widget.beltModel.bottomLandingSafetiesType3 =
                              jsonData["bottom_landing_safeties_type_3"][value];
                        },
                      ),
                      CustomRadioTile(
                        id: "Bottom Landing Safeties 7",
                        title: "Location:",
                        values: const ["Right", "Left"],
                        onChangeValue: (value) {
                          widget.beltModel.bottomLandingSafetiesType3Location =
                              jsonData[
                                      "bottom_landing_safeties_type_3_location"]
                                  [value];
                        },
                      ),
                    ],
                  ),
                  CustomRadioTile(
                    id: "Bottom Landing Safeties 8",
                    title: "Condition:",
                    values: const [
                      'OK',
                      'Inoperable',
                      'Replace Switch',
                      'Replace Whole Assembly'
                    ],
                    onChangeValue: (value) {
                      widget.beltModel.bottomLandingSafetiesType3Condition =
                          jsonData["bottom_landing_safeties_type_3_condition"]
                              [value];
                    },
                  ),
                  CustomRadioTile(
                    id: "Bottom Landing Safeties 9",
                    title: "Bottom Reset:",
                    values: const ['Yes', 'No'],
                    onChangeValue: (value) {
                      setState(() {
                        beltVariable.bottomLandingSafetiesBottomReset = value;
                      });
                      widget.beltModel.bottomLandingSafetiesBottomReset =
                          jsonData["bottom_landing_safeties_bottom_reset"]
                              [value];
                    },
                  ),
                  if (beltVariable.bottomLandingSafetiesBottomReset == "yes")
                    CustomTextField(
                      title: "Location:",
                      onChanged: (val) {},
                    ),
                  if (beltVariable.bottomLandingSafetiesBottomReset == "yes")
                    CustomRadioTile(
                      id: "Bottom Landing Safeties 10",
                      title: 'Compliant',
                      values: const ['Yes', 'No'],
                      onChangeValue: (value) {
                        widget.beltModel
                            .bottomLandingSafetiesBottomResetCompliant = jsonData[
                                "bottom_landing_safeties_bottom_reset_compliant"]
                            [value];
                      },
                    ),
                  if (beltVariable.bottomLandingSafetiesBottomReset == "yes")
                    CustomRadioTile(
                      id: "Bottom Landing Safeties 11",
                      title: 'Condition',
                      values: const ['OK', 'Inoperable'],
                      onChangeValue: (value) {
                        widget.beltModel
                            .bottomLandingSafetiesBottomResetCondition = jsonData[
                                "bottom_landing_safeties_bottom_reset_condition"]
                            [value];
                      },
                    ),
                  CustomRadioTile(
                    id: "Bottom Landing Safeties 12",
                    title: 'Is there a Visual and Audible Alerting System:',
                    values: const ['Yes', 'No'],
                    onChangeValue: (value) {
                      widget.beltModel
                              .bottomLandingSafetiesVisualAudibleAlertingSystem =
                          jsonData[
                                  "bottom_landing_safeties_visual_audible_alerting_system"]
                              [value];
                    },
                  ),
                  const CustomTextField(
                    title: "Bottom Safeties Comments",
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
