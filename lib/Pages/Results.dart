import 'package:flutter/material.dart';
import 'package:think_of_a_number/Services.dart';
import 'package:think_of_a_number/Theming.dart';

class Results extends StatelessWidget {
  const Results({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> results = resultsToCard();
    print("k3:" +
        Services.guesser.k3.toString() +
        "\nk5:" +
        Services.guesser.k5.toString() +
        "\nk7:" +
        Services.guesser.k7.toString());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Sonuç:",
          style: MyTheme().textBig,
        ),
        SizedBox(
          height: 40,
        ),
        results.length != 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: results,
              )
            : Card(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Lütfen tekrar deneyin! Mod seçimi veya kalan belirtimi işleminde hata yapmış olabilirsiniz.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
        SizedBox(
          height: 40,
        ),
        Card(
            color: Colors.blue,
            child: IconButton(
                iconSize: 80,
                icon: Icon(
                  Icons.replay,
                  color: Colors.white,
                ),
                onPressed: () {
                  Services.guesser.k3 = null;
                  Services.guesser.k5 = null;
                  Services.guesser.k7 = null;
                  Services.navigationManager.restart();
                })),
        SizedBox(
          height: 50,
        )
      ],
    );
  }

  List<Widget> resultsToCard() {
    List<Card> results = [];
    Services.guesser.getResults().toSet().toList().forEach((result) {
      if (result != null)
        results.add(Card(
          color: Colors.brown,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(result.toString(), style: MyTheme().numberBig),
          ),
        ));
    });

    return results;
  }
}
