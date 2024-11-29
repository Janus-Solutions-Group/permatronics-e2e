import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/model/belt_inspection_model.dart';
import 'package:manlift_app/feature/common/widgets/form_header.dart';
import 'package:manlift_app/feature/common/widgets/custom_textfield.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';
import 'package:manlift_app/feature/common/widgets/radio_tile.dart';

import '../pages/belt_quaterly.dart';

class BottomLandingHood extends StatelessWidget {
  const BottomLandingHood(
      {super.key, required this.pageController, required this.beltModel});

  final PageController pageController;
  final BeltInspection beltModel;

  @override
  Widget build(BuildContext context) {
    var jsonData = BeltJson.of(context)!.data;
    final formKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormHeaderTitle(title: "BOTTOM LANDING HOOD"),
            CustomRadioTile(
              id: 'bottom_landing_hood_1',
              title: 'Type of Hood',
              values: const ["Stationary", "Moveable", "Moveable Mini", 'None'],
              onChangeValue: (value) {
                beltModel.bottomLandingHoodTypeOfHood =
                    jsonData['bottom_landing_hood_type_of_hood'][value];
              },
            ),
            CustomRadioTile(
              id: 'bottom_landing_hood_2',
              title: 'Hood Condition',
              values: const [
                "OK",
                "Damaged, but OK",
                "Replace Damaged",
                'Replace Worn'
              ],
              onChangeValue: (value) {
                beltModel.bottomLandingHoodHoodCondition =
                    jsonData['bottom_landing_hood_hood_condition'][value];
              },
            ),
            CustomRadioTile(
              id: 'bottom_landing_hood_3',
              title: 'If moveable, does the switch work',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel
                    .bottomLandingHoodIfMoveableDoesTheSwitchWork = jsonData[
                        'bottom_landing_hood_if_moveable,_does_the_switch_work']
                    [value];
              },
            ),
            CustomRadioTile(
              id: 'bottom_landing_hood_4',
              title: 'Does Hood have a Rolled Edge',
              values: const ['Yes', 'No'],
              onChangeValue: (value) {
                beltModel.bottomLandingHoodDoesHoodHaveARolledEdge =
                    jsonData['bottom_landing_hood_does_hood_have_a_rolled_edge']
                        [value];
              },
            ),
            CustomTextField(
              id: 'bottom_landing_hood_5',
              title: 'Bottom Hood Comments:',
              onChanged: (val) {
                beltModel.bottomLandingHoodBottomHoodComments = val;
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
