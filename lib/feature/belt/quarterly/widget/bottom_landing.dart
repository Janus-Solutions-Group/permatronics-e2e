import 'package:flutter/material.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class BottomLanding extends StatelessWidget {
  const BottomLanding({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormHeaderTitle(title: "BOTTOM LANDING = LANDING#1"),
            CustomRadioTile(
              title: '“Authorized Personnel Only” Sign: (2” letters)',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: 'Instruction Sign: (1” letters) ',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: '“BOTTOM FLOOR – GET OFF” Sign: (2” letters) ',
              values: const ["Yes", "No", "Non-Compliant"],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Red Warning Light:",
              values: const ['Yes', 'No', 'N/A'],
              onChangeValue: (value) {},
            ),
            CustomRadioTile(
              title: "Condition",
              values: const ['OK', 'Inoperable'],
              onChangeValue: (value) {},
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
      ),
    );
  }
}
