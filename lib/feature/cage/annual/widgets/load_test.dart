import 'package:flutter/material.dart';
import 'package:manlift_app/feature/cage/annual/pages/cage_annual.dart';
import 'package:manlift_app/feature/cage/model/cage_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class AnnualCageLoadTests extends StatelessWidget {
  const AnnualCageLoadTests(
      {super.key, required this.pageController, required this.cageModel});

  final PageController pageController;
  final CageInspection cageModel;

  @override
  Widget build(BuildContext context) {
    var jsonData = CageAnnualJson.of(context)!.data;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FormHeaderTitle(title: 'Load Tests'),
          CustomRadioTile(
            id: 'load_test_1',
            title: 'Pounds Used During Tests:',
            values: const ["300", "500", "650", "1000", "Other"],
            onChangeValue: (value) {
              cageModel.loadTestsPoundUsedDuringTest =
                  jsonData['load_tests']['pounds_used_during_test'][value];
            },
            isTextField: true,
            fieldValue: "other",
          ),
          CustomRadioTile(
            id: 'load_test_2',
            title: 'Did Unit Pass Load Tests:',
            values: const ["Yes", "No"],
            onChangeValue: (value) {
              cageModel.loadTestsdidUnitPassLoadTest =
                  jsonData['load_tests']['did_unit_pass_load_test'][value];
            },
          ),
          const Row(
            children: [
              Expanded(
                  child: CustomTextField(
                id: 'load_test_3',
                title: 'Speed, Empty Up:',
              )),
              Expanded(
                  child: CustomTextField(
                id: 'load_test_4',
                title: 'Loaded Up:',
              )),
            ],
          ),
          const Row(
            children: [
              Expanded(
                  child: CustomTextField(
                id: 'load_test_5',
                title: 'Speed, Empty DN:',
              )),
              Expanded(
                  child: CustomTextField(
                id: 'load_test_6',
                title: 'Loaded DN:',
              )),
            ],
          ),
          const CustomTextField(
            id: 'load_test_7',
            title: 'Governor Tripped @:',
          ),
          const CustomTextField(
            id: 'load_test_8',
            title: 'Load Tests Comments',
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
    );
  }
}
