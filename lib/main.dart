import 'package:flutter/material.dart';
import 'package:think_of_a_number/Guesser.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController kalan3 = TextEditingController(text: "");
  TextEditingController kalan5 = TextEditingController(text: "");
  TextEditingController kalan7 = TextEditingController(text: "");
  List<int> guesses = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                  TextField(
                    controller: kalan3,
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(hintText: "3 ile bölümden Kalan:"),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    controller: kalan5,
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(hintText: "5 ile bölümden Kalan:"),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    controller: kalan7,
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(hintText: "7 ile bölümden Kalan:"),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    onPressed: () {
                      guesses.clear();
                      Guesser()
                          .guess(int.parse(kalan3.text), int.parse(kalan5.text),
                              int.parse(kalan7.text))
                          .then((numberlist) {
                        setState(() {
                          guesses.addAll(numberlist);
                        });
                      });
                    },
                    color: Colors.blue,
                    child: Text("Tahmin Yap"),
                  ),
                ] +
                (guesses.length > 0 ? [resultMergerToText()] : <Widget>[]),
          ),
        ),
      ),
    );
  }

  Widget resultMergerToText() {
    String tahmin = "";
    guesses.forEach((result) {
      tahmin += ", $result";
    });

    return Text("Tahminler : " + tahmin);
  }
}
