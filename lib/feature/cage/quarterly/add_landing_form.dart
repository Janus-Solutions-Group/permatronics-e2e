import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/annual/widget/intermediate_landing.dart';
import 'package:manlift_app/feature/cage/quarterly/landing_form.dart';
import 'package:manlift_app/feature/cage/quarterly/models/landing_model.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';

class AddLandingFormPage extends StatefulWidget {
  const AddLandingFormPage({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<AddLandingFormPage> createState() => _AddLandingFormPageState();
}

class _AddLandingFormPageState extends State<AddLandingFormPage>
    with AutomaticKeepAliveClientMixin {
  List<CageLandingForm> landingFormList = [];
  List<CageQuarterlyLanding> landingModels = [];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            "Add Landing Form",
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
                          child: CageLandingForm(
                            index: index,
                            model: landingModels[index],

                            onSubmit: (val) {
                              landingModels[index] = val;
                            },
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
                          'Landing Form #${index + 1}',
                          style: const TextStyle(
                            fontSize: 20,
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
                  landingModels.add(CageQuarterlyLanding());
                  // landingFormList.add(CageLandingForm(
                  //   model: CageQuarterlyLanding(),
                  // ));
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
