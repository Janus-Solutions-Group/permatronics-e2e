import 'package:flutter/material.dart';
import 'package:manlift_app/data/models/original_model.dart';
import 'package:manlift_app/feature/cage/model/cage_model.dart';
import 'package:manlift_app/feature/cage/quarterly/cage_quaterly.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/multiple_selection_widget.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class PitInspectionForm extends StatelessWidget {
  PitInspectionForm(
      {super.key, required this.pageController, required this.cageModel});

  final PageController pageController;
  final CageInspection cageModel;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var jsonData = CageQuarterlyJson.of(context)!.data;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormHeaderTitle(title: "PIT"),
            CustomRadioTile(
              id: 'pit_1',
              title: "Clean",
              values: const ["YES", "NO"],
              onChangeValue: (value) {
                cageModel.clean = jsonData['clean'][value];
              },
            ),
            // CustomRadioTile(
            //   id: 'pit_2',
            //   title: "Pit Switch",
            //   values: const ["YES", "NO", "Inoperable"],
            //   onChangeValue: (value) {
            //     cageModel.pitSwitch = jsonData['pit_switch'][value];
            //   },
            // ),
            MultipleSelectionWidget(
              original: OriginalModel(
                id: 'pit_2',
                title: "Pit Switch",
                values: const ["YES", "NO", "Inoperable"],
              ),
              onSelectionChanged: (val) {
                String res = "";
                for (var e in val) {
                  res += jsonData['pit_switch'][e] + "\n";
                }
                cageModel.pitSwitch = res;
              },
            ),
            CustomRadioTile(
              id: 'pit_3',
              title: "Switch Location",
              values: const ["OK", "Relocate"],
              isTextField: true,
              fieldLabelTitle: 'Reason',
              onChangeValue: (value) {
                cageModel.switchLocation = jsonData['switch_location'][value];
              },
            ),
            // CustomRadioTile(
            //   id: 'pit_4',
            //   title: "Pit Light",
            //   values: const ["YES", "NO", "Inoperable"],
            //   onChangeValue: (value) {
            //     cageModel.pitLight = jsonData['pit_light'][value];
            //   },
            // ),
            MultipleSelectionWidget(
              original: OriginalModel(
                id: 'pit_4',
                title: "Pit Light",
                values: const ["YES", "NO", "Inoperable"],
              ),
              onSelectionChanged: (val) {
                String res = "";
                for (var e in val) {
                  res += jsonData['pit_light'][e] + "\n";
                }
                cageModel.pitLight = res;
              },
            ),
            // CustomRadioTile(
            //   id: 'pit_5',
            //   title: "Pit Light Switch",
            //   values: const ["YES", "NO", "Inoperable"],
            //   onChangeValue: (value) {
            //     cageModel.pitLightSwitch = jsonData['pit_light_switch'][value];
            //   },
            // ),
            MultipleSelectionWidget(
              original: OriginalModel(
                id: 'pit_5',
                title: "Pit Light Switch",
                values: const ["YES", "NO", "Inoperable"],
              ),
              onSelectionChanged: (val) {
                String res = "";
                for (var e in val) {
                  res += jsonData['pit_light_switch'][e] + "\n";
                }
                cageModel.pitLightSwitch = res;
              },
            ),
            // CustomRadioTile(
            //   id: 'pit_6',
            //   title: "Governor Cable Tensioner Description",
            //   values: const ["Weighted", "Spring", "Screw"],
            //   onChangeValue: (value) {
            //     cageModel.governorCableTensioner =
            //         jsonData['governor_cable_tensioner'][value];
            //   },
            // ),
            MultipleSelectionWidget(
              original: OriginalModel(
                id: 'pit_6',
                title: "Governor Cable Tensioner Description",
                values: const ["Weighted", "Spring", "Screw"],
              ),
              onSelectionChanged: (val) {
                String res = "";
                for (var e in val) {
                  res += jsonData['governor_cable_tensioner'][e] + "\n";
                }
                cageModel.governorCableTensioner = res;
              },
            ),
            CustomRadioTile(
              id: 'pit_7',
              title: "Condition",
              values: const ["Ok", "Replace"],
              onChangeValue: (value) {
                cageModel.conditionGovernorCableTensioner =
                    jsonData['condition_governor_cable_tensioner'][value];
              },
            ),
            CustomRadioTile(
              id: 'pit_8',
              title: "Bottom Normal Terminal",
              values: const ["Ok", "inoperable", "Replace", "None"],
              onChangeValue: (value) {
                cageModel.bottomNormalTerminal =
                    jsonData['bottom_normal_terminal'][value];
              },
            ),
            CustomRadioTile(
              id: 'pit_9',
              title: "Bottom Final Terminal:",
              values: const ["Ok", "inoperable", "Replace", "None"],
              onChangeValue: (value) {
                cageModel.bottomFinalTerminal =
                    jsonData['bottom_final_terminal'][value];
              },
            ),
            CustomTextField(
              id: 'pit_10',
              title: 'Pit Comment',
              onChanged: (value) {
                cageModel.pitComments = value;
              },
            ),
            CustomRadioTile(
              id: 'pit_11',
              title: "Travel Cable Connection and Condition:",
              values: const ["Ok", "Replace"],
              isTextField: true,
              fieldValue: 'replace',
              fieldLabelTitle: 'Reason',
              onChangeValue: (value) {
                cageModel.travelCableConnectionAndCondition =
                    jsonData['travel_cable_connection_and_condition'][value];
              },
            ),
            CustomRadioTile(
              id: 'pit_12',
              title: "Safety Type",
              values: const ["Type'A'", "Slack"],
              onChangeValue: (value) {
                cageModel.safetyType = jsonData['safety_type'][value];
              },
            ),
            CustomRadioTile(
              id: 'pit_13',
              title: "Safety Location",
              values: const ["Top of Car", "Bottom of Car"],
              onChangeValue: (value) {
                cageModel.safetyLocation = jsonData['safety_location'][value];
              },
            ),
            CustomRadioTile(
              id: 'pit_14',
              title: "Safety Condition",
              values: const ["OK", "Frozen", "Replace", "Yes", "No"],
              isTextField: true,
              fieldLabelTitle: 'If not, Why:',
              onChangeValue: (value) {
                cageModel.safetyCondition = jsonData['safety_condition'][value];
              },
            ),
            // CustomRadioTile(
            //   id: 'pit_15',
            //   title: "Switch on Safeties:",
            //   values: const ["Yes", "No", "Inoperable"],
            //   isTextField: true,
            //   fieldLabelTitle: 'If not, Why:',
            //   onChangeValue: (value) {
            //     cageModel.switchOnSafeties =
            //         jsonData['switch_on_safeties'][value];
            //   },
            // ),
            MultipleSelectionWidget(
              original: OriginalModel(
                id: 'pit_15',
                title: "Switch on Safeties:",
                values: const ["Yes", "No", "Inoperable"],
              ),
              onSelectionChanged: (val) {
                String res = "";
                for (var e in val) {
                  res += jsonData['switch_on_safeties'][e] + "\n";
                }
                cageModel.switchOnSafeties = res;
              },
            ),
            // CustomRadioTile(
            //   id: 'pit_16',
            //   title: "Car Guide Type:",
            //   values: const ["Steel", "UHMW Inserts", "Rollers"],
            //   onChangeValue: (value) {
            //     cageModel.carGuideType = jsonData['car_guide_type'][value];
            //   },
            // ),
            MultipleSelectionWidget(
              original: OriginalModel(
                id: 'pit_16',
                title: "Car Guide Type:",
                values: const ["Steel", "UHMW Inserts", "Rollers"],
              ),
              onSelectionChanged: (val) {
                String res = "";
                for (var e in val) {
                  res += jsonData['car_guide_type'][e] + "\n";
                }
                cageModel.carGuideType = res;
              },
            ),
            CustomRadioTile(
              id: 'pit_17',
              title: "Condition",
              values: const ["OK", "Replace"],
              onChangeValue: (value) {
                cageModel.carGuideCondition =
                    jsonData['car_guide_condition'][value];
              },
            ),
            // CustomRadioTile(
            //   id: 'pit_18',
            //   title: "CW Guide Type",
            //   values: const ["Steel", "UHMW Inserts", "Rollers"],
            //   onChangeValue: (value) {
            //     cageModel.cwGuideType = jsonData['cw_guide_type'][value];
            //   },
            // ),
            MultipleSelectionWidget(
              original: OriginalModel(
                id: 'pit_18',
                title: "CW Guide Type",
                values: const ["Steel", "UHMW Inserts", "Rollers"],
              ),
              onSelectionChanged: (val) {
                String res = "";
                for (var e in val) {
                  res += jsonData['cw_guide_type'][e] + "\n";
                }
                cageModel.cwGuideType = res;
              },
            ),
            CustomRadioTile(
              id: 'pit_19',
              title: "Condition",
              values: const ["OK", "Worn, but OK", "Replace"],
              onChangeValue: (value) {
                cageModel.cwCondition = jsonData['cw_condition'][value];
              },
            ),
            CustomRadioTile(
              id: 'pit_20',
              title: "Hoistway Ladder: ",
              values: const ["Yes", "No"],
              onChangeValue: (value) {
                cageModel.hoistwayLadder = jsonData['hoistway_ladder'][value];
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PageNavigationButton(
                  pageController: pageController,
                  right: false,
                ),
                PageNavigationButton(
                  pageController: pageController,
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
