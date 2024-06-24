import 'package:flutter/material.dart';
import 'package:manlift_app/feature/cage/widgets/section_title.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class LandingForm extends StatefulWidget {
  const LandingForm({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<LandingForm> createState() => _LandingFormState();
}

class _LandingFormState extends State<LandingForm> {
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
            values: ["OK", "Inoperable", "None"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Hoistway Door Unlocking Device:',
            values: ["Yes", "No"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Hoistway Door Interlock Condition:',
            values: ["OK", "Replace ", "Other"],
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
            values: ["OK", "Replace", "Other"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Hoistway Door Self Closer:',
            values: ["Yes", "No", "Inoperable", "N/A"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Landing Zone Switch:',
            values: ["Yes", "No", "N/A"],
            onChangeValue: (value) {
              setState(() {
                cleanVal = value;
              });
            },
          ),
          CustomRadioTile(
            title: 'Condition',
            values: ["Ok", "Inoperable"],
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
