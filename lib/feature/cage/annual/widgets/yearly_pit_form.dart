import 'package:flutter/material.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/custom_title.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class YearlyPitInspectionForm extends StatefulWidget {
  const YearlyPitInspectionForm({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<YearlyPitInspectionForm> createState() =>
      _YearlyPitInspectionFormState();
}

class _YearlyPitInspectionFormState extends State<YearlyPitInspectionForm> {
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
            FormHeaderTitle(title: 'PIT'),
            CustomRadioTile(
              title: "Bottom Platform",
              values: const ["YES", "NO", "N/A"],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: "Platform Height"),
            CustomTextField(title: "Platform Comments"),
            CustomRadioTile(
              title: "Pit",
              values: const ["YES", "NO", "N/A"],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: "Depth"),
            CustomTextField(title: "Width"),
            CustomTextField(title: "Length"),
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
              values: const ["YES", "NO", "Inoperable"],
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
              title: "Car Buffers:",
              values: const ["YES", "NO"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "How Many:",
              values: const ["1", "2", "3"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Runby:",
              values: const ["Compliant", "Non-compliant"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Counterweight Buffers:",
              values: const ["YES", "NO"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "How Many:",
              values: const ["1", "2", "3"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Runby:",
              values: const ["Compliant", "Non-compliant"],
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
            const CustomTitle(title: "Under Car Size, measurement from:"),
            Row(
              children: [
                Expanded(child: CustomTextField(title: "Front/Back")),
                Text(
                  " X  ",
                  style: TextStyle(fontSize: 16),
                ),
                Expanded(child: CustomTextField(title: "Right/Left"))
              ],
            ),
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
              values: const ["Type'A'", "Slack"],
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
              title: "Car Guide Rails Type:",
              values: const ["T-Rail", "Angle", "Wood"],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: "Car Guide Rails Size"),
            CustomRadioTile(
              title: "Condition:",
              values: const ["OK", "Replace"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Why:",
              values: const ["Broken", "Worn", "Bolted", "Welded"],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: "Car Guide Rails DBG"),
            CustomRadioTile(
              title: "Car Guide Rail Brackets",
              values: const ["Wooden", "Steel", "Bolted", "Welded"],
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
              title: "Counterweight Location, Facing Car",
              values: const ["Left", "Right", "Rear"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Counterweight Guide Rail Type",
              values: const ["T-Rail", "Angle", "Box", "Enclosed", "C-Channel"],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'Size'),
            CustomTextField(title: 'Counterweight Guide Rail DBG:'),
            CustomRadioTile(
              title: "Condition",
              values: const ["OK", "Other"],
              onChangeValue: (value) {},
              isTextField: true,
              fieldTitle: "Other",
            ),
            CustomRadioTile(
              title: "Counterweight Guide Rail Brackets",
              values: const ["Wooden", "Steel", "Bolted", "Welded"],
              onChangeValue: (value) {},
            ),
            CustomTextField(title: 'CW Dimension'),
            CustomRadioTile(
              title: "CW Material",
              values: const [
                "Cast",
                "Steel",
                "Solid",
                "Plates",
                "Bolted",
                "Welded"
              ],
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
