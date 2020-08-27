import 'package:flutter/material.dart';
import 'package:think_of_a_number/Services.dart';
import 'package:think_of_a_number/Theming.dart';

class Results extends StatelessWidget {
  const Results({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Results:",
              style: MyTheme().textBig,
            ),
            //Text(Services.guesser.resultsText),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: resultsToCard(),
            )
          ],
        )),
        Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Card(
                color: Colors.blue,
                child: IconButton(
                    iconSize: 40,
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
            Spacer(),
          ],
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }

  List<Widget> resultsToCard() {
    List<Card> results = [];
    Services.guesser.getResults().forEach((result) {
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
