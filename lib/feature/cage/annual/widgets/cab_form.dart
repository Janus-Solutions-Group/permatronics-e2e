import 'package:flutter/material.dart';
import 'package:manlift_app/feature/cage/widgets/section_title.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class AnnualCageCABForm extends StatefulWidget {
  const AnnualCageCABForm({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<AnnualCageCABForm> createState() => _AnnualCageCABFormState();
}

class _AnnualCageCABFormState extends State<AnnualCageCABForm> {
  String? cleanVal;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSectionTitle('CAB'),
          CustomTextField(title: "Car Condition and Description:"),
          CustomRadioTile(
            title: 'Cam:',
            values: const ["Retiring", "Stationary", "None"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Location',
            values: const ["Left", "Right", "Middle"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Condition',
            values: const ["OK", "Replace"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Car Door Type:',
            values: const ["Bi-Fold", "Scissor", "2 PC"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Material',
            values: const ["Expanded Metal", "Solid Panel"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Car Door Condition',
            values: const ["OK", "Replace"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Car Door Limit',
            values: const ["Yes", "No", "Inoperable"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomTextField(
            title: 'How Many',
          ),
          CustomRadioTile(
            title: 'Car Operation Controls: “UP”',
            values: const ["OK", "Inoperable"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Car Operation Controls: “DN”',
            values: const ["OK", "Inoperable"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Car Light:',
            values: const ["Yes", "No", "Inoperable"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Car Light Switch:',
            values: const ["Yes", "No", "Inoperable"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Car Alarm:',
            values: const ["Yes", "No", "Inoperable"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Car Alarm Switch:',
            values: const ["Yes", "No", "Inoperable"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Emergency Stop:',
            values: const ["Yes", "No", "Inoperable"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Capacity Signage:',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Comm. Device:',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Emergency Escape Hatch:',
            values: const ["Yes", "No", "N/A"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Emergency Escape Hatch Switch:',
            values: const ["Yes", "No", "Inoperable"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Manual Back Up Car Alarm:',
            values: const ["Yes", "No", "Inoperable"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomTextField(title: "Manual Back Up Car Alarm Type:"),
          CustomRadioTile(
            title: 'Data Plate:',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Type of Cable Attacment to Car:',
            values: const ["OH Sling", "1 Bolt Triangle", "Other"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
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
    );
  }
}
