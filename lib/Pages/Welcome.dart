import 'package:flutter/material.dart';
import 'package:think_of_a_number/Services.dart';
import 'package:think_of_a_number/Services/Guesser.dart';
import 'package:think_of_a_number/Theming.dart';

class Welcome extends StatefulWidget {
  Welcome({Key key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Modu Seçin",
          style: MyTheme().textBig,
        ),
        SizedBox(
          height: 30,
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
                    style: MyTheme().numberBig,
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
                    style: MyTheme().numberBig,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 100,
        ),
        Card(
            color: Colors.blue,
            child: IconButton(
                iconSize: 80,
                icon: Icon(
                  Icons.play_circle_outline,
                  color: Colors.white,
                ),
                onPressed: () {
                  Services.navigationManager.nextPage();
                })),
      ],
    );
  }
}
