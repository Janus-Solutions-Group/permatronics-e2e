import 'package:flutter/material.dart';

import 'package:manlift_app/feature/cage/widgets/section_title.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/custom_title.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class AnnualLandingForm extends StatefulWidget {
  const AnnualLandingForm({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<AnnualLandingForm> createState() => _AnnualLandingFormState();
}

class _AnnualLandingFormState extends State<AnnualLandingForm> {
  String? cleanVal;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSectionTitle('Landing'),
          CustomRadioTile(
            title: 'Hoistway Controls',
            values: const ["OK", "Inoperable", "None"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomTextField(title: "Hoistway Door"),
          CustomRadioTile(
            title: 'Hoistway Door Unlocking Device:',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomTextField(title: "Hoistway Door Interlock Type:"),
          CustomRadioTile(
            title: 'Location:',
            values: const ["Left", "Right ", "Top", "Middle"],
            isTextField: true,
            fieldTitle: 'Other',
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Hoistway Door Interlock Condition:',
            values: const ["OK", "Replace ", "Other"],
            isTextField: true,
            fieldTitle: 'Other',
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomTextField(title: "Hoistway Door Electric Contact Type:"),
          CustomRadioTile(
            title: 'Door Electric Contact Location:',
            values: const ["Left", "Right ", "Top", "Middle"],
            isTextField: true,
            fieldTitle: 'Other',
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Hoistway Door Electric Contact Condition:',
            values: const ["OK", "Replace", "Other"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Hoistway Door Hinge:',
            values: const ["Left", "Right"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Hoistway Door Self Closer:',
            values: const ["Yes", "No", "Inoperable", "N/A"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Hoistway Door Signs:',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          const CustomTitle(title: "Enclosure:"),
          Row(
            children: [
              Expanded(child: CustomTextField(title: "Height")),
              Expanded(child: CustomTextField(title: "Width")),
              Expanded(child: CustomTextField(title: "Depth")),
            ],
          ),
          CustomRadioTile(
            title: 'Enclosure Material:',
            values: const ["Expanded Metal", "Solid Panels", "Concrete"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Enclosure Panels:',
            values: const ["2", "3", "4", "Other"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
            isTextField: true,
            fieldTitle: "Other",
          ),
          CustomRadioTile(
            title: 'Landing Zone Switch:',
            values: const ["Yes", "No", "N/A"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Condition',
            values: const ["Ok", "Inoperable"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomTextField(title: "Landing Comments"),
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
