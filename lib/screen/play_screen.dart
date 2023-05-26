import 'dart:math';

import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  int firstHand = 0;
  int secondHand = 0;
  int turn = 0;
  int rock = 0;
  int paper = 1;
  int scissior = 2;
  int current_result = 0;

  Map<int, String> hands = {
    0: 'rock_hand',
    1: 'paper_hand',
    2: 'scissors_hand'
  };
  Map<int, String> result_map = {0: 'rating', 1: 'thumb-up', 2: 'thumb-down'};
  int first_score = 0;
  int second_score = 0;

  // void calculateResult
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff532a89),
        title: Text(
          'Paper Rock Scissors Game',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      // backgroundColor: Color(0xFFA61F69),
      backgroundColor: Color(0xff8f6bbe),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Turn $turn / 10',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 36,
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              firstHand = Random().nextInt(3);
                              secondHand = Random().nextInt(3);

                              if (firstHand == secondHand) {
                                current_result = 0;
                              } else if (firstHand == 0 && secondHand == 1) {
                                current_result = 2;
                                secondHand++;
                              } else if (firstHand == 0 && secondHand == 2) {
                                current_result = 1;
                                first_score++;
                              } else if (firstHand == 1 && secondHand == 0) {
                                current_result = 1;
                                first_score++;
                              } else if (firstHand == 1 && secondHand == 2) {
                                current_result = 2;
                                second_score++;
                              } else if (firstHand == 2 && secondHand == 0) {
                                current_result = 2;
                                second_score++;
                              } else if (firstHand == 2 && secondHand == 1) {
                                current_result = 1;
                                first_score++;
                              }

                              if (turn < 10) {
                                turn++;
                              }
                              if (turn == 10) {
                                Future.delayed(Duration(seconds: 2), () {
                                  _showAlertDialog();
                                });
                              }
                            });
                          },
                          child: Container(
                            padding: EdgeInsetsDirectional.symmetric(
                                horizontal: 8, vertical: 20),
                            // margin: EdgeInsets.symmetric(horizontal: 8),
                            // padding: EdgeInsetsDirectional.all(40),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color(0xFFadcd55),
                              // color: Color(0xFFEDED45),
                              border: Border.all(
                                width: 5,
                                color: Color(0xff64389f),
                              ),
                            ),
                            child: Image.asset('images/${hands[firstHand]}.png',
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          // height: 50,
                          // width: 50,
                          padding:
                              EdgeInsetsDirectional.symmetric(vertical: 16),
                          // decoration: BoxDecoration(
                          //     // color: Colors.cyan,
                          //     // image: DecorationImage(
                          //     //   image: AssetImage(
                          //     //     'images/debate.png',
                          //     //   ),
                          //     //   fit: BoxFit.cover,
                          //     // ),
                          //     ),
                          // decoration: BoxDecoration(color: Colors.white),
                          child: Image.asset(
                            color: Colors.white,
                            'images/versus.png',
                            fit: BoxFit.cover,
                          ),
                          // child: Icon(
                          //   Icons.view_comfy_sharp,
                          //   size: 32,
                          // ),
                        ),
                        // child: Text('bvjhv'))
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsetsDirectional.symmetric(
                                horizontal: 8, vertical: 20),
                            // margin: EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color(0xFFf7c74f),
                              border: Border.all(
                                width: 5,
                                color: Color(0xff64389f),
                              ),
                            ),
                            child:
                                Image.asset('images/${hands[secondHand]}.png'),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '  You',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff2d2929)),
                          ),
                          Text(
                            'System',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff2d2929)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  child:
                      Image.asset('images/${result_map[current_result]}.png'),
                ),
                Container(
                  // decoration: BoxDecoration(border: Border.all(width: 2),),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          'Score',
                          style: TextStyle(
                            fontSize: 36,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Divider(
                        endIndent: 70,
                        indent: 70,
                        color: Colors.white,
                        thickness: 5,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text(
                              '$first_score',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFEFEFE)),
                              textAlign: TextAlign.center,
                            )),
                            SizedBox(
                              child: Divider(
                                height: 30,
                                thickness: 50,
                                color: Colors.white,
                              ),
                              width: 5,
                            ),
                            Expanded(
                                child: Text(
                              '$second_score',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Color(0xFFFEFEFE)),
                              textAlign: TextAlign.center,
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showAlertDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // <-- SEE HERE
          // title: const Text('Result'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                first_score >= second_score
                    ? Icons.gpp_good_outlined
                    : Icons.close,
                color: first_score >= second_score
                    ? Color(0xFF00FF00)
                    : Color(0xFFFF0000),
                size: 128,
              ),
              Text(
                'END Game',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Your Score is $first_score/10',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Play Again'),
              onPressed: () {
                setState(() {
                  second_score = 0;
                  first_score = 0;
                  current_result = 0;
                  firstHand = 0;
                  secondHand = 0;
                  turn = 0;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
