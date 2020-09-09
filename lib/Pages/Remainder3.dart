import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:think_of_a_number/Services.dart';
import 'package:think_of_a_number/Theming.dart';

class Remainder3 extends StatefulWidget {
  Remainder3({Key key}) : super(key: key);

  @override
  _Remainder3State createState() => _Remainder3State();
}

class _Remainder3State extends State<Remainder3> {
  @override
  Widget build(BuildContext context) {
    double width(int pe) {
      return MediaQuery.of(context).size.width * pe / 100;
    }

    double height(int pe) {
      return MediaQuery.of(context).size.height * pe / 100;
    }

    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "3'e  Bölümünden kalanı seçiniz.",
                style: MyTheme(context).textBig,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height(15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Services.guesser.k3 = 0;
                      });
                    },
                    child: Card(
                      color:
                          Services.guesser.k3 == 0 ? Colors.black : Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "0",
                          style: MyTheme(context).numberBig,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Services.guesser.k3 = 1;
                      });
                    },
                    child: Card(
                      color: Services.guesser.k3 == 1
                          ? Colors.black
                          : Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "1",
                          style: MyTheme(context).numberBig,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Services.guesser.k3 = 2;
                      });
                    },
                    child: Card(
                      color:
                          Services.guesser.k3 == 2 ? Colors.black : Colors.pink,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "2",
                          style: MyTheme(context).numberBig,
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
              width: width(10),
            ),
            Card(
                color: Colors.blue,
                child: IconButton(
                    iconSize: width(10),
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
                    iconSize: width(10),
                    icon: Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (Services.guesser.k3 != null)
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
              width: width(10),
            )
          ],
        ),
        SizedBox(height: height(10))
      ],
    );
  }
}
