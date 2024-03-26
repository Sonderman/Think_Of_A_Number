import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:think_of_a_number/Services.dart';
import 'package:think_of_a_number/Theming.dart';

class Results extends StatelessWidget {
  const Results({super.key});

  @override
  Widget build(BuildContext context) {
    double width(int pe) {
      return MediaQuery.of(context).size.width * pe / 100;
    }

    double height(int pe) {
      return MediaQuery.of(context).size.height * pe / 100;
    }

    List<Widget> results = resultsToCard(context);
    if (kDebugMode) {
      print(
          "k3:${Services.guesser.k3}\nk5:${Services.guesser.k5}\nk7:${Services.guesser.k7}");
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Sonuç:",
          style: MyTheme(context).textBig,
        ),
        SizedBox(
          height: height(10),
        ),
        results.isNotEmpty
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
                        fontSize: width(4),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
        SizedBox(
          height: height(10),
        ),
        Card(
            color: Colors.blue,
            child: IconButton(
                iconSize: width(15),
                icon: const Icon(
                  Icons.replay,
                  color: Colors.white,
                ),
                onPressed: () {
                  Services.guesser.k3 = null;
                  Services.guesser.k5 = null;
                  Services.guesser.k7 = null;
                  Services.navigationManager.restart();
                })),
      ],
    );
  }

  List<Widget> resultsToCard(BuildContext context) {
    List<Card> results = [];
    Services.guesser.getResults()?.toSet().toList().forEach((result) {
      if (result != null) {
        results.add(Card(
          color: Colors.brown,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(result.toString(), style: MyTheme(context).numberBig),
          ),
        ));
      }
    });

    return results;
  }
}
