import 'package:flutter/material.dart';
import 'package:manlift_app/feature/common/widgets/header_form.dart';
import 'package:manlift_app/feature/common/widgets/image_picking_last.dart';

import '../widget/belting.dart';
import '../widget/bottom_landing.dart';
import '../widget/bottom_landing_hood.dart';
import '../widget/bottom_landing_safeties.dart';
import '../widget/drive_assembly.dart';
import '../widget/electrical.dart';
import '../widget/handholds.dart';
import '../widget/load_test.dart';
import '../widget/steps.dart';
import '../widget/tail_section.dart';
import '../widget/intermediate_landing.dart';
import '../widget/top_landing.dart';
import '../widget/top_landing_safeties.dart';

class BeltAnnualPage extends StatelessWidget {
  BeltAnnualPage({super.key, required this.title});

  final String title;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  HeaderForm(pageController: pageController),
                  TailSection(pageController: pageController),
                  BottomLandingSafeties(pageController: pageController),
                  BottomLanding(pageController: pageController),
                  BottomLandingHood(pageController: pageController),
                  Belting(pageController: pageController),
                  Handholds(pageController: pageController),
                  Steps(pageController: pageController),
                  IntermediateLanding(pageController: pageController),
                  TopLanding(pageController: pageController),
                  DriveAssembly(pageController: pageController),
                  TopLandingSafeties(pageController: pageController),
                  Electrical(pageController: pageController),
                  LoadTest(pageController: pageController),
                  ImagePickingWidget(pageController: pageController),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
