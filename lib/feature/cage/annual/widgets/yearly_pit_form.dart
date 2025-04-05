import 'package:flutter/material.dart';
import 'package:manlift_app/data/models/original_model.dart';
import 'package:manlift_app/feature/cage/model/cage_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/custom_title.dart';
import 'package:manlift_app/feature/common/widgets/multiple_selection_widget.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../pages/cage_annual.dart';

class YearlyPitInspectionForm extends StatefulWidget {
  const YearlyPitInspectionForm(
      {super.key, required this.pageController, required this.cageModel});

  final PageController pageController;
  final CageInspection cageModel;

  @override
  State<YearlyPitInspectionForm> createState() =>
      _YearlyPitInspectionFormState();
}

class _YearlyPitInspectionFormState extends State<YearlyPitInspectionForm> {
  final _formKey = GlobalKey<FormState>();
  var cageInspection = CageInspection();

  @override
  Widget build(BuildContext context) {
    var jsonData = CageAnnualJson.of(context)!.data;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormHeaderTitle(title: 'PIT'),
            CustomRadioTile(
              id: 'pit_1',
              title: "Bottom Platform",
              values: const ["YES", "NO", "N/A"],
              onChangeValue: (value) {
                widget.cageModel.bottomPlatform =
                    jsonData['bottom_platform'][value];
              },
            ),
            CustomTextField(id: 'pit_2', title: "Platform Height"),
            CustomTextField(id: 'pit_3', title: "Platform Comments"),
            CustomRadioTile(
              id: 'pit_4',
              title: "Pit",
              values: const ["YES", "NO", "N/A"],
              onChangeValue: (value) {
                setState(() {
                  cageInspection.bottomPlatform = value;
                });
                widget.cageModel.pit = jsonData['pit'][value];
              },
            ),
            if (cageInspection.bottomPlatform == "yes")
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(id: 'pit_5', title: "Depth"),
                  CustomTextField(id: 'pit_6', title: "Width"),
                  CustomTextField(id: 'pit_7', title: "Length"),
                  CustomRadioTile(
                    id: 'pit_8',
                    title: "Clean",
                    values: const ["YES", "NO"],
                    onChangeValue: (value) {
                      widget.cageModel.clean = jsonData['clean'][value];
                    },
                  ),
                ],
              ),
            CustomRadioTile(
              id: 'pit_9',
              title: "Pit Switch",
              values: const ["YES", "NO", "Inoperable"],
              onChangeValue: (value) {
                setState(() {
                  cageInspection.pitSwitch = value;
                });
                widget.cageModel.pitSwitch = jsonData['pit_switch'][value];
              },
            ),
            if (cageInspection.pitSwitch == "yes")
              CustomRadioTile(
                id: 'pit_10',
                title: "Switch Location",
                values: const ["YES", "NO", "Inoperable"],
                isTextField: true,
                fieldLabelTitle: 'Reason',
                onChangeValue: (value) {
                  widget.cageModel.switchLocation =
                      jsonData['switch_location'][value];
                },
              ),
            CustomRadioTile(
              id: 'pit_11',
              title: "Pit Light",
              values: const ["YES", "NO", "Inoperable"],
              onChangeValue: (value) {
                widget.cageModel.pitLight = jsonData['pit_light'][value];
              },
            ),
            CustomRadioTile(
              id: 'pit_12',
              title: "Pit Light Switch",
              values: const ["YES", "NO", "Inoperable"],
              onChangeValue: (value) {
                widget.cageModel.pitLightSwitch =
                    jsonData['pit_light_switch'][value];
              },
            ),
            CustomRadioTile(
              id: 'pit_13',
              title: "Car Buffers:",
              values: const ["YES", "NO"],
              onChangeValue: (value) {
                setState(() {
                  cageInspection.carBuffers = value;
                });
                widget.cageModel.carBuffers = jsonData['car_buffers'][value];
              },
            ),
            if (cageInspection.carBuffers == "yes")
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRadioTile(
                    id: 'pit_14',
                    title: "How Many:",
                    values: const ["1", "2", "3"],
                    onChangeValue: (value) {
                      // widget.cageModel.howman =
                      //     jsonData['bottom_platform'][value];
                    },
                  ),
                  CustomRadioTile(
                    id: 'pit_15',
                    title: "Runby:",
                    values: const ["Compliant", "Non-compliant"],
                    onChangeValue: (value) {
                      widget.cageModel.runbyCarBuffers =
                          jsonData['runby_car_buffers'][value];
                    },
                  ),
                ],
              ),
            CustomRadioTile(
              id: 'pit_16',
              title: "Counterweight Buffers:",
              values: const ["YES", "NO"],
              onChangeValue: (value) {
                setState(() {
                  cageInspection.counterweightBuffers = value;
                });
                widget.cageModel.counterweightBuffers =
                    jsonData['counterweight_buffers'][value];
              },
            ),
            if (cageInspection.counterweightBuffers == "yes")
              CustomRadioTile(
                id: 'pit_17',
                title: "How Many:",
                values: const ["1", "2", "3"],
                onChangeValue: (value) {},
              ),
            if (cageInspection.counterweightBuffers == "yes")
              CustomRadioTile(
                id: 'pit_18',
                title: "Runby:",
                values: const ["Compliant", "Non-compliant"],
                onChangeValue: (value) {
                  widget.cageModel.runbyCounterweightBuffers =
                      jsonData['runby_counterweight_buffers'][value];
                },
              ),
            // CustomRadioTile(
            //   id: 'pit_19',
            //   title: "Governor Cable Tensioner Description",
            //   values: const ["Weighted", "Spring", "Screw"],
            //   onChangeValue: (value) {
            //     widget.cageModel.governorCableTensioner =
            //         jsonData['governor_cable_tensioner'][value];
            //   },
            // ),
            MultipleSelectionWidget(
              original: OriginalModel(
                id: 'pit_19',
                title: "Governor Cable Tensioner Description",
                values: const ["Weighted", "Spring", "Screw"],
              ),
              onSelectionChanged: (val) {
                String res = "";
                for (var e in val) {
                  res += jsonData['governor_cable_tensioner'][e] + "\n";
                }
                widget.cageModel.governorCableTensioner = res;
              },
            ),
            CustomRadioTile(
              id: 'pit_20',
              title: "Condition",
              values: const ["Ok", "Replace"],
              onChangeValue: (value) {
                widget.cageModel.conditionGovernorCableTensioner =
                    jsonData['condition_governor_cable_tensioner'][value];
              },
            ),
            CustomRadioTile(
              id: 'pit_21',
              title: "Bottom Normal Terminal",
              values: const ["Ok", "inoperable", "Replace", "None"],
              onChangeValue: (value) {
                widget.cageModel.bottomNormalTerminal =
                    jsonData['bottom_normal_terminal'][value];
              },
            ),
            CustomRadioTile(
              id: 'pit_22',
              title: "Bottom Final Terminal:",
              values: const ["Ok", "inoperable", "Replace", "None"],
              onChangeValue: (value) {
                widget.cageModel.bottomFinalTerminal =
                    jsonData['bottom_final_terminal'][value];
              },
            ),
            CustomTextField(
              id: 'pit_23',
              title: 'Pit Comment',
              onChanged: (value) {
                // widget.cageModel.pitComments = value;
              },
            ),
            const CustomTitle(title: "Under Car Size, measurement from:"),
            Row(
              children: [
                Expanded(
                    child: CustomTextField(id: 'pit_24', title: "Front/Back")),
                const Text(
                  " X  ",
                  style: TextStyle(fontSize: 16),
                ),
                Expanded(
                    child: CustomTextField(id: 'pit_25', title: "Right/Left"))
              ],
            ),
            CustomRadioTile(
              id: 'pit_26',
              title: "Travel Cable Connection and Condition:",
              values: const ["Ok", "Replace"],
              isTextField: true,
              fieldLabelTitle: 'Reason',
              onChangeValue: (value) {
                widget.cageModel.travelCableConnectionAndCondition =
                    jsonData['travel_cable_connection_and_condition'][value];
              },
            ),
            CustomRadioTile(
              id: 'pit_27',
              title: "Safety Type",
              values: const ["Type'A'", "Slack"],
              onChangeValue: (value) {
                widget.cageModel.safetyType = jsonData['safety_type'][value];
              },
            ),
            CustomRadioTile(
              id: 'pit_28',
              title: "Safety Location",
              values: const ["Top of Car'", "Bottom of Car"],
              onChangeValue: (value) {
                widget.cageModel.safetyLocation =
                    jsonData['safety_location'][value];
              },
            ),
            CustomRadioTile(
              id: 'pit_29',
              title: "Safety Condition",
              values: const ["OK", "Frozen", "Replace", "Yes", "No"],
              isTextField: true,
              fieldLabelTitle: 'If not, Why:',
              onChangeValue: (value) {
                widget.cageModel.safetyCondition =
                    jsonData['safety_condition'][value];
              },
            ),
            CustomRadioTile(
              id: 'pit_30',
              title: "Switch on Safeties:",
              values: const ["Yes", "No", "OK", "Inoperable"],
              isTextField: true,
              fieldLabelTitle: 'If not, Why:',
              onChangeValue: (value) {
                widget.cageModel.switchOnSafeties =
                    jsonData['switch_on_safeties'][value];
              },
            ),
            // CustomRadioTile(
            //   id: 'pit_31',
            //   title: "Car Guide Rails Type:",
            //   values: const ["T-Rail", "Angle", "Wood"],
            //   onChangeValue: (value) {
            //     widget.cageModel.carGuideRailsType =
            //         jsonData['car_guide_rails_type'][value];
            //   },
            // ),
            MultipleSelectionWidget(
              original: OriginalModel(
                id: 'pit_31',
                title: "Car Guide Rails Type:",
                values: const ["T-Rail", "Angle", "Wood"],
              ),
              onSelectionChanged: (val) {
                String res = "";
                for (var e in val) {
                  res += jsonData['car_guide_rails_type'][e] + "\n";
                }
                widget.cageModel.carGuideRailsType = res;
              },
            ),
            CustomTextField(id: 'pit_32', title: "Car Guide Rails Size"),
            CustomRadioTile(
              id: 'pit_33',
              title: "Condition:",
              values: const ["OK", "Replace"],
              onChangeValue: (value) {
                setState(() {
                  cageInspection.carGuideRailsCondition = value;
                });
                widget.cageModel.carGuideRailsCondition =
                    jsonData['car_guide_rails_condition'][value];
              },
            ),
            if (cageInspection.carGuideRailsCondition == "replace")
              CustomRadioTile(
                id: 'pit_34',
                title: "Why:",
                values: const ["Broken", "Worn", "Bolted", "Welded"],
                onChangeValue: (value) {
                  widget.cageModel.carGuideRailsWhy =
                      jsonData['car_guide_rails_why'][value];
                },
              ),
            CustomTextField(id: 'pit_35', title: "Car Guide Rails DBG"),
            // CustomRadioTile(
            //   id: 'pit_36',
            //   title: "Car Guide Rail Brackets",
            //   values: const ["Wooden", "Steel", "Bolted", "Welded"],
            //   onChangeValue: (value) {
            //     widget.cageModel.carGuideRailBrackets =
            //         jsonData['car_guide_rail_brackets'][value];
            //   },
            // ),
            MultipleSelectionWidget(
              original: OriginalModel(
                id: 'pit_36',
                title: "Car Guide Rail Brackets",
                values: const ["Wooden", "Steel", "Bolted", "Welded"],
              ),
              onSelectionChanged: (val) {
                String res = "";
                for (var e in val) {
                  res += jsonData['car_guide_rail_brackets'][e] + "\n";
                }
                widget.cageModel.carGuideRailBrackets = res;
              },
            ),
            CustomRadioTile(
              id: 'pit_37',
              title: "Car Guide Type:",
              values: const ["Steel", "UHMW Inserts", "Rollers"],
              onChangeValue: (value) {
                widget.cageModel.carGuideType =
                    jsonData['car_guide_type'][value];
              },
            ),
            CustomRadioTile(
              id: 'pit_38',
              title: "Condition",
              values: const ["OK", "Replace"],
              onChangeValue: (value) {
                widget.cageModel.carGuideCondition =
                    jsonData['car_guide_condition'][value];
              },
            ),
            CustomRadioTile(
              id: 'pit_39',
              title: "Counterweight Location, Facing Car",
              values: const ["Left", "Right", "Rear"],
              onChangeValue: (value) {
                widget.cageModel.counterweightLocationFacingCar =
                    jsonData['counterweight_location_facing_car'][value];
              },
            ),
            // CustomRadioTile(
            //   id: 'pit_40',
            //   title: "Counterweight Guide Rail Type",
            //   values: const ["T-Rail", "Angle", "Box", "Enclosed", "C-Channel"],
            //   onChangeValue: (value) {
            //     widget.cageModel.counterweightGuideRailType =
            //         jsonData['counterweight_guide_rail_type'][value];
            //   },
            // ),
            MultipleSelectionWidget(
              original: OriginalModel(
                id: "pit_40",
                title: "Counterweight Guide Rail Type",
                values: const [
                  "T-Rail",
                  "Angle",
                  "Box",
                  "Enclosed",
                  "C-Channel"
                ],
              ),
              onSelectionChanged: (val) {
                String res = "";
                for (var e in val) {
                  res += jsonData['counterweight_guide_rail_type'][e] + "\n";
                }
                print(res);
                widget.cageModel.counterweightGuideRailType = res;
              },
            ),

            const CustomTextField(id: 'pit_41', title: 'Size'),
            const CustomTextField(
                id: 'pit_42', title: 'Counterweight Guide Rail DBG:'),
            CustomRadioTile(
              id: 'pit_43',
              title: "Condition",
              values: const ["OK", "Other"],
              onChangeValue: (value) {
                widget.cageModel.counterweightGuideRailCondition =
                    jsonData['counterweight_guide_rail_condition'][value];
              },
              isTextField: true,
              fieldLabelTitle: "Other",
            ),
            CustomRadioTile(
              id: 'pit_44',
              title: "Counterweight Guide Rail Brackets",
              values: const ["Wooden", "Steel", "Bolted", "Welded"],
              onChangeValue: (value) {
                widget.cageModel.counterweightGuideRailBrackets =
                    jsonData['counterweight_guide_rail_brackets'][value];
              },
            ),
            CustomTextField(id: 'pit_45', title: 'CW Dimension'),
            CustomRadioTile(
              id: 'pit_46',
              title: "CW Material",
              values: const [
                "Cast",
                "Steel",
                "Solid",
                "Plates",
                "Bolted",
                "Welded"
              ],
              onChangeValue: (value) {
                widget.cageModel.cwMaterial = jsonData['cw_material'][value];
              },
            ),
            CustomRadioTile(
              id: 'pit_47',
              title: "CW Guide Type",
              values: const ["Steel", "UHMW Inserts", "Rollers"],
              onChangeValue: (value) {
                widget.cageModel.cwGuideType = jsonData['cw_guide_type'][value];
              },
            ),
            CustomRadioTile(
              id: 'pit_48',
              title: "Condition",
              values: const ["OK", "Worn, but OK", "Replace"],
              onChangeValue: (value) {
                widget.cageModel.cwCondition = jsonData['cw_condition'][value];
              },
            ),
            CustomRadioTile(
              id: 'pit_49',
              title: "Hoistway Ladder: ",
              values: const ["Yes", "No"],
              onChangeValue: (value) {
                widget.cageModel.hoistwayLadder =
                    jsonData['hoistway_ladder'][value];
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
}
