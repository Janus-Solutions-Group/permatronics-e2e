import 'package:flutter/material.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class AnnualCageLoadTests extends StatelessWidget {
  const AnnualCageLoadTests({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormHeaderTitle(title: 'Load Tests'),
          CustomRadioTile(
            title: 'Pounds Used During Tests:',
            values: ["300", "500", "650", "1000", "Other"],
            onChangeValue: (value) {},
            isTextField: true,
            fieldTitle: "Other",
          ),
          CustomRadioTile(
            title: 'Did Unit Pass Load Tests:',
            values: ["Yes", "No"],
            onChangeValue: (value) {},
          ),
          Row(
            children: [
              Expanded(child: CustomTextField(title: 'Speed, Empty Up:')),
              Expanded(child: CustomTextField(title: 'Loaded Up:')),
            ],
          ),
          Row(
            children: [
              Expanded(child: CustomTextField(title: 'Speed, Empty DN:')),
              Expanded(child: CustomTextField(title: 'Loaded DN:')),
            ],
          ),
          CustomTextField(title: 'Governor Tripped @:'),
          CustomTextField(title: 'Load Tests Comments'),
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
