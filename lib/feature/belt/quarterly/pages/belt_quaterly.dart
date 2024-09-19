import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manlift_app/feature/belt/quarterly/widget/belting.dart';
import 'package:manlift_app/feature/belt/quarterly/widget/bottom_landing.dart';
import 'package:manlift_app/feature/belt/quarterly/widget/bottom_landing_hood.dart';
import 'package:manlift_app/feature/belt/quarterly/widget/bottom_landing_safeties.dart';
import 'package:manlift_app/feature/belt/quarterly/widget/drive_assembly.dart';
import 'package:manlift_app/feature/belt/quarterly/widget/handholds.dart';
import 'package:manlift_app/feature/belt/quarterly/widget/intermediate_landing.dart';
import 'package:manlift_app/feature/belt/quarterly/widget/steps.dart';
import 'package:manlift_app/feature/belt/quarterly/widget/tail_section.dart';
import 'package:manlift_app/feature/belt/quarterly/widget/top_landing.dart';
import 'package:manlift_app/feature/belt/quarterly/widget/top_landing_safeties.dart';
import 'package:manlift_app/feature/common/widgets/header_form.dart';
import 'package:manlift_app/feature/common/widgets/image_picking_last.dart';

import '../../model/belt_inspection_model.dart';

class BeltQuaterlyPage extends StatefulWidget {
  BeltQuaterlyPage({super.key, required this.title});

  final String title;

  @override
  State<BeltQuaterlyPage> createState() => _BeltQuaterlyPageState();
}

class _BeltQuaterlyPageState extends State<BeltQuaterlyPage> {
  final pageController = PageController();

  final beltModel = BeltInspection();
  Map<String, dynamic> data = {};

  fetchJsonData() async {
    final res = await rootBundle.loadString('assets/belt.json');
    Map<String, dynamic> mapResponse = jsonDecode(res);
    setState(() {
      data = mapResponse;
    });
  }

  @override
  void initState() {
    fetchJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BeltJson(
      data: data,
      runFunction: fetchJsonData,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Text(
                widget.title,
                style: const TextStyle(fontSize: 20),
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  children: [
                    HeaderForm(pageController: pageController),
                    TailSectionFootAssembly(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
                    BottomLandingSafeties(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
                    BottomLanding(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
                    BottomLandingHood(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
                    Belting(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
                    Handholds(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
                    Steps(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
                    IntermediateLanding(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
                    TopLanding(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
                    DriveAssembly(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
                    TopLandingSafeties(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
                    ImagePickingWidget(
                      pageController: pageController,
                      beltModel: beltModel,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BeltJson extends InheritedWidget {
  const BeltJson({
    super.key,
    required super.child,
    required this.data,
    required this.runFunction,
  });

  final Map<String, dynamic> data;
  final Function() runFunction;

  static BeltJson? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BeltJson>();
  }

  @override
  bool updateShouldNotify(BeltJson oldWidget) {
    return oldWidget.data != data;
  }
}
