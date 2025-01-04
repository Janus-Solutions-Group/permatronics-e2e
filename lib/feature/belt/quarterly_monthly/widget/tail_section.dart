import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../pages/belt_quaterly.dart';

class TailSectionFootAssembly extends StatefulWidget {
  const TailSectionFootAssembly(
      {super.key, required this.pageController, required this.beltModel});

  final PageController pageController;
  final BeltInspection beltModel;

  @override
  State<TailSectionFootAssembly> createState() =>
      _TailSectionFootAssemblyState();
}

class _TailSectionFootAssemblyState extends State<TailSectionFootAssembly>
    with AutomaticKeepAliveClientMixin {
  final tailSectionComment = TextEditingController();
  var beltVariable = BeltInspection();
  final _formKey = GlobalKey<FormState>();

  int idIndex = 0;
  String getId() {
    String id = "tail_section_$idIndex";
    setState(() {
      idIndex++;
    });
    return id;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var jsonData = BeltJson.of(context)!.data;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormHeaderTitle(title: "Tail Section/ Foot Assembly"),
            CustomRadioTile(
              title: "Leg Condition",
              id: "tail_section_1",
              values: const [
                "OK",
                "Worn, but OK",
                "Replace Damaged",
                "Replace Worn"
              ],
              type: beltVariable.tailSectionFootAssemblyLegCondition,
              onChangeValue: (value) {
                widget.beltModel.tailSectionFootAssemblyLegCondition =
                    jsonData["tail_section_foot_assembly_leg_condition"][value];
              },
            ),
            CustomRadioTile(
              title: "Leg Anchors",
              id: "tail_section_2",
              values: const ['Yes', 'No'],
              type: beltVariable.tailSectionFootAssemblyLegAnchors,
              onChangeValue: (value) {
                setState(() {
                  beltVariable.tailSectionFootAssemblyLegAnchors = value;
                });
                widget.beltModel.tailSectionFootAssemblyLegAnchors =
                    jsonData["tail_section_foot_assembly_leg_anchors"][value];
              },
            ),
            if (beltVariable.tailSectionFootAssemblyLegAnchors == 'yes' ||
                GetStorage().read('tail_section_2') == 'yes')
              CustomRadioTile(
                title: "Legs Anchored to",
                id: "tail_section_3",
                values: const ['Concrete', 'Steel'],
                onChangeValue: (value) {
                  widget.beltModel.tailSectionFootAssemblyLegsAnchoredTo =
                      jsonData["tail_section_foot_assembly_legs_anchored_to"]
                          [value];
                },
              ),
            CustomRadioTile(
              title: "Bottom Circle Condition",
              id: "tail_section_4",
              values: const [
                "OK",
                "Worn, but OK",
                "Replace Damaged",
                "Replace Worn"
              ],
              onChangeValue: (value) {
                widget.beltModel
                    .tailSectionFootAssemblyBottomCircleCondition = jsonData[
                        'tail_section_foot_assembly_bottom_circle_condition']
                    [value];
              },
            ),
            CustomRadioTile(
              title: "Bearing Housing Condition",
              id: "tail_section_5",
              values: const [
                "OK",
                "Worn, but OK",
                "Replace Damaged",
                "Replace Worn"
              ],
              onChangeValue: (value) {
                widget.beltModel
                    .tailSectionFootAssemblyBearingHousingCondition = jsonData[
                        'tail_section_foot_assembly_bearing_housing_condition']
                    [value];
              },
            ),
            CustomRadioTile(
              title: "Foot Shaft Condition",
              id: "tail_section_6",
              values: const [
                "OK",
                "Worn, but OK",
                "Replace Damaged",
                "Replace Worn"
              ],
              onChangeValue: (value) {
                widget.beltModel.tailSectionFootAssemblyFootShaftCondition =
                    jsonData['tail_section_foot_assembly_foot_shaft_condition']
                        [value];
              },
            ),
            CustomRadioTile(
              title: "Foot Pulley Condition",
              id: "tail_section_7",
              values: const [
                "OK",
                "Worn, but OK",
                "Replace Damaged",
                "Replace Worn"
              ],
              onChangeValue: (value) {
                widget.beltModel.tailSectionFootAssemblyFootPulleyCondition =
                    jsonData['tail_section_foot_assembly_foot_pulley_condition']
                        [value];
              },
            ),
            CustomRadioTile(
              title: "Type of Belt Adjustment",
              id: "tail_section_8",
              values: const ["Floating", "Manual"],
              onChangeValue: (value) {
                widget.beltModel
                    .tailSectionFootAssemblyTypeOfBeltAdjustment = jsonData[
                        'tail_section_foot_assembly_type_of_belt_adjustment']
                    [value];
              },
            ),
            CustomRadioTile(
              title: "Is Foot Pulley Centered",
              id: "tail_section_9",
              values: const ["Yes", "NO"],
              onChangeValue: (value) {
                widget.beltModel
                    .tailSectionFootAssemblyIsFootPulleyCentered = jsonData[
                        'tail_section_foot_assembly_is_foot_pulley_centered']
                    [value];
              },
            ),
            CustomRadioTile(
              title: "Belt Tracking",
              id: "tail_section_10",
              values: const ["OK", "Off"],
              onChangeValue: (value) {
                setState(() {
                  beltVariable.tailSectionFootAssemblyBeltTracking = value;
                });
                widget.beltModel.driveAssemblyBeltTracking =
                    jsonData['tail_section_foot_assembly_belt_tracking'][value];
              },
            ),
            if (beltVariable.tailSectionFootAssemblyBeltTracking == 'ok')
              CustomRadioTile(
                values: const ["up", "down"],
                id: "tail_section_11",
                onChangeValue: (value) {},
                valueStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            if (beltVariable.tailSectionFootAssemblyBeltTracking == 'ok')
              CustomRadioTile(
                values: const ["left", "right"],
                id: "tail_section_12",
                onChangeValue: (value) {},
                valueStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            CustomRadioTile(
              title: "Debris Deflector",
              id: "tail_section_13",
              values: const ["Yes", "No"],
              onChangeValue: (value) {
                setState(() {
                  beltVariable.tailSectionFootAssemblyDebrisDeflector = value;
                });
                widget.beltModel.tailSectionFootAssemblyDebrisDeflector =
                    jsonData['tail_section_foot_assembly_debris_deflector']
                        [value];
              },
            ),
            if (beltVariable.tailSectionFootAssemblyDebrisDeflector == 'yes')
              CustomRadioTile(
                title: "Debris Deflector Condition",
                id: "tail_section_14",
                values: const ["Replace Damaged", "Replace Worn"],
                onChangeValue: (value) {
                  widget.beltModel
                      .tailSectionFootAssemblyDebrisDeflectorCondition = jsonData[
                          'tail_section_foot_assembly_debris_deflector_condition']
                      [value];
                },
              ),
            CustomRadioTile(
              title: "Rope Sheaves",
              id: "tail_section_15",
              values: const ["Yes", "No"],
              onChangeValue: (value) {
                setState(() {
                  beltVariable.tailSectionFootAssemblyRopeSheaves = value;
                });
                widget.beltModel.tailSectionFootAssemblyRopeSheaves =
                    jsonData['tail_section_foot_assembly_rope_sheaves'][value];
              },
            ),
            if (beltVariable.tailSectionFootAssemblyRopeSheaves == "yes")
              CustomRadioTile(
                title: "Rope Sheaves Condition",
                id: "tail_section_16",
                values: const ["Replace Damaged", "Replace Worn"],
                onChangeValue: (value) {
                  widget.beltModel
                      .tailSectionFootAssemblyRopeSheavesCondition = jsonData[
                          'tail_section_foot_assembly_rope_sheaves_condition']
                      [value];
                },
              ),
            if (beltVariable.tailSectionFootAssemblyRopeSheaves == "no")
              CustomRadioTile(
                title: "Yoke Assembly",
                id: "tail_section_17",
                values: const ["Yes", "No"],
                onChangeValue: (value) {
                  widget.beltModel.tailSectionFootAssemblyYokeAssembly =
                      jsonData['tail_section_foot_assembly_yoke_assembly']
                          [value];
                },
              ),
            if (beltVariable.tailSectionFootAssemblyYokeAssembly == "yes")
              CustomRadioTile(
                title: "Yoke Assembly Condition",
                id: "tail_section_18",
                values: const ["Replace Damaged", "Replace Worn"],
                onChangeValue: (value) {
                  //TODO - MISING IN JSON
                  // widget.beltModel
                  //     .yokeasse = jsonData[
                  //         'tail_section_foot_assembly_foot_pulley_condition']
                  //     [value];
                },
              ),
            CustomTextField(
              title: "Tail Section/ Foot Assembly Comments",
              id: "tail_section_19",
              controller: tailSectionComment,
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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
