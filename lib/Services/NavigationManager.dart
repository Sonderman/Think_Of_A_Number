import 'package:flutter/material.dart';

class NavigationManager {
  PageController homePageController =
      PageController(initialPage: 0, keepPage: false);

  void nextPage() {
    homePageController.nextPage(
        duration: const Duration(seconds: 1), curve: Curves.ease);
  }

  void restart() {
    homePageController.jumpToPage(0);
  }

  void previous() {
    homePageController.previousPage(
        duration: const Duration(seconds: 1), curve: Curves.ease);
  }
}
