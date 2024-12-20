import 'package:flutter/material.dart';
import 'package:think_of_a_number/pages/Remainder3.dart';
import 'package:think_of_a_number/pages/Remainder5.dart';
import 'package:think_of_a_number/pages/Remainder7.dart';
import 'package:think_of_a_number/pages/Results.dart';
import 'package:think_of_a_number/pages/Welcome.dart';
import 'package:think_of_a_number/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: Services.navigationManager.homePageController,
      children: const [
        Welcome(),
        Remainder3(),
        Remainder5(),
        Remainder7(),
        Results()
      ],
    )));
  }
}
