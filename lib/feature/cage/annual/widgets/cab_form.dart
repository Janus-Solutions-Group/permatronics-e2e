import 'package:flutter/material.dart';
import 'package:manlift_app/data/models/original_model.dart';
import 'package:manlift_app/feature/cage/annual/pages/cage_annual.dart';
import 'package:manlift_app/feature/cage/model/cage_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/multiple_selection_widget.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class AnnualCageCABForm extends StatelessWidget {
  const AnnualCageCABForm(
      {super.key, required this.pageController, required this.cageModel});
  final PageController pageController;
  final CageInspection cageModel;

  @override
  Widget build(BuildContext context) {
    var jsonData = CageAnnualJson.of(context)!.data;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FormHeaderTitle(title: "CAB"),
          const CustomTextField(
              id: 'cab_1', title: "Car Condition and Description:"),
          CustomRadioTile(
            id: 'cab_2',
            title: 'Cam:',
            values: const ["Retiring", "Stationary", "None"],
            onChangeValue: (value) {
              cageModel.carConditionAndDescriptionCam =
                  jsonData['car_condition_and_description']['cam'][value];
            },
          ),
          // CustomRadioTile(
          //   id: 'cab_3',
          //   title: 'Location',
          //   values: const ["Left", "Right", "Middle"],
          //   onChangeValue: (value) {
          //     cageModel.carConditionAndDescriptionLocation =
          //         jsonData['car_condition_and_description']['location'][value];
          //   },
          // ),
          MultipleSelectionWidget(
            original: OriginalModel(
              id: 'cab_3',
              title: 'Location',
              values: const ["Left", "Right", "Middle"],
            ),
            onSelectionChanged: (val) {
              String res = "";
              for (var e in val) {
                res += jsonData['car_condition_and_description']['location']
                        [e] +
                    "\n";
              }

              cageModel.carConditionAndDescriptionLocation = res;
            },
          ),
          CustomRadioTile(
            id: 'cab_4',
            title: 'Condition',
            values: const ["OK", "Replace"],
            onChangeValue: (value) {
              cageModel.carConditionAndDescriptionCondition =
                  jsonData['car_condition_and_description']['condition'][value];
            },
            conditionalBuilder: (selected) {
              if (selected == 'replace') {
                return CustomTextField(
                  id: 'cab_4a',
                  title: 'Why?',
                );
              }
              return const SizedBox.shrink();
            },
          ),
          CustomRadioTile(
            id: 'cab_5',
            title: 'Car Door Type:',
            values: const ["Bi-Fold", "Scissor", "2 PC"],
            onChangeValue: (value) {
              cageModel.carDoorType = jsonData['car_door_type'][value];
            },
          ),
          CustomRadioTile(
            id: 'cab_6',
            title: 'Material',
            values: const ["Expanded Metal", "Solid Panel"],
            onChangeValue: (value) {
              cageModel.carDoorMaterial = jsonData['car_door_material'][value];
            },
          ),
          CustomRadioTile(
            id: 'cab_7',
            title: 'Car Door Condition',
            values: const ["OK", "Replace"],
            onChangeValue: (value) {
              cageModel.carDoorCondition =
                  jsonData['car_door_condition'][value];
            },
            conditionalBuilder: (selected) {
              if (selected == 'replace') {
                return CustomTextField(
                  id: 'cab_7a',
                  title: 'Why?',
                );
              }
              return const SizedBox.shrink();
            },
          ),
          MultipleSelectionWidget(
            original: OriginalModel(
              id: 'cab_8',
              title: 'Car Door Limit',
              values: const ['Yes', 'No', 'Inoperable'],
            ),
            onSelectionChanged: (selected) {
              cageModel.carDoorLimit =
                  jsonData['car_door_limit'][selected.last];
            },
            conditionalBuilder: (selected) {
              if (selected.contains('inoperable')) {
                return CustomTextField(
                  id: 'cab_8a',
                  title: 'Why?',
                );
              }
              return const SizedBox.shrink();
            },
          ),

          CustomTextField(
            id: 'cab_9',
            title: 'How Many',
          ),
          MultipleSelectionWidget(
            original: OriginalModel(
              id: 'cab_10',
              title: 'Car Operation Controls: "UP"',
              values: const ['OK', 'Inoperable'],
            ),
            onSelectionChanged: (selected) {
              cageModel.carOperationControlsUp =
                  jsonData['car_operation_controls']['up'][selected.last];
            },
            conditionalBuilder: (selected) {
              if (selected.contains('inoperable')) {
                return CustomTextField(
                  id: 'cab_10a',
                  title: 'Why?',
                );
              }
              return const SizedBox.shrink();
            },
          ),
          MultipleSelectionWidget(
            original: OriginalModel(
              id: 'cab_11',
              title: 'Car Operation Controls: "DN"',
              values: const ['OK', 'Inoperable'],
            ),
            onSelectionChanged: (selected) {
              cageModel.carOperationControlsDown =
                  jsonData['car_operation_controls']['dn'][selected.last];
            },
            conditionalBuilder: (selected) {
              if (selected.contains('inoperable')) {
                return CustomTextField(
                  id: 'cab_11a',
                  title: 'Why?',
                );
              }
              return const SizedBox.shrink();
            },
          ),
          MultipleSelectionWidget(
            original: OriginalModel(
              id: 'cab_12',
              title: 'Car Light:',
              values: const ['Yes', 'No', 'Inoperable'],
            ),
            onSelectionChanged: (selected) {
              cageModel.carLight = jsonData['car_light'][selected.last];
            },
            conditionalBuilder: (selected) {
              if (selected.contains('inoperable')) {
                return CustomTextField(
                  id: 'cab_12a',
                  title: 'Why?',
                );
              }
              return const SizedBox.shrink();
            },
          ),
          MultipleSelectionWidget(
            original: OriginalModel(
              id: 'cab_13',
              title: 'Car Light Switch:',
              values: const ['Yes', 'No', 'Inoperable'],
            ),
            onSelectionChanged: (selected) {
              cageModel.carLightSwitch =
                  jsonData['car_light_switch'][selected.last];
            },
            conditionalBuilder: (selected) {
              if (selected.contains('inoperable')) {
                return CustomTextField(
                  id: 'cab_13a',
                  title: 'Why?',
                );
              }
              return const SizedBox.shrink();
            },
          ),
          MultipleSelectionWidget(
            original: OriginalModel(
              id: 'cab_14',
              title: 'Car Alarm:',
              values: const ['Yes', 'No', 'Inoperable'],
            ),
            onSelectionChanged: (selected) {
              cageModel.carAlarm = jsonData['car_alarm'][selected.last];
            },
            conditionalBuilder: (selected) {
              if (selected.contains('inoperable')) {
                return CustomTextField(
                  id: 'cab_14a',
                  title: 'Why?',
                );
              }
              return const SizedBox.shrink();
            },
          ),
          MultipleSelectionWidget(
            original: OriginalModel(
              id: 'cab_15',
              title: 'Car Alarm Switch:',
              values: const ['Yes', 'No', 'Inoperable'],
            ),
            onSelectionChanged: (selected) {
              cageModel.carAlarmSwitch =
                  jsonData['car_alarm_switch'][selected.last];
            },
            conditionalBuilder: (selected) {
              if (selected.contains('inoperable')) {
                return CustomTextField(
                  id: 'cab_15a',
                  title: 'Why?',
                );
              }
              return const SizedBox.shrink();
            },
          ),
          CustomRadioTile(
            id: 'cab_17',
            title: 'Capacity Signage:',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              cageModel.capacitySignage = jsonData['capacity_signage'][value];
            },
          ),
          CustomRadioTile(
            id: 'cab_18',
            title: 'Comm. Device:',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              cageModel.commDevice = jsonData['comm_device'][value];
            },
          ),
          CustomRadioTile(
            id: 'cab_19',
            title: 'Emergency Escape Hatch:',
            values: const ["Yes", "No", "N/A"],
            onChangeValue: (value) {
              cageModel.emergencyEscapeHatch =
                  jsonData['emergency_escape_hatch'][value];
            },
          ),
          MultipleSelectionWidget(
            original: OriginalModel(
              id: 'cab_20',
              title: 'Emergency Escape Hatch Switch:',
              values: const ['Yes', 'No', 'Inoperable'],
            ),
            onSelectionChanged: (selected) {
              cageModel.emergencyEscapeHatchSwitch =
                  jsonData['emergency_escape_hatch_switch'][selected.last];
            },
            conditionalBuilder: (selected) {
              if (selected.contains('inoperable')) {
                return CustomTextField(
                  id: 'cab_20a',
                  title: 'Why?',
                );
              }
              return const SizedBox.shrink();
            },
          ),
          MultipleSelectionWidget(
            original: OriginalModel(
              id: 'cab_21',
              title: 'Manual Back Up Car Alarm:',
              values: const ['Yes', 'No', 'Inoperable'],
            ),
            onSelectionChanged: (selected) {
              cageModel.manualBackupCarAlarm =
                  jsonData['manual_backup_car_alarm'][selected.last];
            },
            conditionalBuilder: (selected) {
              if (selected.contains('inoperable')) {
                return CustomTextField(
                  id: 'cab_21a',
                  title: 'Why?',
                );
              }
              return const SizedBox.shrink();
            },
          ),

          const CustomTextField(
            id: 'cab_21b',
            title: "Manual Back Up Car Alarm Type:",
          ),
          CustomRadioTile(
            id: 'cab_22',
            title: 'Data Plate',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              cageModel.manualBackupCarAlarm = jsonData['data_plate'][value];
            },
          ),
          CustomRadioTile(
            id: 'cab_23',
            title: 'Type of Cable Attachment to Car',
            values: const ["OH Sling", "1 Bolt Triangle", "Other"],
            onChangeValue: (value) {
              cageModel.manualBackupCarAlarm =
                  jsonData['type_of_cable_attachment_to_car'][value];
            },
            fieldValue: 'other',
            fieldLabelTitle: "Other",
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
