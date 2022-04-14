import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ropascissor/Components/animation_file.dart';
import 'package:ropascissor/Components/jsonwriter.dart';
import 'package:ropascissor/Components/scoreboeard.dart';
import 'package:ropascissor/Screens/Home/congratulations.dart';
import 'package:ropascissor/data/botmessage.dart';
import 'package:ropascissor/data/data.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.roundsNumber}) : super(key: key);

  final int roundsNumber;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int yourScore = 0;
  int cpuScore = 0;
  late int rounds = 1;
  String botMessage = '...';
  bool showRound = false;
  bool showWinner = false;

  String? userChoice = "";
  String? cpuChoice = "";

  String? displayMessage = "";
  String? winner = "";

  JsonWriter? jsonWriter;

  @override
  void initState() {
    // implement initState
    super.initState();
    botMessage = welcomeMessage[Random().nextInt(welcomeMessage.length)];
    showRound = true;
    setState(() {});
  }

  void checkWinner({choice}) {
    setState(() {
      userChoice = choice;
      int number = Random().nextInt(21);
      cpuChoice = tapObjects[number];
      // print(cpuChoice);
      // print(userChoice);
      if (userChoice == cpuChoice) {
        winner = 'draw';
        displayMessage = 'please retake round';
      } else if (userChoice == "rock" && cpuChoice == "scissors") {
        winner = 'user';
        displayMessage = statements[0];
        yourScore++;
        rounds++;
      } else if (userChoice == "scissors" && cpuChoice == "paper") {
        winner = 'user';
        displayMessage = statements[1];
        yourScore++;
        rounds++;
      } else if (userChoice == "paper" && cpuChoice == "rock") {
        winner = 'user';
        displayMessage = statements[2];
        yourScore++;
        rounds++;
      } else if (cpuChoice == "rock" && userChoice == "scissors") {
        winner = 'cpu';
        displayMessage = statements[0];
        cpuScore++;
        rounds++;
      } else if (cpuChoice == "scissors" && userChoice == "paper") {
        winner = 'cpu';
        displayMessage = statements[1];
        cpuScore++;
        rounds++;
      } else if (cpuChoice == "paper" && userChoice == "rock") {
        winner = 'cpu';
        displayMessage = statements[2];
        cpuScore++;
        rounds++;
      }
    });
    startTime();
  }

  startTime() async {
    Timer(const Duration(milliseconds: 3500), showBox);
  }

  Future<void> showBox() async {
    setState(() {
      showWinner = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SafeArea(
            child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(color: Colors.black),
          child: Stack(
            children: [
              Stack(
                children: [
                  ////Background Wallpaper
                  Opacity(
                    opacity: 0.6,
                    child: Image.asset(
                      'assets/images/wallpaper.jpg',
                      height: height,
                      width: width,
                    ),
                  ),

                  ///Front Features
                  Column(children: [
                    SizedBox(
                      height: height * 0.75,
                      width: width,
                      child: Column(
                        children: [
                          ///////Score Board/////////
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Image.asset(
                                      'assets/images/bot.png',
                                      height: 70,
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        )),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RichText(
                                        text: TextSpan(children: <TextSpan>[
                                          TextSpan(
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'EmojiOne',
                                            ),

                                            text:
                                                botMessage, // non-emoji characters
                                          ),
                                        ]),
                                      ), // Text(botWinning[1]) //botMessage),
                                    ),
                                  ),
                                ],
                              ),
                              ScoreBoard(
                                yourScore: yourScore,
                                cpuScore: cpuScore,
                              ),
                            ],
                          )
                          /////////////////////////////////////////////////
                          //////////////////////////////////////////////////////
                          ///////////////// Main Screen ////////////////////
                          ,
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              // color: Colors.white,
                              child: Stack(
                                children: [
                                  cpuChoice!.isNotEmpty
                                      ? Center(
                                          child: Image.asset(
                                            'assets/images/bolt.png',
                                            height: 100,
                                          ),
                                        )
                                      : Container(),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        cpuChoice!.isNotEmpty
                                            ? ResultPic(
                                                choice: cpuChoice,
                                                who: 'cpu',
                                              )
                                            : Container(),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        userChoice!.isNotEmpty
                                            ? ResultPic(
                                                choice: userChoice,
                                                who: 'user',
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.2,
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          taps(
                              onTap: () {
                                showRound = false;
                                checkWinner(choice: 'rock');
                              },
                              image: 'assets/taps/rock.png'),
                          taps(
                              onTap: () {
                                showRound = false;
                                checkWinner(choice: 'scissors');
                              },
                              image: 'assets/taps/scissors.png'),
                          taps(
                              onTap: () {
                                showRound = false;
                                checkWinner(choice: 'paper');
                              },
                              image: 'assets/taps/paper.png'),
                        ],
                      ),
                    )
                  ]),
                ],
              ),
              ///////////Informations//////////////
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    showWinner
                        ? const SizedBox()
                        : showRound
                            ? CountRound(number: rounds)
                            : const SizedBox(),
                    showRound
                        ? const SizedBox()
                        : showWinner
                            ? winnerWidget(
                                displayMessage: displayMessage!.isNotEmpty
                                    ? displayMessage!
                                    : "",
                                win: winner!.isNotEmpty ? winner! : "")
                            : const SizedBox(),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Widget taps({required VoidCallback onTap, required String image}) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        image,
        height: 60,
        width: 60,
      ),
    );
  }

  Widget winnerWidget({required String displayMessage, required String win}) {
    return InkWell(
      onTap: () {
        setState(() {
          if (rounds > widget.roundsNumber) {
            String status =
                yourScore > cpuScore ? "Congratulations" : 'Sorry, you lost';
            jsonEncode(JsonWriter(
              date: DateTime.now().toString(),
              cpuPoints: cpuScore.toString(),
              status: win,
              time: DateTime.now().toString(),
              userPoints: yourScore.toString(),
            ));
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Congratulations(message: status)));
          }
          win != "draw"
              ? win == "user"
                  ? botMessage = botLosing[Random().nextInt(botLosing.length)]
                  : botMessage = botWinning[Random().nextInt(botWinning.length)]
              : botMessage = "Draw";
          showWinner = false;
          showRound = true;
          userChoice = "";
          cpuChoice = "";
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.95,
        color: Colors.white.withOpacity(0.2),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  win != "draw"
                      ? win == "user"
                          ? 'You Won'
                          : "You Losts"
                      : "Draw",
                  style: TextStyle(
                      color: win != "draw"
                          ? win == "user"
                              ? Colors.green
                              : Colors.red
                          : Colors.blue, //Color.fromRGBO(252, 125, 51, 1),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  displayMessage,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  win != "draw"
                      ? win == "user"
                          ? "😃"
                          : "🥵"
                      : "😐",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Tap to continue",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResultPic extends StatelessWidget {
  const ResultPic({Key? key, required this.choice, required this.who})
      : super(key: key);

  final String? choice;
  final String? who;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      who == "user"
          ? "assets/images/${choice!}1.png"
          : "assets/images/${choice!}.png",
      height: choice == 'rock' ? 100 : 120,
      width: 120,
    );
  }
}
