import 'package:flutter/material.dart';
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

  final _formKey = GlobalKey<FormState>();

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
              id: "Leg Condition",
              values: const [
                "OK",
                "Worn, but OK",
                "Replace Damaged",
                "Replace Worn"
              ],
              onChangeValue: (value) {
                widget.beltModel.tailSectionFootAssemblyLegCondition =
                    jsonData["tail_section_foot_assembly_leg_condition"][value];
              },
            ),
            CustomRadioTile(
              title: "Leg Anchors",
              id: "Leg Anchors",
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.tailSectionFootAssemblyLegAnchors =
                    jsonData["tail_section_foot_assembly_leg_anchors"][value];
              },
            ),
            CustomRadioTile(
              title: "Legs Anchored to",
              id: "Legs Anchored to",
              values: const ['Concrete', 'Steel'],
              onChangeValue: (value) {
                widget.beltModel.tailSectionFootAssemblyLegsAnchoredTo =
                    jsonData["tail_section_foot_assembly_legs_anchored_to"]
                        [value];
              },
            ),
            CustomRadioTile(
              title: "Bottom Circle Condition",
              id: "Bottom Circle Condition",
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
              id: "Bearing Housing Condition",
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
              id: "Foot Shaft Condition",
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
              id: "Foot Pulley Condition",
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
              id: "Type of Belt Adjustment",
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
              id: "Is Foot Pulley Centered",
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
              id: "Belt Tracking",
              values: const ["OK", "Off"],
              onChangeValue: (value) {
                widget.beltModel.driveAssemblyBeltTracking =
                    jsonData['tail_section_foot_assembly_belt_tracking'][value];
              },
            ),
            CustomRadioTile(
              values: const ["\u2191", "\u2193"],
              onChangeValue: (value) {},
              valueStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
            CustomRadioTile(
              values: const ["\u2190", "\u2192"],
              onChangeValue: (value) {},
              valueStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
            CustomRadioTile(
              title: "Debris Deflector",
              id: "Debris Deflector",
              values: const ["Yes", "No"],
              onChangeValue: (value) {
                widget.beltModel.tailSectionFootAssemblyDebrisDeflector =
                    jsonData['tail_section_foot_assembly_debris_deflector']
                        [value];
              },
            ),
            CustomRadioTile(
              title: "Debris Deflector Condition",
              id: "Debris Deflector Condition",
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
              id: "Rope Sheaves",
              values: const ["Yes", "No"],
              onChangeValue: (value) {
                widget.beltModel.tailSectionFootAssemblyRopeSheaves =
                    jsonData['tail_section_foot_assembly_rope_sheaves'][value];
              },
            ),
            CustomRadioTile(
              title: "Rope Sheaves Condition",
              id: "Rope Sheaves Condition",
              values: const ["Replace Damaged", "Replace Worn"],
              onChangeValue: (value) {
                widget.beltModel.tailSectionFootAssemblyRopeSheavesCondition =
                    jsonData[
                            'tail_section_foot_assembly_rope_sheaves_condition']
                        [value];
              },
            ),
            CustomRadioTile(
              title: "Yoke Assembly",
              id: "Yoke Assembly",
              values: const ["Yes", "No"],
              onChangeValue: (value) {
                widget.beltModel.tailSectionFootAssemblyYokeAssembly =
                    jsonData['tail_section_foot_assembly_yoke_assembly'][value];
              },
            ),
            CustomRadioTile(
              title: "Yoke Assembly Condition",
              id: "Yoke Assembly Condition",
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
