import 'package:flutter/material.dart';
import 'package:manlift_app/feature/cage/quarterly/add_landing_form.dart';
import 'package:manlift_app/feature/cage/quarterly/cab_form.dart';
import 'package:manlift_app/feature/cage/quarterly/car_counter_weight_form.dart';
import 'package:manlift_app/feature/cage/quarterly/drive_support_form.dart';
import 'package:manlift_app/feature/cage/quarterly/pit_form.dart';
import 'package:manlift_app/feature/common/widgets/header_form.dart';
import 'package:manlift_app/feature/common/widgets/image_picking_last.dart';

class CageQuaterlyPage extends StatelessWidget {
  CageQuaterlyPage({super.key, required this.title});

  final String title;

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: PageView(
          controller: pageController,
          // physics: const NeverScrollableScrollPhysics(),
          children: [
            HeaderForm(pageController: pageController),
            PitInspectionForm(pageController: pageController),
            AddLandingFormPage(pageController: pageController),
            CABForm(pageController: pageController),
            CarCounterWeightForm(pageController: pageController),
            DriveSupportForm(pageController: pageController),
            ImagePickingWidget(pageController: pageController),
          ],
        ),
      ),
    );
  }
}
