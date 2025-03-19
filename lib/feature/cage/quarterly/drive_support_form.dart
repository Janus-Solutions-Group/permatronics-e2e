import 'package:flutter/material.dart';
import 'package:manlift_app/data/models/original_model.dart';
import 'package:manlift_app/feature/cage/model/cage_model.dart';
import 'package:manlift_app/feature/cage/quarterly/cage_quaterly.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/multiple_selection_widget.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../../common/widgets/page_navigation_button.dart';

class DriveSupportForm extends StatelessWidget {
  const DriveSupportForm(
      {super.key, required this.pageController, required this.cageModel});

  final PageController pageController;
  final CageInspection cageModel;

  @override
  Widget build(BuildContext context) {
    var jsonData = CageQuarterlyJson.of(context)!.data;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FormHeaderTitle(title: "DRIVE SUPPORT"),
          CustomTextField(
            id: 'drive_support_form_1',
            title: 'Description',
          ),
          // CustomRadioTile(
          //   id: 'drive_support_form_2',
          //   title: 'Top Normal Terminal:',
          //   values: const ["Yes", "No", "Inoperable", "Replace"],
          //   onChangeValue: (value) {
          //     cageModel.driveSupportTopNormalTerminal =
          //         jsonData['drive_support']['top_normal_terminal'][value];
          //   },
          // ),
          MultipleSelectionWidget(
            original: OriginalModel(
              id: 'drive_support_form_2',
              title: 'Top Normal Terminal:',
              values: const ["Yes", "No", "Inoperable", "Replace"],
            ),
            onSelectionChanged: (val) {
              String res = "";
              for (var e in val) {
                res +=
                    jsonData['drive_support']['top_normal_terminal'][e] + "\n";
              }
              cageModel.driveSupportTopNormalTerminal = res;
            },
          ),
          // CustomRadioTile(
          //   id: 'drive_support_form_3',
          //   title: 'Top Final Terminal:',
          //   values: const ["Yes", "No", "Inoperable", "Replace"],
          //   onChangeValue: (value) {
          //     cageModel.driveSupportTopFinalTerminal =
          //         jsonData['drive_support']['top_final_terminal'][value];
          //   },
          // ),
          MultipleSelectionWidget(
            original: OriginalModel(
              id: 'drive_support_form_3',
              title: 'Top Final Terminal:',
              values: const ["Yes", "No", "Inoperable", "Replace"],
            ),
            onSelectionChanged: (val) {
              String res = "";
              for (var e in val) {
                res +=
                    jsonData['drive_support']['top_final_terminal'][e] + "\n";
              }
              cageModel.driveSupportTopFinalTerminal = res;
            },
          ),
          CustomRadioTile(
            id: 'drive_support_form_4',
            title: 'Governor Guard:',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              cageModel.driveSupportGovernorGuard =
                  jsonData['drive_support']['governor_guard'][value];
            },
          ),
          CustomRadioTile(
            id: 'drive_support_form_5',
            title: 'Sheave Guard',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              cageModel.driveSupportSheaveGuard =
                  jsonData['drive_support']['sheave_guard'][value];
            },
          ),
          // CustomRadioTile(
          //   id: 'drive_support_form_6',
          //   title: 'Governor Condition',
          //   values: const ["OK", "Inoperable", "Replace"],
          //   isTextField: true,
          //   fieldLabelTitle: "Why",
          //   onChangeValue: (value) {
          //     cageModel.driveSupportGovernorCondition =
          //         jsonData['drive_support']['governor_condition'][value];
          //   },
          // ),
          MultipleSelectionWidget(
            original: OriginalModel(
              id: 'drive_support_form_6',
              title: 'Governor Condition',
              values: const ["OK", "Inoperable", "Replace"],
            ),
            onSelectionChanged: (val) {
              String res = "";
              for (var e in val) {
                res +=
                    jsonData['drive_support']['governor_condition'][e] + "\n";
              }
              cageModel.driveSupportGovernorCondition = res;
            },
          ),
          CustomRadioTile(
            id: 'drive_support_form_7',
            title: 'Bale Flip:',
            values: const ["Easy", "Hard"],
            isTextField: true,
            fieldLabelTitle: "Why",
            onChangeValue: (value) {
              cageModel.driveSupportBaleFlip =
                  jsonData['drive_support']['bale_flip'][value];
            },
          ),
          CustomRadioTile(
            id: 'drive_support_form_8',
            title: 'Governor Switch',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              cageModel.driveSupportGovernorSwitch =
                  jsonData['drive_support']['governor_switch'][value];
            },
          ),
          CustomRadioTile(
            id: 'drive_support_form_9',
            title: 'Rope Gripper:',
            values: const ["Yes", "No", "N/A"],
            onChangeValue: (value) {
              cageModel.driveSupportRopeGripper =
                  jsonData['drive_support']['rope_gripper'][value];
            },
          ),
          // CustomRadioTile(
          //   id: 'drive_support_form_10',
          //   title: 'Rope Gripper Condition',
          //   values: const ["OK", "Inoperable", "Replace", "Other"],
          //   isTextField: true,
          //   fieldLabelTitle: "Other",
          //   onChangeValue: (value) {
          //     cageModel.driveSupportRopeGripperCondition =
          //         jsonData['drive_support']['rope_gripper_condition'][value];
          //   },
          // ),
          MultipleSelectionWidget(
            original: OriginalModel(
              id: 'drive_support_form_10',
              title: 'Rope Gripper Condition',
              values: const ["OK", "Inoperable", "Replace", "Other"],
            ),
            onSelectionChanged: (val) {
              String res = "";
              for (var e in val) {
                res += jsonData['drive_support']['rope_gripper_condition'][e] +
                    "\n";
              }
              cageModel.driveSupportRopeGripperCondition = res;
            },
          ),
          // CustomRadioTile(
          //   id: 'drive_support_form_11',
          //   title: 'Sheave Break:',
          //   values: const ["Yes", "No", "N/A"],
          //   onChangeValue: (value) {
          //     cageModel.driveSupportSheaveBreak =
          //         jsonData['drive_support']['sheave_break'][value];
          //   },
          // ),
          MultipleSelectionWidget(
            original: OriginalModel(
              id: 'drive_support_form_11',
            title: 'Sheave Break:',
            values: const ["Yes", "No", "N/A"],
            ),
            onSelectionChanged: (val) {
              String res = "";
              for (var e in val) {
                res += jsonData['drive_support']['sheave_break'][e] + "\n";
              }
              cageModel.driveSupportSheaveBreak = res;
            },
          ),
          // CustomRadioTile(
          //   id: 'drive_support_form_12',
          //   title: 'Sheave Break Condition',
          //   values: const ["OK", "Inoperable", "Replace", "Other"],
          //   isTextField: true,
          //   fieldLabelTitle: "Other",
          //   onChangeValue: (value) {
          //     cageModel.driveSupportSheaveBreakCondition =
          //         jsonData['drive_support']['sheave_break_condition'][value];
          //   },
          // ),
          MultipleSelectionWidget(
            original: OriginalModel(
                id: 'drive_support_form_12',
            title: 'Sheave Break Condition',
            values: const ["OK", "Inoperable", "Replace", "Other"],
            ),
            onSelectionChanged: (val) {
              String res = "";
              for (var e in val) {
                res += jsonData['drive_support']['sheave_break_condition'][e] + "\n";
              }
              cageModel.driveSupportSheaveBreakCondition = res;
            },
          ),
          CustomRadioTile(
            id: 'drive_support_form_13',
            title: 'Deflector Sheave',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              cageModel.driveSupportDeflectorSheave =
                  jsonData['drive_support']['deflector_sheave'][value];
            },
          ),
          CustomRadioTile(
            id: 'drive_support_form_14',
            title: 'Shaft and Bearing Condition:',
            values: const ["OK", "Replace", "Other"],
            isTextField: true,
            fieldLabelTitle: "Other",
            onChangeValue: (value) {
              cageModel.driveSupportShaftAndBearingCondition =
                  jsonData['drive_support']['shaft_and_bearing_condition']
                      [value];
            },
          ),
          
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  id: 'drive_support_form_15',
                  title: 'Couple Sizer',
                ),
              ),
              Expanded(
                child: CustomTextField(
                  id: 'drive_support_form_16',
                  title: 'Couple Type',
                ),
              ),
            ],
          ),
          CustomRadioTile(
            id: 'drive_support_form_17',
            title: 'Coupler Condition:',
            values: const ["OK", "Replace", "Other"],
            isTextField: true,
            fieldLabelTitle: "Other",
            onChangeValue: (value) {
              cageModel.driveSupportCouplerCondition =
                  jsonData['drive_support']['coupler_condition'][value];
            },
          ),
          CustomRadioTile(
            id: 'drive_support_form_18',
            title: 'Gearbox Condition:',
            values: const ["OK", "Excessive Backlash", "Monitor", "Replace"],
            isTextField: true,
            fieldLabelTitle: "Other",
            onChangeValue: (value) {
              cageModel.driveSupportGearboxCondition =
                  jsonData['drive_support']['gearbox_condition'][value];
            },
          ),
          CustomRadioTile(
            id: 'drive_support_form_19',
            title: 'Motor Condition:',
            values: const ["OK", "Replace"],
            onChangeValue: (value) {
              cageModel.driveSupportMotorCondition =
                  jsonData['drive_support']['motor_condition'][value];
            },
          ),
          CustomRadioTile(
            id: 'drive_support_form_20',
            title: 'Brake Condition',
            values: const ["OK", "Replace Friction Disks only", "Replace"],
            onChangeValue: (value) {
              cageModel.driveSupportBrakeCondition =
                  jsonData['drive_support']['brake_condition'][value];
            },
          ),
          CustomRadioTile(
            id: 'drive_support_form_21',
            title: 'Machine Disconnect:',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              cageModel.driveSupportMachineDisconnect =
                  jsonData['drive_support']['machine_disconnect'][value];
            },
          ),
          CustomRadioTile(
            id: 'drive_support_form_22',
            title: 'Overhead Lifting Supports:',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              cageModel.driveSupportOverheadLiftingSupports =
                  jsonData['drive_support']['overhead_lifting_supports'][value];
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
    );
  }
}
