import 'package:flutter/material.dart';
import 'package:manlift_app/feature/cage/annual/pages/cage_annual.dart';
import 'package:manlift_app/feature/cage/model/cage_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

class AnnualCageCarCounterWeightForm extends StatelessWidget {
  const AnnualCageCarCounterWeightForm(
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
          const FormHeaderTitle(title: "CAR & COUNTERWEIGHT FASTENING"),
          CustomRadioTile(
            id: 'car_conterweight_1',
            title: 'Hoist Cable Fasteners to Car:',
            values: const [
              "Poured Babbit",
              "Cable Clamps",
              "Fistgrips",
              "Wedge Socket",
              "Other"
            ],
            onChangeValue: (value) {
              cageModel.ccfHoistcableFastenersToCar =
                  jsonData['car_and_counterweight_fastening']
                      ['hoist_cable_fasteners_to_car'][value];
            },
            fieldValue: "other",
          ),
          CustomRadioTile(
            id: 'car_conterweight_2',
            title: 'Number of Fasteners Per Cable:',
            values: const ["1", "2", "3"],
            onChangeValue: (value) {
              cageModel.ccfNoOfFastenersPerCable =
                  jsonData['car_and_counterweight_fastening']
                      ['number_of_fasteners_per_cable'][value];
            },
          ),
          CustomRadioTile(
            id: 'car_conterweight_3',
            title: 'Hoist Cable Fasteners to CW:',
            values: const [
              "Poured Babbit",
              "Cable Clamps",
              "Fistgrips",
              "Wedge Socket",
              "Other"
            ],
            onChangeValue: (value) {
              cageModel.ccfHoistcableFastenersToCW =
                  jsonData['car_and_counterweight_fastening']
                      ['hoist_cable_fasteners_to_cw'][value];
            },
            fieldValue: "other",
          ),
          CustomRadioTile(
            id: 'car_conterweight_4',
            title: 'Number of Fasteners Per Cable:',
            values: const ["1", "2", "3"],
            onChangeValue: (value) {
              cageModel.ccfNoOfFastenersPerCable =
                  jsonData['car_and_counterweight_fastening']
                      ['number_of_fasteners_per_cable'][value];
            },
          ),
          CustomRadioTile(
            id: 'car_conterweight_5',
            title: 'Hoist Cable Number:',
            values: const ["2", "3"],
            onChangeValue: (value) {
              cageModel.ccfHoistcableNumber =
                  jsonData['car_and_counterweight_fastening']
                      ['hoist_cable_number'][value];
            },
          ),
          CustomRadioTile(
            id: 'car_conterweight_6',
            title: 'Size',
            values: const ["3/8\"", "1/2\""],
            onChangeValue: (value) {
              cageModel.ccfHoistcableSize =
                  jsonData['car_and_counterweight_fastening']['size'][value];
            },
          ),
          CustomRadioTile(
            id: 'car_conterweight_7',
            title: 'Condition',
            values: const ["OK", "Replace", "Monitor"],
            onChangeValue: (value) {
              cageModel.ccfHoistcableCondition =
                  jsonData['car_and_counterweight_fastening']['condition']
                      [value];
            },
          ),
          CustomRadioTile(
            id: 'car_conterweight_8',
            title: 'Governor Cable Size:',
            values: const ["3/8\"", "1/2\""],
            onChangeValue: (value) {
              cageModel.ccfGovernorCableSize =
                  jsonData['car_and_counterweight_fastening']
                      ['governor_cable_size'][value];
            },
          ),
          CustomRadioTile(
            id: 'car_conterweight_9',
            title: 'Condition',
            values: const ["OK", "Replace", "Monitor"],
            onChangeValue: (value) {
              cageModel.ccfGovernorCableCondition =
                  jsonData['car_and_counterweight_fastening']
                      ['governor_cable_condition'][value];
            },
          ),
          CustomRadioTile(
            id: 'car_conterweight_10',
            title: 'Governor Cable Fasteners:',
            values: const [
              "Poured Babbit",
              "Cable Clamps",
              "Fistgrips",
              "Wedge Socket",
              "Other"
            ],
            onChangeValue: (value) {
              cageModel.ccfGovernorCablefasteners =
                  jsonData['car_and_counterweight_fastening']
                      ['governor_cable_fasteners'][value];
            },
            fieldValue: "other",
          ),
          CustomRadioTile(
            id: 'car_conterweight_11',
            title: 'Governor Release Type:',
            values: const [
              "Ball & Socket",
              "T-Arm",
              "Fistgrips",
              "Pull Arm",
            ],
            onChangeValue: (value) {
              cageModel.ccfGovernorReleaseType =
                  jsonData['car_and_counterweight_fastening']
                      ['governor_release_type'][value];
            },
          ),
          CustomRadioTile(
            id: 'car_conterweight_12',
            title: 'Location',
            values: const ['Left', 'Right'],
            onChangeValue: (value) {
              cageModel.ccfGovernorReleaseLocation =
                  jsonData['car_and_counterweight_fastening']['location']
                      [value];
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
