import 'package:flutter/material.dart';
import 'package:manlift_app/feature/cage/annual/widgets/annual_landing_form.dart';
import 'package:manlift_app/feature/cage/annual/widgets/cab_form.dart';
import 'package:manlift_app/feature/cage/annual/widgets/car_counterweight_form.dart';
import 'package:manlift_app/feature/cage/annual/widgets/drive_support.dart';
import 'package:manlift_app/feature/cage/annual/widgets/electrical_control.dart';
import 'package:manlift_app/feature/cage/annual/widgets/load_test.dart';
import 'package:manlift_app/feature/cage/quaterly/cab_form.dart';
import 'package:manlift_app/feature/cage/quaterly/car_counter_weight_form.dart';
import 'package:manlift_app/feature/cage/quaterly/landing_form.dart';
import 'package:manlift_app/feature/common/widgets/header_form.dart';
import 'package:manlift_app/feature/cage/annual/widgets/yearly_pit_form.dart';
import 'package:manlift_app/feature/common/widgets/image_upload.dart';

class CageAnnualyPage extends StatelessWidget {
  CageAnnualyPage({super.key});

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cage Yearly Form"),
      ),
      body: SafeArea(
        child: PageView(
          children: [
            HeaderForm(pageController: pageController),
            YearlyPitInspectionForm(pageController: pageController),
            AnnualLandingForm(pageController: pageController),
            AnnualCageCABForm(pageController: pageController),
            AnnualCageCarCounterWeightForm(pageController: pageController),
            AnnualCageDriveSupportForm(pageController: pageController),
            AnnualCageElectricalControlForm(pageController: pageController),
            AnnualCageLoadTests(pageController: pageController),

            // signature is left

            ImagePickingWidget(pageController: pageController),
          ],
        ),
      ),
    );
  }
}
