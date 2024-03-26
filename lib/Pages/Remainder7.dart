import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:think_of_a_number/Services.dart';
import 'package:think_of_a_number/Theming.dart';

class Remainder7 extends StatefulWidget {
  const Remainder7({super.key});

  @override
  _Remainder7State createState() => _Remainder7State();
}

class _Remainder7State extends State<Remainder7> {
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "7'ye  Bölümünden kalanı seçiniz.",
                  style: MyTheme(context).textBig,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height(10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Services.guesser.k7 = 0;
                        });
                      },
                      child: Card(
                        color: Services.guesser.k7 == 0
                            ? Colors.black
                            : Colors.blue,
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
                          Services.guesser.k7 = 1;
                        });
                      },
                      child: Card(
                        color: Services.guesser.k7 == 1
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
                          Services.guesser.k7 = 2;
                        });
                      },
                      child: Card(
                        color: Services.guesser.k7 == 2
                            ? Colors.black
                            : Colors.pink,
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
                ),
                SizedBox(
                  height: height(5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Services.guesser.k7 = 3;
                        });
                      },
                      child: Card(
                        color: Services.guesser.k7 == 3
                            ? Colors.black
                            : Colors.orange,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "3",
                            style: MyTheme(context).numberBig,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Services.guesser.k7 = 4;
                        });
                      },
                      child: Card(
                        color: Services.guesser.k7 == 4
                            ? Colors.black
                            : Colors.purple,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "4",
                            style: MyTheme(context).numberBig,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height(5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Services.guesser.k7 = 5;
                        });
                      },
                      child: Card(
                        color: Services.guesser.k7 == 5
                            ? Colors.black
                            : Colors.brown,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "5",
                            style: MyTheme(context).numberBig,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Services.guesser.k7 = 6;
                        });
                      },
                      child: Card(
                        color: Services.guesser.k7 == 6
                            ? Colors.black
                            : Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "6",
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
        ),
        SizedBox(
          height: height(5),
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
                    icon: const Icon(
                      Icons.navigate_before,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Services.navigationManager.previous();
                    })),
            const Spacer(),
            Card(
                color: Colors.blue,
                child: IconButton(
                    iconSize: width(10),
                    icon: const Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (Services.guesser.k7 != null) {
                        Services.guesser.guess();
                        Services.navigationManager.nextPage();
                      } else {
                        Fluttertoast.showToast(
                            msg: "Lütfen bir kalan değeri seçin!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    })),
            SizedBox(
              width: width(10),
            )
          ],
        ),
        SizedBox(
          height: height(5),
        )
      ],
    );
  }
}
