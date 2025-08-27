import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/model/intermediate_landing.dart';
import 'package:manlift_app/feature/belt/quarterly_monthly/widget/intermediate_landing.dart';
import 'package:manlift_app/feature/common/widgets/page_navigation_button.dart';

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
                      isScrollControlled: true,
                      useSafeArea: true,
                      builder: (context) => IntermediateLanding(
                            index: index,
                            model: landingModels[index],
                            // selectedValues: landingSelectedValues[index],
                            // onSubmit: (val) {
                            //   landingModels[index] = val;
                            // },
                          ));
                  // Scaffold.of(context).showBottomSheet(
                  //   (context) => IntermediateLanding(
                  //     index: index,
                  //     model: landingModels[index],
                  //     // selectedValues: landingSelectedValues[index],
                  //     // onSubmit: (val) {
                  //     //   landingModels[index] = val;
                  //     // },
                  //   ),
                  // );
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
