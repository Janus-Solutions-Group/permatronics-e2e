import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../pages/belt_quaterly.dart';

import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

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
  String? legCondition;
  String? legAnchors;
  String? legAnchoredTo;
  String? bottomCircleCondition;
  String? bearingHousingCondition;
  String? footShaftCondition;
  String? footPulleyCondition;
  String? typeOfBeltAdjustment;
  String? isFootPulleyCentered;
  String? beltTracking;
  String? debrisDeflector;
  String? debrisDeflectorCondition;
  String? ropeSheaves, ropeSheavesCondition, yokeAssembly, yokeAssemblyConditon;
  final tailSectionComment = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String ans = "";

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
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                widget.beltModel.tailSectionFootAssemblyLegAnchors =
                    jsonData["tail_section_foot_assembly_leg_anchors"][value];
              },
            ),
            CustomRadioTile(
              title: "Legs Anchored to",
              values: const ['Concrete', 'Steel'],
              onChangeValue: (value) {
                widget.beltModel.tailSectionFootAssemblyLegsAnchoredTo =
                    jsonData["tail_section_foot_assembly_legs_anchored_to"]
                        [value];
              },
            ),
            CustomRadioTile(
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
                        'tail_section_foot_assembly_bottom_circle_condition']
                    [value];
              },
            ),
            CustomRadioTile(
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
                        'tail_section_foot_assembly_bearing_housing_condition']
                    [value];
              },
            ),
            CustomRadioTile(
              title: "Foot Shaft Condition",
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
              values: const ["Yes", "No"],
              onChangeValue: (value) {
                widget.beltModel.tailSectionFootAssemblyDebrisDeflector =
                    jsonData['tail_section_foot_assembly_debris_deflector']
                        [value];
              },
            ),
            CustomRadioTile(
              title: "Condition",
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
              values: const ["Yes", "No"],
              onChangeValue: (value) {
                widget.beltModel.tailSectionFootAssemblyRopeSheaves =
                    jsonData['tail_section_foot_assembly_rope_sheaves'][value];
              },
            ),
            CustomRadioTile(
              title: "Rope Sheaves Condition",
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
              values: const ["Yes", "No"],
              onChangeValue: (value) {
                widget.beltModel.tailSectionFootAssemblyYokeAssembly =
                    jsonData['tail_section_foot_assembly_yoke_assembly'][value];
              },
            ),
            CustomRadioTile(
              title: "Condition",
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
