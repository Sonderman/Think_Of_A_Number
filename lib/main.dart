import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:think_of_a_number/Pages/Home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    builder: (context, child) {
      return ScrollConfiguration(
        behavior: MyBehavior(),
        child: child,
      );
    },
    home: HomePage(),
  ));
}

//Removes Scroll effects
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
