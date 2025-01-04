import 'package:flutter/material.dart';
import 'package:manlift_app/feature/cage/annual/model/annnual_landing.dart';
import 'package:manlift_app/feature/cage/annual/widgets/annual_landing_form.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';

class AddAnnualLandingFormPage extends StatefulWidget {
  const AddAnnualLandingFormPage({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<AddAnnualLandingFormPage> createState() =>
      _AddAnnualLandingFormPageState();
}

class _AddAnnualLandingFormPageState extends State<AddAnnualLandingFormPage>
    with AutomaticKeepAliveClientMixin {
  List<AnnualLandingForm> landingFormList = [];
  List<CageAnnualLanding> landingModels = [];

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
                  Scaffold.of(context).showBottomSheet(
                    (context) => AnnualLandingForm(
                      index: index,
                      model: landingModels[index],
                      onSubmit: (val) {
                        landingModels[index] = val;
                      },
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
                  landingModels.add(CageAnnualLanding());
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
