import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Dice App",
    home: homePage(),
  ));
}

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int num1 = 1;
  int num2 = 1;
  int num3 = 1;
  int num4 = 1;
  int pls1 = 0;
  int pls2 = 0;
  int pls3 = 0;
  int pls4 = 0;
  int plt1 = 0;
  int plt2 = 0;
  int plt3 = 0;
  int plt4 = 0;
  int plr = 0;
  int res = 0;
  int turnCount = 1;
  void resetAll() {
    res = 0;
    plr = 0;
    pls1 = 0;
    pls2 = 0;
    pls3 = 0;
    pls4 = 0;
    plt1 = 0;
    plt2 = 0;
    plt3 = 0;
    plt4 = 0;
    turnCount = 1;
  }

  void checkresult1(int pls1, int pls2, int pls3, int pls4, int pn) {
    if (pls1 > pls2 && pls1 > pls3 && pls1 > pls4) {
      plr = pls1;
      res = pn;
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Result"),
              content: Text("Player $res won with scores $plr"),
              contentTextStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok"))
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      "Player 1",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 160),
                    child: Text(
                      "Player 2",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (turnCount == 1) {
                        setState(() {
                          num1 = Random().nextInt(6) + 1;
                          pls1 += num1;
                          if (num1 == 6) {
                            turnCount = 1;
                          } else {
                            plt1 += 1;
                            turnCount += 1;
                          }
                          if (plt1 > 10) {
                            checkresult1(pls1, pls2, pls3, pls4, 1);
                          }
                        });
                      }
                    },
                    child: Image.asset(
                      "images/dice$num1.png",
                      height: turnCount == 1 ? 160 : 150,
                      width: turnCount == 1 ? 160 : 150,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (turnCount == 2) {
                        setState(() {
                          num2 = Random().nextInt(6) + 1;
                          pls2 += num2;
                          if (num2 == 6) {
                            turnCount = 2;
                          } else {
                            plt2 += 1;
                            turnCount += 1;
                          }
                          if (plt2 > 10) {
                            checkresult1(pls2, pls1, pls3, pls4, 2);
                          }
                        });
                      }
                    },
                    child: Image.asset(
                      "images/dice$num2.png",
                      height: turnCount == 2 ? 160 : 150,
                      width: turnCount == 2 ? 160 : 150,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Player 1: $pls1",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 160),
                    child: Text(
                      "Player 2: $pls2",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Player 3: $pls3",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 160),
                    child: Text(
                      "Player 4: $pls4",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ],
              ),
              // Text("Player 3 score: $pls3"),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (turnCount == 3) {
                        setState(() {
                          num3 = Random().nextInt(6) + 1;
                          pls3 += num3;
                          if (num3 == 6) {
                            turnCount = 3;
                          } else {
                            plt3 += 1;
                            turnCount += 1;
                          }
                          if (plt3 > 10) {
                            checkresult1(pls3, pls1, pls2, pls4, 3);
                          }
                        });
                      }
                    },
                    child: Image.asset(
                      "images/dice$num3.png",
                      height: turnCount == 3 ? 160 : 150,
                      width: turnCount == 3 ? 160 : 150,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (turnCount == 4) {
                        setState(() {
                          num4 = Random().nextInt(6) + 1;
                          pls4 += num4;
                          if (num4 == 6) {
                            turnCount = 4;
                          } else {
                            plt4 += 1;
                            turnCount = 1;
                          }
                          if (plt4 > 10) {
                            checkresult1(pls4, pls1, pls2, pls3, 4);
                          }
                        });
                      }
                    },
                    child: Image.asset(
                      "images/dice$num4.png",
                      height: turnCount == 4 ? 160 : 150,
                      width: turnCount == 4 ? 160 : 150,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      "Player 3",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 160),
                    child: Text(
                      "Player 4",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              // Text(
              //         "Player $res won with scores $plr",
              //         style:
              //             TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              //       )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.clear),
          backgroundColor: Colors.red,
          onPressed: () {
            setState(() {
              resetAll();
            });
          },
        ));
  }
}
