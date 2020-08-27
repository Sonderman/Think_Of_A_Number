import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:think_of_a_number/Services.dart';
import 'package:think_of_a_number/Theming.dart';

class Remainder5 extends StatefulWidget {
  Remainder5({Key key}) : super(key: key);

  @override
  _Remainder5State createState() => _Remainder5State();
}

class _Remainder5State extends State<Remainder5> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "5'e  Bölümünden kalanı seçiniz.",
                style: MyTheme().textBig,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Services.guesser.k5 = 0;
                      });
                    },
                    child: Card(
                      color:
                          Services.guesser.k5 == 0 ? Colors.black : Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "0",
                          style: MyTheme().numberBig,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Services.guesser.k5 = 1;
                      });
                    },
                    child: Card(
                      color: Services.guesser.k5 == 1
                          ? Colors.black
                          : Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "1",
                          style: MyTheme().numberBig,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Services.guesser.k5 = 2;
                      });
                    },
                    child: Card(
                      color:
                          Services.guesser.k5 == 2 ? Colors.black : Colors.pink,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "2",
                          style: MyTheme().numberBig,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Services.guesser.k5 = 3;
                      });
                    },
                    child: Card(
                      color: Services.guesser.k5 == 3
                          ? Colors.black
                          : Colors.orange,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "3",
                          style: MyTheme().numberBig,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Services.guesser.k5 = 4;
                      });
                    },
                    child: Card(
                      color: Services.guesser.k5 == 4
                          ? Colors.black
                          : Colors.purple,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "4",
                          style: MyTheme().numberBig,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
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
                      Icons.navigate_before,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Services.navigationManager.previous();
                    })),
            Spacer(),
            Card(
                color: Colors.blue,
                child: IconButton(
                    iconSize: 40,
                    icon: Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (Services.guesser.k5 != null)
                        Services.navigationManager.nextPage();
                      else
                        Fluttertoast.showToast(
                            msg: "Lütfen bir kalan değeri seçin!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                    })),
            SizedBox(
              width: 30,
            )
          ],
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}
