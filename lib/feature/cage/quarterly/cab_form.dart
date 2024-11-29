import 'package:flutter/material.dart';
import 'package:manlift_app/feature/cage/model/cage_model.dart';
import 'package:manlift_app/feature/cage/quarterly/cage_quaterly.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class CABForm extends StatelessWidget {
  const CABForm(
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
          const FormHeaderTitle(title: "CAB"),
          CustomTextField(
            id: 'cab_form_1',
            title: "Car Condition and Description:",
          ),
          CustomRadioTile(
            id: 'cab_form_2',
            title: 'Cam:',
            values: const ["Retiring", "Stationary", "None"],
            onChangeValue: (value) {
              cageModel.carConditionAndDescriptionCam =
                  jsonData['car_condition_and_description']['cam'][value];
            },
          ),
          CustomRadioTile(
            id: 'cab_form_3',
            title: 'Location',
            values: const ["Left", "Right", "Middle"],
            onChangeValue: (value) {
              cageModel.carConditionAndDescriptionLocation =
                  jsonData['car_condition_and_description']['location'][value];
            },
          ),
          CustomRadioTile(
            id: 'cab_form_4',
            title: 'Condition',
            values: const ["OK", "Replace"],
            onChangeValue: (value) {
              cageModel.carConditionAndDescriptionCondition =
                  jsonData['car_condition_and_description']['condition'][value];
            },
          ),
          CustomRadioTile(
            id: 'cab_form_5',
            title: 'Car Door Type:',
            values: const ["Bi-Fold", "Scissor", "2 PC"],
            onChangeValue: (value) {
              cageModel.carDoorType = jsonData['car_door_type'][value];
            },
          ),
          CustomRadioTile(
            id: 'cab_form_6',
            title: 'Material',
            values: const ["Expended Metal", "Solid Panel"],
            onChangeValue: (value) {
              cageModel.carDoorMaterial = jsonData['car_door_material'][value];
            },
          ),
          CustomRadioTile(
            id: 'cab_form_7',
            title: 'Car Door Condition',
            values: const ["OK", "Replace"],
            onChangeValue: (value) {
              cageModel.carDoorCondition =
                  jsonData['car_door_condition'][value];
            },
          ),
          CustomRadioTile(
            id: 'cab_form_8',
            title: 'Car Door Limit',
            values: const ["Yes", "No", "Inoperable"],
            onChangeValue: (value) {
              cageModel.carDoorLimit = jsonData['car_door_limit'][value];
            },
          ),
          CustomTextField(
            id: 'cab_form_9',
            title: 'How Many',
          ),
          CustomRadioTile(
            id: 'cab_form_10',
            title: 'Car Operation Controls: “UP”',
            values: const ["OK", "Inoperable"],
            onChangeValue: (value) {
              cageModel.carOperationControlsUp =
                  jsonData['car_operation_controls']['up'][value];
            },
          ),
          CustomRadioTile(
            id: 'cab_form_11',
            title: 'Car Operation Controls: “DN”',
            values: const ["OK", "Inoperable"],
            onChangeValue: (value) {
              cageModel.carOperationControlsDown =
                  jsonData['car_operation_controls']['dn'][value];
            },
          ),
          CustomRadioTile(
            id: 'cab_form_12',
            title: 'Car Light:',
            values: const ["Yes", "No", "Inoperable"],
            onChangeValue: (value) {
              cageModel.carLight = jsonData['car_light'][value];
            },
          ),
          CustomRadioTile(
            id: 'cab_form_13',
            title: 'Car Light Switch:',
            values: const ["Yes", "No", "Inoperable"],
            onChangeValue: (value) {
              cageModel.carLightSwitch = jsonData['car_light_switch'][value];
            },
          ),
          CustomRadioTile(
            id: 'cab_form_14',
            title: 'Car Alarm:',
            values: const ["Yes", "No", "Inoperable"],
            onChangeValue: (value) {
              cageModel.carAlarm = jsonData['car_alarm'][value];
            },
          ),
          CustomRadioTile(
            id: 'cab_form_15',
            title: 'Car Alarm Switch:',
            values: const ["Yes", "No", "Inoperable"],
            onChangeValue: (value) {
              cageModel.carAlarmSwitch = jsonData['car_alarm_switch'][value];
            },
          ),
          CustomRadioTile(
            id: 'cab_form_16',
            title: 'Emergency Stop:',
            values: const ["Yes", "No", "Inoperable"],
            onChangeValue: (value) {
              cageModel.emergencyStop = jsonData['emergency_stop'][value];
            },
          ),
          CustomRadioTile(
            id: 'cab_form_17',
            title: 'Capacity Signage:',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              cageModel.capacitySignage = jsonData['capacity_signage'][value];
            },
          ),
          CustomRadioTile(
            id: 'cab_form_18',
            title: 'Comm. Device:',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              cageModel.commDevice = jsonData['comm_device'][value];
            },
          ),
          CustomRadioTile(
            id: 'cab_form_19',
            title: 'Emergency Escape Hatch:',
            values: const ["Yes", "No", "N/A"],
            onChangeValue: (value) {
              cageModel.emergencyEscapeHatch =
                  jsonData['emergency_escape_hatch'][value];
            },
          ),
          CustomRadioTile(
            id: 'cab_form_20',
            title: 'Emergency Escape Hatch Switch:',
            values: const ["Yes", "No", "Inoperable"],
            onChangeValue: (value) {
              cageModel.emergencyEscapeHatchSwitch =
                  jsonData['emergency_escape_hatch_switch'][value];
            },
          ),
          CustomRadioTile(
            id: 'cab_form_21',
            title: 'Manual Back Up Car Alarm:',
            values: const ["Yes", "No", "Inoperable"],
            onChangeValue: (value) {
              cageModel.manualBackupCarAlarm =
                  jsonData['manual_backup_car_alarm'][value];
            },
          ),
          CustomTextField(
            id: 'cab_form_22',
            title: "Manual Back Up Car Alarm Type:",
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
