import 'package:flutter/material.dart';
import 'package:manlift_app/feature/cage/annual/pages/cage_annual.dart';
import 'package:manlift_app/feature/cage/model/cage_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/custom_title.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class AnnualCageDriveSupportForm extends StatefulWidget {
  const AnnualCageDriveSupportForm(
      {super.key, required this.pageController, required this.cageModel});

  final PageController pageController;
  final CageInspection cageModel;

  @override
  State<AnnualCageDriveSupportForm> createState() =>
      _AnnualCageDriveSupportFormState();
}

class _AnnualCageDriveSupportFormState
    extends State<AnnualCageDriveSupportForm> {
  var cageInspection = CageInspection();
  @override
  Widget build(BuildContext context) {
    var jsonData = CageAnnualJson.of(context)!.data;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FormHeaderTitle(title: "DRIVE SUPPORT"),
          CustomTextField(id: 'drive_support_1', title: 'Description'),
          CustomTextField(
              id: 'drive_support_2',
              title: 'Floor to Ceiling Measurement Top Landing:'),
          CustomTextField(
              id: 'drive_support_3',
              title: 'Overhead Car Clearance Measurement:'),
          CustomTextField(
              id: 'drive_support_4', title: 'Top of Counterweight Clearance:'),
          CustomRadioTile(
            id: 'drive_support_5',
            title: 'Top Normal Terminal:',
            values: const ["Yes", "No", "Inoperable", "Replace"],
            onChangeValue: (value) {
              widget.cageModel.driveSupportTopNormalTerminal =
                  jsonData['drive_support']['top_normal_terminal'][value];
            },
          ),
          CustomRadioTile(
            id: 'drive_support_6',
            title: 'Top Final Terminal:',
            values: const ["Yes", "No", "Inoperable", "Replace"],
            onChangeValue: (value) {
              widget.cageModel.driveSupportTopFinalTerminal =
                  jsonData['drive_support']['top_final_terminal'][value];
            },
          ),
          CustomRadioTile(
            id: 'drive_support_7',
            title: 'Governor Guard:',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              widget.cageModel.driveSupportGovernorGuard =
                  jsonData['drive_support']['governor_guard'][value];
            },
          ),
          CustomRadioTile(
            id: 'drive_support_8',
            title: 'Sheave Guard',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              widget.cageModel.driveSupportSheaveGuard =
                  jsonData['drive_support']['sheave_guard'][value];
            },
          ),
          CustomRadioTile(
            id: 'drive_support_9',
            title: 'Governor Type',
            values: const [
              "Flip Bale",
              "Fly Ball",
              "Certified",
              'Hollister-Whitney',
              'Other'
            ],
            onChangeValue: (value) {
              widget.cageModel.driveSupportGovernorType =
                  jsonData['drive_support']['governor_type'][value];
            },
            fieldValue: 'other',
          ),
          CustomRadioTile(
            id: 'drive_support_10',
            title: 'Governor Condition',
            values: const ["OK", "Inoperable", "Replace"],
            onChangeValue: (value) {
              widget.cageModel.driveSupportGovernorCondition =
                  jsonData['drive_support']['governor_condition'][value];
            },
            isTextField: true,
            fieldTitle: "Why",
            fieldValue: "replace",
          ),
          CustomRadioTile(
            id: 'drive_support_11',
            title: 'Governor Location',
            values: const ["Rt Front", "Rt Back", "Lt Front", "Lt Back"],
            onChangeValue: (value) {
              widget.cageModel.driveSupportGovernorLocation =
                  jsonData['drive_support']['governor_location'][value];
            },
          ),
          CustomRadioTile(
            id: 'drive_support_12',
            title: 'Bale Flip:',
            values: const ["Easy", "Hard"],
            onChangeValue: (value) {
              widget.cageModel.driveSupportBaleFlip =
                  jsonData['drive_support']['bale_flip'][value];
            },
          ),
          CustomRadioTile(
            id: 'drive_support_13',
            title: 'Governor Switch',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              widget.cageModel.driveSupportGovernorSwitch =
                  jsonData['drive_support']['governor_switch'][value];
            },
          ),
          CustomRadioTile(
            id: 'drive_support_14',
            title: 'Tripping Speed',
            values: const ["175 fpm", "Other"],
            onChangeValue: (value) {
              widget.cageModel.driveSupportTrippingSpeed =
                  jsonData['drive_support']['tripping_speed'][value];
            },
            fieldValue: "other",
          ),
          CustomRadioTile(
            id: 'drive_support_15',
            title: 'Rope Gripper:',
            values: const ["Yes", "No", "N/A"],
            onChangeValue: (value) {
              setState(() {
                cageInspection.driveSupportRopeGripper = value;
              });
              widget.cageModel.driveSupportRopeGripper =
                  jsonData['drive_support']['rope_gripper'][value];
            },
          ),
          if (cageInspection.driveSupportRopeGripper == "yes")
            CustomRadioTile(
              id: 'drive_support_16',
              title: 'Condition:',
              values: const ["OK", "Inoperable", "Replace", "Other"],
              onChangeValue: (value) {
                widget.cageModel.driveSupportRopeGripperCondition =
                    jsonData['drive_support']['rope_gripper_condition'][value];
              },
              isTextField: true,
              fieldValue: "other",
            ),
          CustomRadioTile(
            id: 'drive_support_17',
            title: 'Sheave Break:',
            values: const ["Yes", "No", "N/A"],
            onChangeValue: (value) {
              setState(() {
                cageInspection.driveSupportSheaveBreak = value;
              });
              widget.cageModel.driveSupportSheaveBreak =
                  jsonData['drive_support']['sheave_break'][value];
            },
          ),
          if (cageInspection.driveSupportSheaveBreak == "yes")
            CustomRadioTile(
              id: 'drive_support_18',
              title: 'Condition:',
              values: const ["OK", "Inoperable", "Replace", "Other"],
              onChangeValue: (value) {
                widget.cageModel.driveSupportSheaveBreakCondition =
                    jsonData['drive_support']['sheave_break_condition'][value];
              },
              isTextField: true,
              fieldValue: "other",
            ),
          CustomRadioTile(
            id: 'drive_support_19',
            title: 'Type of Bushing:',
            values: const ["Taper Bushing", "Straight Bore"],
            onChangeValue: (value) {
              widget.cageModel.driveSupportTypeOfBushing =
                  jsonData['drive_support']['type_of_bushing'][value];
            },
          ),
          const CustomTextField(
              id: 'drive_support_20', title: "Traction Sheave & Bushing Size"),
          const CustomTextField(
              id: 'drive_support_21', title: "Traction Sheave Type"),
          CustomRadioTile(
            id: 'drive_support_22',
            title: 'Traction Sheave Condition',
            values: const ["OK", "Frozen"],
            onChangeValue: (value) {
              widget.cageModel.travelCableConnectionAndCondition =
                  jsonData['drive_support']['traction_sheave_condition'][value];
            },
          ),
          CustomRadioTile(
            id: 'drive_support_23',
            title: 'Replace',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              // cageModel.replace = value;
            },
            isTextField: true,
            fieldTitle: "if yes, why: ",
            fieldValue: "yes",
          ),
          const CustomTextField(
            id: 'drive_support_24',
            title: 'Shaft Size',
          ),
          const CustomTextField(
            id: 'drive_support_25',
            title: 'Bearing Type',
          ),
          const CustomTextField(
            id: 'drive_support_26',
            title: 'Bearing Size',
          ),
          CustomRadioTile(
            id: 'drive_support_27',
            title: 'Shaft and Bearing Condition:',
            values: const ["OK", "Replace", "Other"],
            onChangeValue: (value) {
              widget.cageModel.driveSupportShaftAndBearingCondition =
                  jsonData['drive_support']['shaft_and_bearing_condition']
                      [value];
            },
            isTextField: true,
            fieldValue: "other",
          ),
          const Row(
            children: [
              Expanded(
                  child: CustomTextField(
                      id: 'drive_support_28', title: 'Coupler Size')),
              Expanded(
                  child: CustomTextField(
                      id: 'drive_support_29', title: 'Coupler Type')),
            ],
          ),
          CustomRadioTile(
            id: 'drive_support_30',
            title: 'Coupler Condition:',
            values: const ["OK", "Replace", "Other"],
            onChangeValue: (value) {
              widget.cageModel.driveSupportCouplerCondition =
                  jsonData['drive_support']['coupler_condition'][value];
            },
            isTextField: true,
            fieldValue: "other",
          ),
          const CustomTextField(
              id: 'drive_support_31', title: 'Gearbox Brand Name:'),
          const CustomTextField(
              id: 'drive_support_32', title: 'Gearbox Numbers:'),
          CustomRadioTile(
            id: 'drive_support_33',
            title: 'Gearbox Condition:',
            values: const ["OK", "Excessive Backlash", "Monitor", "Replace"],
            onChangeValue: (value) {
              widget.cageModel.driveSupportGearboxCondition =
                  jsonData['drive_support']['gearbox_condition'][value];
            },
          ),
          const CustomTextField(
              id: 'drive_support_34', title: 'Motor Brand Name:'),
          const CustomTextField(
              id: 'drive_support_35', title: 'Motor Numbers:'),
          CustomRadioTile(
            id: 'drive_support_36',
            title: 'Motor Condition:',
            values: const ["OK", "Replace"],
            onChangeValue: (value) {
              widget.cageModel.driveSupportMotorCondition =
                  jsonData['drive_support']['motor_condition'][value];
            },
          ),
          const CustomTextField(
              id: 'drive_support_37', title: 'Brake Brand Name:'),
          const CustomTextField(
              id: 'drive_support_38', title: 'Brake Numbers:'),
          CustomRadioTile(
            id: 'drive_support_39',
            title: 'Brake Condition',
            values: const ["OK", "Replace Friction Disks only", "Replace"],
            onChangeValue: (value) {
              widget.cageModel.driveSupportBrakeCondition =
                  jsonData['drive_support']['brake_condition'][value];
            },
          ),
          const CustomTitle(title: 'Head Drive Measurements:'),
          const Row(
            children: [
              Expanded(
                  child:
                      CustomTextField(id: 'drive_support_41', title: 'Length')),
              Expanded(
                  child:
                      CustomTextField(id: 'drive_support_42', title: 'Width'))
            ],
          ),
          const CustomTitle(title: 'From Walls'),
          const Row(
            children: [
              Expanded(
                  child:
                      CustomTextField(id: 'drive_support_43', title: 'Front')),
              Expanded(
                  child: CustomTextField(id: 'drive_support_44', title: 'Back'))
            ],
          ),
          const Row(
            children: [
              Expanded(
                  child:
                      CustomTextField(id: 'drive_support_45', title: 'Left')),
              Expanded(
                  child:
                      CustomTextField(id: 'drive_support_46', title: 'Right'))
            ],
          ),
          const CustomTextField(
              id: 'drive_support_47', title: 'Orientation of Motor Comments'),
          const CustomTextField(
              id: 'drive_support_48', title: 'Overall Travel(Height):'),
          CustomRadioTile(
            id: 'drive_support_49',
            title: 'Access to Drive',
            values: const ["OK", "Other(Explain)"],
            onChangeValue: (val) {
              widget.cageModel.driveSupportAccessToDrive =
                  jsonData['drive_support']['access_to_drive'][val];
            },
            isTextField: true,
            fieldValue: "other(explain)",
            fieldTitle: "Other(Explain)",
          ),
          CustomRadioTile(
            id: 'drive_support_50',
            title: 'Machine Disconnect:',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              widget.cageModel.driveSupportMachineDisconnect =
                  jsonData['drive_support']['machine_disconnect'][value];
            },
          ),
          CustomRadioTile(
            id: 'drive_support_51',
            title: 'Overhead Lifting Supports:',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              widget.cageModel.driveSupportOverheadLiftingSupports =
                  jsonData['drive_support']['overhead_lifting_supports'][value];
            },
          ),
          const CustomTextField(
            id: 'drive_support_52',
            title: 'Top Landing Comments',
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
