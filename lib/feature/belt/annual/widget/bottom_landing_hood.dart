import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/annual/pages/belt_annual.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class BottomLandingHood extends StatefulWidget {
  const BottomLandingHood(
      {super.key, required this.pageController, required this.beltModel});

  final PageController pageController;
  final BeltInspection beltModel;

  @override
  State<BottomLandingHood> createState() => _BottomLandingHoodState();
}

class _BottomLandingHoodState extends State<BottomLandingHood> {
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
            const FormHeaderTitle(title: "BOTTOM LANDING HOOD"),
            CustomRadioTile(
              id: "bottom_landing_hood_annual_1",
              title: 'Type of Hood',
              values: const ["Stationary", "Moveable", "Moveable Mini", 'None'],
              onChangeValue: (value) {
                setState(() {
                  beltVariable.bottomLandingHoodTypeOfHood = value;
                });
                widget.beltModel.bottomLandingHoodTypeOfHood =
                    jsonData["bottom_landing_hood_type_of_hood"][value];
              },
            ),
            if (beltVariable.bottomLandingHoodTypeOfHood != null &&
                beltVariable.bottomLandingHoodTypeOfHood != "none")
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (beltVariable.bottomLandingHoodTypeOfHood == "stationary")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          id: "bottom_landing_hood_annual_2",
                          title: 'If Stationary, Distance from Face of Belt:',
                          onChanged: (value) {},
                        ),
                        CustomTextField(
                          id: "bottom_landing_hood_annual_3",
                          title: 'Angle of Slope:',
                          onChanged: (value) {},
                        ),
                        CustomRadioTile(
                          id: "bottom_landing_hood_annual_4",
                          title: 'Shape',
                          values: const ['Circular', 'Square'],
                          onChangeValue: (value) {
                            widget.beltModel.bottomLandingHoodShape =
                                jsonData["bottom_landing_hood_shape"][value];
                          },
                        ),
                      ],
                    ),
                  if (beltVariable.bottomLandingHoodTypeOfHood == "moveable")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomRadioTile(
                          id: "bottom_landing_hood_annual_5",
                          title: 'If Moveable, What Type of Switch:',
                          values: const ['Mercury', 'Micro-Switch'],
                          onChangeValue: (value) {
                            widget.beltModel
                                    .bottomLandingHoodIfMoveableWhatTypeOfSwitch =
                                jsonData[
                                        "bottom_landing_hood_if_moveable,_what_type_of_switch"]
                                    [value];
                          },
                        ),
                        CustomRadioTile(
                          id: "bottom_landing_hood_annual_6",
                          title: 'Does the Switch work',
                          values: const ['Yes', 'No'],
                          onChangeValue: (value) {
                            widget.beltModel
                                    .bottomLandingHoodIfMoveableDoesTheSwitchWork =
                                jsonData[
                                        "bottom_landing_hood_if_moveable_does_the_switch_work"]
                                    [value];
                          },
                        ),
                        CustomRadioTile(
                          id: "bottom_landing_hood_annual_7",
                          title: 'Location of Hinges',
                          values: const [
                            '6”',
                            'More than 6” with obstruction',
                            'Other'
                          ],
                          onChangeValue: (value) {
                            widget.beltModel
                                .bottomLandingHoodLocationOfHinges = jsonData[
                                    "bottom_landing_hood_location_of_hinges"]
                                [value];
                          },
                          fieldValue: "other",
                          fieldLabelTitle: "Mesurment in inches",
                          onFieldChange: (value) {
                            widget.beltModel.bottomLandingHoodLocationOfHinges =
                                value;
                          },
                        ),
                      ],
                    ),
                  CustomRadioTile(
                    id: "bottom_landing_hood_annual_8",
                    title: 'Counterweighted',
                    values: const ['Yes', 'No'],
                    onChangeValue: (value) {
                      widget.beltModel.bottomLandingHoodCounterweighted =
                          jsonData["bottom_landing_hood_counterweighted"]
                              [value];
                    },
                  ),
                  CustomRadioTile(
                    id: "bottom_landing_hood_annual_9",
                    title: 'Hood Condition',
                    values: const [
                      "OK",
                      "Damaged, but OK",
                      "Replace Damaged",
                      'Replace Worn'
                    ],
                    onChangeValue: (value) {
                      widget.beltModel.bottomLandingHoodHoodCondition =
                          jsonData["bottom_landing_hood_hood_condition"][value];
                    },
                  ),
                  CustomRadioTile(
                    id: "bottom_landing_hood_annual_10",
                    title: 'Hood Clearance:',
                    values: const [
                      '(Minimum 7’6”)',
                      'Compliant',
                      'Non-Compliant'
                    ],
                    onChangeValue: (value) {
                      widget.beltModel.bottomLandingHoodHoodClearance =
                          jsonData["bottom_landing_hood_hood_clearance"][value];
                    },
                  ),
                  CustomRadioTile(
                    id: "bottom_landing_hood_annual_11",
                    title: 'Does Hood have a Rolled Edge',
                    values: const ['Yes', 'No'],
                    onChangeValue: (value) {
                      setState(() {
                        beltVariable.bottomLandingHoodDoesHoodHaveARolledEdge =
                            value;
                      });
                      widget.beltModel
                          .bottomLandingHoodDoesHoodHaveARolledEdge = jsonData[
                              "bottom_landing_hood_does_hood_have_a_rolled_edge"]
                          [value];
                    },
                  ),
                  if (beltVariable.bottomLandingHoodDoesHoodHaveARolledEdge ==
                      "yes")
                    CustomRadioTile(
                      id: "bottom_landing_hood_annual_12",
                      title: 'Condition of Rolled Edge:',
                      values: const [
                        'OK',
                        'Damaged, but OK',
                        'Replace Damaged',
                        'Replace Worn'
                      ],
                      onChangeValue: (value) {
                        widget.beltModel
                            .bottomLandingHoodConditionOfRolledEdge = jsonData[
                                "bottom_landing_hood_condition_of_rolled_edge"]
                            [value];
                      },
                    ),
                  CustomTextField(
                    id: "bottom_landing_hood_annual_13",
                    title: 'Bottom Hood Comments:',
                    onChanged: (value) {
                      widget.beltModel.bottomLandingHoodBottomHoodComments =
                          value;
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
