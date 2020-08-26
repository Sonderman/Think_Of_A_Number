import 'package:flutter/material.dart';

class NavigationManager {
  PageController homePageController =
      PageController(initialPage: 0, keepPage: false);

  void nextPage() {
    homePageController.nextPage(
        duration: Duration(seconds: 1), curve: Curves.ease);
  }

  void restart() {
    homePageController.jumpToPage(0);
  }
}
