import 'package:flutter/material.dart';
import 'package:manlift_app/feature/cage/quarterly/cage_quaterly.dart';
import 'package:manlift_app/feature/cage/annual/pages/cage_annual.dart';
import 'package:manlift_app/util/navigate.dart';

class CagePage extends StatelessWidget {
  CagePage({super.key});

  final List<String> type = ["Monthly", "Quarterly", "Yearly"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              'Cage Form',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 3,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  mainAxisExtent: MediaQuery.of(context).size.height * 0.25,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      moveTo(context, const CageQuaterlyPage(title: "Monthly"));
                    } else if (index == 1) {
                      moveTo(
                          context, const CageQuaterlyPage(title: "Quaterly"));
                    } else if (index == 2) {
                      moveTo(context, const CageAnnualyPage());
                    }
                  },
                  child: Card(
                    child: Center(
                        child: Text(
                      type[index],
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
