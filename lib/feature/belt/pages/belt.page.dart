import 'package:flutter/material.dart';
import 'package:manlift_app/feature/belt/annual/pages/belt_annual.dart';
import 'package:manlift_app/feature/belt/quarterly_monthly/pages/belt_quaterly.dart';
import 'package:manlift_app/util/navigate.dart';

class BeltPage extends StatelessWidget {
  BeltPage({super.key});

  final List<String> type = ["Monthly", "Quarterly", "Yearly"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              'Belt Form',
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
                      moveTo(context, const BeltQuaterlyPage(title: "Monthly"));
                    } else if (index == 1) {
                      moveTo(
                          context, const BeltQuaterlyPage(title: "Quarterly"));
                    } else if (index == 2) {
                      moveTo(context,
                          const BeltAnnualPage(title: "Belt Yearly Form"));
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
