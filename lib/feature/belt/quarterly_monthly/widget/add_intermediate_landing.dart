import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/model/intermediate_landing.dart';
import 'package:manlift_app/feature/belt/quarterly_monthly/widget/intermediate_landing.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';

import '../pages/belt_quaterly.dart';

class AddQuarterlyIntermediateLandingFormPage extends StatefulWidget {
  const AddQuarterlyIntermediateLandingFormPage(
      {super.key, required this.pageController});

  final PageController pageController;

  @override
  State<AddQuarterlyIntermediateLandingFormPage> createState() =>
      _AddQuarterlyIntermediateLandingFormPageState();
}

class _AddQuarterlyIntermediateLandingFormPageState
    extends State<AddQuarterlyIntermediateLandingFormPage>
    with AutomaticKeepAliveClientMixin {
  List<IntermediateLandingModel> landingModels = [];

  @override
  Widget build(BuildContext context) {
    var jsonData = BeltJson.of(context)!.data;

    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            "Add Intermediate Landing Form",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.separated(
              itemCount: landingModels.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true, // 👈 allows it to resize with keyboard
                    useSafeArea: true,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    builder: (context) => DraggableScrollableSheet(
                      expand: false,
                      initialChildSize: 0.9, // optional: covers ~90% of screen
                      minChildSize: 0.5,
                      maxChildSize: 0.95,
                      builder: (_, scrollController) => Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16,
                          bottom: MediaQuery.of(context).viewInsets.bottom + 20, // 👈 keyboard safe padding
                        ),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: IntermediateLanding(
                            index: index,
                            model: landingModels[index],
                            jsonData: jsonData,
                          ),
                        ),
                      ),
                    ),
                  );

                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Intermediate Landing Form #${index + 1}',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            landingModels.removeAt(index);
                            setState(() {});
                          },
                          icon: const Icon(Icons.cancel),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PageNavigationButton(
                pageController: widget.pageController,
                right: false,
              ),
              ElevatedButton(
                onPressed: () {
                  landingModels.add(IntermediateLandingModel());
                  setState(() {});
                },
                child: const Icon(Icons.add),
              ),
              PageNavigationButton(
                pageController: widget.pageController,
                right: true,
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
