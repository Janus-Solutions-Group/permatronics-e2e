import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../../../common/widgets/page_navigation_button.dart';
import '../pages/belt_annual.dart';

class LoadTest extends StatelessWidget {
  const LoadTest(
      {super.key, required this.pageController, required this.beltModel});

  final PageController pageController;
  final BeltInspection beltModel;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    var jsonData = BeltAnnualJson.of(context)!.data;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormHeaderTitle(title: "load test".toUpperCase()),
            CustomRadioTile(
              id: "load_test_annual_1",
              title: 'Load Test',
              values: const ['Pass', 'Fail'],
              onChangeValue: (value) {
                beltModel.loadTestTestResult =
                    jsonData['load_test_testresult'][value];
              },
              conditionalBuilder: (selected) {
                if (selected == 'fail') {
                  return CustomTextField(
                    id: "load_test_annual_1a",
                    title: 'If Fail, Reason:',
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomTextField(
              id: "load_test_annual_2",
              title: 'Weight Used',
              onChanged: (value) {
                beltModel.loadTestWeightUsed = value;
              },
            ),
            CustomTextField(
              id: "load_test_annual_3",
              title: 'Stopping Distance',
              onChanged: (value) {
                beltModel.loadTestStoppingDistance = value;
              },
            ),
            CustomTextField(
              id: "load_test_annual_4",
              title: 'Belt Manlift Speed: FPM (Feet Per Minute)',
              onChanged: (value) {
                beltModel.loadTestBeltManliftSpeed = value;
              },
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
