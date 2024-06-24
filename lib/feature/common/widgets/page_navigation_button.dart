import 'package:flutter/material.dart';

class PageNavigationButton extends StatelessWidget {
  const PageNavigationButton(
      {super.key, required this.pageController, required this.right});

  final PageController pageController;
  final bool right;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: right ? Alignment.centerRight : Alignment.centerLeft,
      child: ElevatedButton(
        onPressed: () {
          if (right) {
            pageController.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.linear,
            );
          } else {
            pageController.previousPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.linear,
            );
          }
        },
        child: Icon(right ? Icons.arrow_forward : Icons.arrow_back),
      ),
    );
  }
}
