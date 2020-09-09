import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  final BuildContext context;

  double width(int pe) {
    return MediaQuery.of(context).size.width * pe / 100;
  }

  double height(int pe) {
    return MediaQuery.of(context).size.height * pe / 100;
  }

  TextStyle numberBig;
  TextStyle textBig;
  MyTheme(this.context) {
    numberBig = GoogleFonts.pacifico(fontSize: width(7), color: Colors.white);
    textBig = GoogleFonts.permanentMarker(fontSize: width(10));
  }
}
