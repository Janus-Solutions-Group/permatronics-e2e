import 'package:flutter/material.dart';
import 'package:manlift_app/feature/cage/quaterly/cab_form.dart';
import 'package:manlift_app/feature/cage/quaterly/car_counter_weight_form.dart';
import 'package:manlift_app/feature/cage/quaterly/landing_form.dart';
import 'package:manlift_app/feature/cage/quaterly/pit_form.dart';
import 'package:manlift_app/feature/common/widgets/header_form.dart';
import 'package:manlift_app/feature/common/widgets/image_upload.dart';

class CageQuaterlyPage extends StatelessWidget {
  CageQuaterlyPage({super.key});

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cage Quaterly Form"),
      ),
      body: SafeArea(
        child: PageView(
          controller: pageController,
          // physics: const NeverScrollableScrollPhysics(),
          children: [
            HeaderForm(pageController: pageController),
            PitInspectionForm(
              pageController: pageController,
            ),
            LandingForm(
              pageController: pageController,
            ),
            CABForm(
              pageController: pageController,
            ),
            CarCounterWeightForm(
              pageController: pageController,
            ),
            ImagePickingWidget(
              pageController: pageController,
            ),
          ],
        ),
      ),
    );
  }
}
