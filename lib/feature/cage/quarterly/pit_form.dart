import 'package:flutter/material.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class PitInspectionForm extends StatefulWidget {
  const PitInspectionForm({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<PitInspectionForm> createState() => _PitInspectionFormState();
}

class _PitInspectionFormState extends State<PitInspectionForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormHeaderTitle(title: "PIT"),
            CustomRadioTile(
              title: "Clean",
              values: const ["YES", "NO"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Pit Switch",
              values: const ["YES", "NO", "Inoperable"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Switch Location",
              values: const ["OK", "Relocate"],
              isTextField: true,
              fieldTitle: 'Reason',
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Pit Light",
              values: const ["YES", "NO", "Inoperable"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Pit Light Switch",
              values: const ["YES", "NO", "Inoperable"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Governor Cable Tensioner Description",
              values: const ["Weighted", "Spring", "Screw"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Condition",
              values: const ["Ok", "Replace"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Bottom Normal Terminal",
              values: const ["Ok", "inoperable", "Replace", "None"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Bottom Final Terminal:",
              values: const ["Ok", "inoperable", "Replace", "None"],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Pit Comment'),
            CustomRadioTile(
              title: "Travel Cable Connection and Condition:",
              values: const ["Ok", "Replace"],
              isTextField: true,
              fieldTitle: 'Reason',
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Safety Type",
              values: const ["Type'A'", "Slack"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Safety Location",
              values: const ["Top of Car", "Bottom of Car"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Safety Condition",
              values: const ["OK", "Frozen", "Replace", "Yes", "No"],
              isTextField: true,
              fieldTitle: 'If not, Why:',
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Switch on Safeties:",
              values: const ["Yes", "No", "OK", "Inoperable"],
              isTextField: true,
              fieldTitle: 'If not, Why:',
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Car Guide Type:",
              values: const ["Steel", "UHMW Inserts", "Rollers"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Condition",
              values: const ["OK", "Replace"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "CW Guide Type",
              values: const ["Steel", "UHMW Inserts", "Rollers"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Condition",
              values: const ["OK", "Worn, but OK", "Replace"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Hoistway Ladder: ",
              values: const ["Yes", "No"],
              onChangeValue: (value) {},
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
      ),
    );
  }
}
