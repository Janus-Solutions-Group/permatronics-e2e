import 'package:flutter/material.dart';
import 'package:manlift_app/feature/cage/widgets/section_title.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class DriveSupportForm extends StatefulWidget {
  const DriveSupportForm({super.key});

  @override
  State<DriveSupportForm> createState() => _DriveSupportFormState();
}

class _DriveSupportFormState extends State<DriveSupportForm> {
  String? cleanVal;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSectionTitle('DRIVE SUPPORT'),
          CustomTextField(title: 'Description'),
          CustomRadioTile(
            title: 'Top Normal Terminal:',
            values: ["Yes", "No", "Inoperable", "Replace"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Top Final Terminal:',
            values: ["Yes", "No", "Inoperable", "Replace"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Governor Guard:',
            values: ["Yes", "No"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Sheave Guard',
            values: ["Yes", "No"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Governor Condition',
            values: ["OK", "Inoerable", "Replace"],
            isTextField: true,
            fieldTitle: "Why",
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Bale Flip:',
            values: ["Easy", "Hard"],
            isTextField: true,
            fieldTitle: "Why",
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Governor Switch',
            values: ["Yes", "No"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Rope Gripper:',
            values: ["Yes", "No", "N/A"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Governor',
            values: ["OK", "Inoerable", "Replace", "Other"],
            isTextField: true,
            fieldTitle: "Other",
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Sheave Break:',
            values: ["Yes", "No", "N/A"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Governor',
            values: ["OK", "Inoerable", "Replace", "Other"],
            isTextField: true,
            fieldTitle: "Other",
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Deflector Sheave',
            values: ["Yes", "No"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Shaft and Bearing Condition:',
            values: ["OK", "Replace", "Other"],
            isTextField: true,
            fieldTitle: "Other",
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          Row(
            children: [
              Expanded(child: CustomTextField(title: 'Couple Sizer')),
              Expanded(child: CustomTextField(title: 'Couple Type')),
            ],
          ),
          CustomRadioTile(
            title: 'Coupler Condition:',
            values: ["OK", "Replace", "Other"],
            isTextField: true,
            fieldTitle: "Other",
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Gearbox Condition:',
            values: ["OK", "Excessive Back lash", "Monitor", "Replace"],
            isTextField: true,
            fieldTitle: "Other",
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Motor Condition:',
            values: ["OK", "Replace"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Brake Condition',
            values: ["OK", "Replace Friction Disks only", "Replace"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Machine Disconnect:',
            values: ["Yes", "No"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Overhead Lifting Supports:',
            values: ["Yes", "No"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
