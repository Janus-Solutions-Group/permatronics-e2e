import 'package:flutter/material.dart';
import 'package:manlift_app/feature/cage/widgets/section_title.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/custom_title.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class AnnualCageDriveSupportForm extends StatefulWidget {
  const AnnualCageDriveSupportForm({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<AnnualCageDriveSupportForm> createState() =>
      _AnnualCageDriveSupportFormState();
}

class _AnnualCageDriveSupportFormState
    extends State<AnnualCageDriveSupportForm> {
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
          CustomTextField(title: 'Floor to Ceiling Measurement Top Landing:'),
          CustomTextField(title: 'Overhead Car Clearance Measurement:'),
          CustomTextField(title: 'Top of Counterweight Clearance:'),
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
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Governor Type',
            values: const [
              "Flip Bale",
              "Fly Ball",
              "Certified",
              'Hollister-Whitney',
              'Other'
            ],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
            isTextField: true,
            fieldTitle: 'Other',
          ),
          CustomRadioTile(
            title: 'Governor Condition',
            values: const ["OK", "Inoerable", "Replace"],
            isTextField: true,
            fieldTitle: "Why",
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Governor Location',
            values: const ["Rt Front", "Rt Back", "Lt Front"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Bale Flip:',
            values: const ["Easy", "Hard"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Governor Switch',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Tripping Speed',
            values: const ["175 fpm", "Other"],
            isTextField: true,
            fieldTitle: "Other",
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Rope Gripper:',
            values: const ["Yes", "No", "N/A"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Condition:',
            values: const ["OK", "Inoperable", "Replace", "Other"],
            isTextField: true,
            fieldTitle: "Other",
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Type of Bushing:',
            values: const ["Taper Bushing", "Straight Bore"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomTextField(title: "Traction Sheave & Bushing Size"),
          CustomTextField(title: "Traction Sheave Type"),
          CustomRadioTile(
            title: 'Tractor Sheave Condition',
            values: const ["OK"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Replace',
            values: const ["Yes", "No"],
            isTextField: true,
            fieldTitle: "if yes, why: ",
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomTextField(
            title: 'Shaft Size',
          ),
          CustomTextField(
            title: 'Bearing Type',
          ),
          CustomTextField(
            title: 'Bearing Size',
          ),
          CustomRadioTile(
            title: 'Deflector Sheave',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomTextField(
            title: 'Shaft Size',
          ),
          CustomTextField(
            title: 'Bearing Type',
          ),
          CustomTextField(
            title: 'Bearing Size',
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
          CustomTextField(title: 'Gearbox Brand Name:'),
          CustomTextField(title: 'Gearbox Numbers:'),
          CustomRadioTile(
            title: 'Gearbox Condition:',
            values: ["OK", "Excessive Back lash", "Monitor", "Replace"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomTextField(title: 'Motor Brand Name:'),
          CustomTextField(title: 'Motor Numbers:'),
          CustomRadioTile(
            title: 'Motor Condition:',
            values: ["OK", "Replace"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomTextField(title: 'Brake Brand Name:'),
          CustomTextField(title: 'Brake Numbers:'),
          CustomRadioTile(
            title: 'Brake Condition',
            values: ["OK", "Replace Friction Disks only", "Replace"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomTitle(title: 'Head Drive Measurements:'),
          Row(
            children: [
              Expanded(child: CustomTextField(title: 'Length')),
              Expanded(child: CustomTextField(title: 'Width'))
            ],
          ),
          const CustomTitle(title: 'From Walls'),
          Row(
            children: [
              Expanded(child: CustomTextField(title: 'Front')),
              Expanded(child: CustomTextField(title: 'Back'))
            ],
          ),
          Row(
            children: [
              Expanded(child: CustomTextField(title: 'Left')),
              Expanded(child: CustomTextField(title: 'Right'))
            ],
          ),
          CustomTextField(title: 'Orientation of Motor Comments'),
          CustomTextField(title: 'Overall Travel(Height):'),
          CustomRadioTile(
            title: 'Access to Drive',
            values: ["OK", "Other(Explain)"],
            onChangeValue: (val) {},
            isTextField: true,
            fieldTitle: "Other(Explain)",
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
          CustomTextField(title: 'Top Landing Comments'),
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
