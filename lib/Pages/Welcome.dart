import 'package:flutter/material.dart';
import 'package:think_of_a_number/adwidgets.dart';
import 'package:think_of_a_number/services.dart';
import 'package:think_of_a_number/Services/Guesser.dart';
import 'package:think_of_a_number/theming.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  double width(int pe) {
    return MediaQuery.of(context).size.width * pe / 100;
  }

  double height(int pe) {
    return MediaQuery.of(context).size.height * pe / 100;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              "Modu Seçin",
              style: MyTheme(context).textBig,
            ),
            SizedBox(
              height: height(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Services.guesser.mode = GuessMode.ZeroTo100;
                    });
                  },
                  child: Card(
                    color: Services.guesser.mode == GuessMode.ZeroTo100
                        ? Colors.black
                        : Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "0-100",
                        style: MyTheme(context).numberBig,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Services.guesser.mode = GuessMode.OneHundredTo200;
                    });
                  },
                  child: Card(
                    color: Services.guesser.mode == GuessMode.OneHundredTo200
                        ? Colors.black
                        : Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "100-200",
                        style: MyTheme(context).numberBig,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height(15),
            ),
            Card(
                color: Colors.blue,
                child: IconButton(
                    iconSize: width(15),
                    icon: const Icon(
                      Icons.play_circle_outline,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Services.navigationManager.nextPage();
                    })),
          ],
        ),
        Align(alignment: Alignment.bottomCenter, child: MyBannerAdWidget()),
      ],
    );
  }
}
