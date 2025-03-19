import 'package:flutter/material.dart';
import 'package:manlift_app/feature/cage/model/cage_model.dart';
import 'package:manlift_app/feature/cage/quarterly/cage_quaterly.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class CarCounterWeightForm extends StatelessWidget {
  const CarCounterWeightForm(
      {super.key, required this.pageController, required this.cageModel});
  final PageController pageController;
  final CageInspection cageModel;
  @override
  Widget build(BuildContext context) {
    var jsonData = CageQuarterlyJson.of(context)!.data;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FormHeaderTitle(title: "CAR & COUNTERWEIGHT FASTENING"),
          CustomRadioTile(
            id: 'car_counterweight_1',
            title: 'Hoist Cable Number:',
            values: const ["2", "3"],
            onChangeValue: (value) {
              cageModel.ccfHoistcableNumber =
                  jsonData['car_and_counterweight_fastening']
                      ['hoist_cable_number'][value];
            },
          ),
          CustomRadioTile(
            id: 'car_counterweight_2',
            title: 'Size',
            values: const ['3/8"', '1/2"'],
            onChangeValue: (value) {
              cageModel.ccfHoistcableSize =
                  jsonData['car_and_counterweight_fastening']['size'][value];
            },
          ),
          CustomRadioTile(
            id: 'car_counterweight_3',
            title: 'Condition',
            values: const ["OK", "Replace", "Monitor"],
            onChangeValue: (value) {
              cageModel.ccfHoistcableCondition =
                  jsonData['car_and_counterweight_fastening']['condition']
                      [value];
            },
          ),
          CustomRadioTile(
            id: 'car_counterweight_4',
            title: 'Governor Cable Size:',
            values: const ["3/8”", "1/2”"],
            onChangeValue: (value) {
              cageModel.ccfGovernorCableSize =
                  jsonData['car_and_counterweight_fastening']
                      ['governor_cable_size'][value];
            },
          ),
          CustomRadioTile(
            id: 'car_counterweight_5',
            title: 'Condition',
            values: const ["OK", "Replace", "Monitor"],
            onChangeValue: (value) {
              cageModel.ccfGovernorCableCondition =
                  jsonData['car_and_counterweight_fastening']
                      ['governor_cable_condition'][value];
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
    );
  }
}
