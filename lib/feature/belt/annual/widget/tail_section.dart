import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/annual/pages/belt_annual.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';

import '../../../common/widgets/form_header.dart';
import '../../../common/widgets/radio_tile.dart';

class TailSection extends StatefulWidget {
  const TailSection(
      {super.key, required this.pageController, required this.beltModel});

  final PageController pageController;
  final BeltInspection beltModel;

  @override
  State<TailSection> createState() => _TailSectionState();
}

class _TailSectionState extends State<TailSection> {
  var beltVariable = BeltInspection();

  @override
  Widget build(BuildContext context) {
    var jsonData = BeltAnnualJson.of(context)!.data;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FormHeaderTitle(title: "Tail Section/ Foot Assembly"),
          CustomRadioTile(
            id: "tail_section_1",
            title: "Leg Condition",
            values: const [
              "OK",
              "Worn, but OK",
              "Replace Damaged",
              "Replace Worn"
            ],
            onChangeValue: (value) {
              beltVariable.tailSectionFootAssemblyLegCondition = value;
              widget.beltModel.tailSectionFootAssemblyLegCondition =
                  jsonData["tail_section_foot_assembly_leg_condition"][value];
            },
          ),
          CustomRadioTile(
            id: "tail_section_2",
            title: "Leg Anchors",
            values: const ['Yes', 'No'],
            onChangeValue: (value) {
              setState(() {
                beltVariable.tailSectionFootAssemblyLegAnchors = value;
              });
              widget.beltModel.tailSectionFootAssemblyLegAnchors =
                  jsonData["tail_section_foot_assembly_leg_anchors"][value];
            },
          ),
          if (beltVariable.tailSectionFootAssemblyLegAnchors == 'yes')
            CustomRadioTile(
              id: "tail_section_3",
              title: "Legs Anchored to",
              values: const ['Concrete', 'Steel'],
              onChangeValue: (value) {
                widget.beltModel.tailSectionFootAssemblyLegsAnchoredTo =
                    jsonData["tail_section_foot_assembly_legs_anchored_to"]
                        [value];
              },
            ),
          CustomRadioTile(
            id: "tail_section_4",
            title: "Bottom Circle Type",
            values: const ['Bands', 'Cast', 'None'],
            onChangeValue: (value) {
              setState(() {
                beltVariable.tailSectionFootAssemblyBottomCircleType = value;
              });
              widget.beltModel.tailSectionFootAssemblyBottomCircleType =
                  jsonData["tail_section_foot_assembly_bottom_circle_type"]
                      [value];
            },
          ),
          if (beltVariable.tailSectionFootAssemblyBottomCircleType == "bands" ||
              beltVariable.tailSectionFootAssemblyBottomCircleType == "cast")
            CustomRadioTile(
              id: "tail_section_5",
              title: "Bottom Circle Condition",
              values: const [
                "OK",
                "Worn, but OK",
                "Replace Damaged",
                "Replace Worn"
              ],
              onChangeValue: (value) {
                widget.beltModel
                    .tailSectionFootAssemblyBottomCircleCondition = jsonData[
                        "tail_section_foot_assembly_bottom_circle_condition"]
                    [value];
              },
            ),
          CustomRadioTile(
            id: "tail_section_6",
            title: "Bottom Bearings",
            values: const ['Yes', 'No', 'Bushings'],
            onChangeValue: (value) {
              setState(() {
                beltVariable.tailSectionFootAssemblyBottomBearings = value;
              });
              widget.beltModel.tailSectionFootAssemblyBottomBearings =
                  jsonData["tail_section_foot_assembly_bottom_bearings"][value];
            },
          ),
          if (beltVariable.tailSectionFootAssemblyBottomBearings == 'yes' ||
              beltVariable.tailSectionFootAssemblyBottomBearings == 'bushings')
            CustomRadioTile(
              id: "tail_section_7",
              title: "Bottom Bearing Condition",
              values: const [
                "OK",
                "Worn, but OK",
                "Replace Damaged",
                "Replace Worn"
              ],
              onChangeValue: (value) {
                widget.beltModel
                    .tailSectionFootAssemblyBottomBearingsCondition = jsonData[
                        "tail_section_foot_assembly_bottom_bearings_condition"]
                    [value];
              },
            ),
          if (beltVariable.tailSectionFootAssemblyBottomBearings == 'yes' ||
              beltVariable.tailSectionFootAssemblyBottomBearings == 'bushings')
            CustomRadioTile(
              id: "tail_section_8",
              title: "Bearing Housing Condition",
              values: const [
                "OK",
                "Worn, but OK",
                "Replace Damaged",
                "Replace Worn"
              ],
              onChangeValue: (value) {
                widget.beltModel
                    .tailSectionFootAssemblyBearingHousingCondition = jsonData[
                        "tail_section_foot_assembly_bearing_housing_condition"]
                    [value];
              },
            ),
          CustomTextField(
            id: "tail_section_9",
            title: 'Foot Shaft Diameter',
            onChanged: (val) {
              widget.beltModel.tailSectionFootAssemblyFootShaftDiameter = val;
            },
          ),
          CustomTextField(
            id: "tail_section_10",
            title: 'Foot Shaft Length',
            onChanged: (val) {
              widget.beltModel.tailSectionFootAssemblyFootShaftLength = val;
            },
          ),
          CustomRadioTile(
            id: "tail_section_11",
            title: "Foot Shaft Condition",
            values: const [
              "OK",
              "Worn, but OK",
              "Replace Damaged",
              "Replace Worn"
            ],
            onChangeValue: (value) {
              widget.beltModel.tailSectionFootAssemblyFootShaftCondition =
                  jsonData["tail_section_foot_assembly_foot_shaft_condition"]
                      [value];
            },
          ),
          CustomRadioTile(
            id: "tail_section_12",
            title: "Does Foot Shaft Have",
            values: const ['Key', 'Bushing', 'Set Screws'],
            onChangeValue: (value) {
              widget.beltModel.tailSectionFootAssemblyDoesFootShaftHave =
                  jsonData["tail_section_foot_assembly_does_foot_shaft_have"]
                      [value];
            },
          ),
          CustomTextField(
            id: "tail_section_13",
            title: 'Distance From Floor to Center Line of Foot Shaft:',
            onChanged: (val) {
              widget.beltModel
                      .tailSectionFootAssemblyDistanceFromFloorToCenterlineOfFootShaft =
                  val;
            },
          ),
          CustomRadioTile(
            id: "tail_section_14",
            title: "Pulley Condition",
            values: const [
              "OK",
              "Worn, but OK",
              "Replace Damaged",
              "Replace Worn"
            ],
            onChangeValue: (value) {
              widget.beltModel.tailSectionFootAssemblyFootPulleyCondition =
                  jsonData["tail_section_foot_assembly_foot_pulley_condition"]
                      [value];
            },
          ),
          CustomRadioTile(
            id: "tail_section_15",
            title: "Type of Belt Adjustment",
            values: const ["Floating", "Manual"],
            onChangeValue: (value) {
              widget.beltModel.tailSectionFootAssemblyTypeOfBeltAdjustment =
                  jsonData["tail_section_foot_assembly_type_of_belt_adjustment"]
                      [value];
            },
          ),
          CustomRadioTile(
            id: "tail_section_16",
            title: "Is Foot Pulley Centered",
            values: const ["Yes", "NO"],
            onChangeValue: (value) {
              widget.beltModel.tailSectionFootAssemblyIsFootPulleyCentered =
                  jsonData["tail_section_foot_assembly_is_foot_pulley_centered"]
                      [value];
            },
          ),
          CustomRadioTile(
            id: "tail_section_17",
            title: "Belt Tracking",
            values: const ["OK", "Off"],
            onChangeValue: (value) {
              setState(() {
                beltVariable.tailSectionFootAssemblyBeltTracking = value;
              });
              widget.beltModel.tailSectionFootAssemblyBeltTracking =
                  jsonData["tail_section_foot_assembly_belt_tracking"][value];
            },
          ),
          if (beltVariable.tailSectionFootAssemblyBeltTracking == 'ok')
            CustomRadioTile(
              id: "tail_section_18",
              values: const ["up", "down"],
              onChangeValue: (value) {},
              valueStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          if (beltVariable.tailSectionFootAssemblyBeltTracking == 'ok')
            CustomRadioTile(
              id: "tail_section_19",
              values: const ["left", "right"],
              onChangeValue: (value) {},
              valueStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          CustomRadioTile(
            id: "tail_section_20",
            title: "Debris Deflector",
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              setState(() {
                beltVariable.tailSectionFootAssemblyDebrisDeflector = value;
              });
              widget.beltModel.tailSectionFootAssemblyDebrisDeflector =
                  jsonData["tail_section_foot_assembly_debris_deflector"]
                      [value];
            },
          ),
          if (beltVariable.tailSectionFootAssemblyDebrisDeflector == 'yes')
            CustomRadioTile(
              id: "tail_section_21",
              title: "Debris Deflector Condition",
              values: const ["OK", "Replace Damaged", "Replace Worn"],
              onChangeValue: (value) {
                widget.beltModel
                    .tailSectionFootAssemblyDebrisDeflectorCondition = jsonData[
                        "tail_section_foot_assembly_debris_deflector_condition"]
                    [value];
              },
            ),
          CustomRadioTile(
            id: "tail_section_22",
            title: "Rope Sheaves",
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              setState(() {
                beltVariable.tailSectionFootAssemblyRopeSheaves = value;
              });
              widget.beltModel.tailSectionFootAssemblyRopeSheaves =
                  jsonData["tail_section_foot_assembly_rope_sheaves"][value];
            },
          ),
          if (beltVariable.tailSectionFootAssemblyRopeSheaves == "yes")
            CustomRadioTile(
              id: "tail_section_22",
              title: "Rope Sheaves Condition",
              values: const ["OK", "Replace Damaged", "Replace Worn"],
              onChangeValue: (value) {
                widget.beltModel.tailSectionFootAssemblyRopeSheavesCondition =
                    jsonData[
                            "tail_section_foot_assembly_rope_sheaves_condition"]
                        [value];
              },
            ),
          if (beltVariable.tailSectionFootAssemblyRopeSheaves == "no")
            CustomRadioTile(
              id: "tail_section_23",
              title: "Yoke Assembly",
              values: const ["Yes", "No"],
              onChangeValue: (value) {
                setState(() {
                  beltVariable.tailSectionFootAssemblyYokeAssembly = value;
                });
                widget.beltModel.tailSectionFootAssemblyYokeAssembly =
                    jsonData["tail_section_foot_assembly_yoke_assembly"][value];
              },
            ),
          if (beltVariable.tailSectionFootAssemblyYokeAssembly == "yes")
            CustomRadioTile(
              id: "tail_section_24",
              title: "Yoke Assembly Condition",
              values: const ["OK", "Replace Damaged", "Replace Worn"],
              onChangeValue: (value) {},
            ),
          CustomTextField(
            id: "tail_section_25",
            title: "Tail Section/ Foot Assembly Comments",
            onChanged: (val) {
              widget.beltModel.tailSectionFootAssemblyComments = val;
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
          )
        ],
      ),
    );
  }
}
