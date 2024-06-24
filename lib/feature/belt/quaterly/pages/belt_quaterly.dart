import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/quaterly/widget/belting.dart';
import 'package:manlift_app/feature/belt/quaterly/widget/bottom_landing.dart';
import 'package:manlift_app/feature/belt/quaterly/widget/bottom_landing_hood.dart';
import 'package:manlift_app/feature/belt/quaterly/widget/bottom_landing_safeties.dart';
import 'package:manlift_app/feature/belt/quaterly/widget/handholds.dart';
import 'package:manlift_app/feature/belt/quaterly/widget/intermediate_landing.dart';
import 'package:manlift_app/feature/belt/quaterly/widget/steps.dart';
import 'package:manlift_app/feature/belt/quaterly/widget/tail_section.dart';
import 'package:manlift_app/feature/common/widgets/header_form.dart';

class BeltQuaterlyPage extends StatelessWidget {
  BeltQuaterlyPage({super.key});

  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              'Belt Quaterly Form',
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: PageView(
                children: [
                  HeaderForm(pageController: pageController),
                  TailSectionFootAssembly(pageController: pageController),
                  BottomLandingSafeties(pageController: pageController),
                  BottomLanding(pageController: pageController),
                  BottomLandingHood(pageController: pageController),
                  Belting(pageController: pageController),
                  Handholds(pageController: pageController),
                  Steps(pageController: pageController),
                  IntermediateLanding(pageController: pageController),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
