import 'package:flutter/material.dart';
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
                  // moveTo(context, CageLandingForm());
                  showModalBottomSheet(
                      context: context,
                      useSafeArea: true,
                      isScrollControlled: true,
                      builder: (context) => CageLandingForm(
                            index: index,
                            model: landingModels[index],
                            onSubmit: (val) {
                              landingModels[index] = val;
                            },
                          ),);
                  // Scaffold.of(context).showBottomSheet(
                  //   (context) => CageLandingForm(
                  //     index: index,
                  //     model: landingModels[index],
                  //     onSubmit: (val) {
                  //       landingModels[index] = val;
                  //     },
                  //   ),
                  // );
                  // controller.setState;
                  // showBottomSheet(
                  //   context: context,
                  //   // isScrollControlled: true,
                  //   constraints: BoxConstraints.expand(
                  //     height: MediaQuery.of(context).size.height * 0.9,
                  //   ),
                  //   builder: (context) {
                  //     return landingFormList[index];
                  //   },
                  // );
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
