import 'package:flutter/material.dart';
import 'package:think_of_a_number/Pages/Remainder3.dart';
import 'package:think_of_a_number/Pages/Remainder5.dart';
import 'package:think_of_a_number/Pages/Remainder7.dart';
import 'package:think_of_a_number/Pages/Results.dart';
import 'package:think_of_a_number/Pages/Welcome.dart';
import 'package:think_of_a_number/Services.dart';

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
