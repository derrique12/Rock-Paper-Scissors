import 'package:flutter/material.dart';
import 'package:ropascissor/Components/preferencesetup.dart';
import 'package:ropascissor/Screens/Information/gametype.dart';

class Instructions extends StatefulWidget {
  const Instructions({Key? key}) : super(key: key);

  @override
  State<Instructions> createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  bool dontShow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color.fromARGB(226, 255, 255, 255),
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
          child: Column(
            children: [
              const Text(
                'INSTRUCTIONS',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Agne',
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(color: Colors.grey),
                children: [
                  TableRow(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    children: [
                      TableCell(child: tableChild('Rock', true)),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            'assets/images/rock.png',
                            height: 40,
                          ),
                        ),
                      ),
                      TableCell(child: tableChild('a closed fist', false)),
                    ],
                  ),
                  TableRow(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      children: [
                        TableCell(child: tableChild('Paper', true)),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'assets/images/paper.png',
                              height: 45,
                            ),
                          ),
                        ),
                        TableCell(child: tableChild('a flat hand', false)),
                      ]),
                  TableRow(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      children: [
                        TableCell(child: tableChild('Scissors', true)),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(5.5),
                            child: Image.asset(
                              'assets/images/scissors.png',
                              height: 40,
                            ),
                          ),
                        ),
                        TableCell(child: tableChild(' V sign', false)),
                      ])
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                " A game (used serves as a tiebreaker) in which, at an agreed signal, each participant makes a gesture with one hand representing either a rock, paper, or a pair of scissors, the winner being determined according to an established scheme as follows:",
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(50, 175, 174, 174),
                      border: Border(
                          left: BorderSide(
                              width: 2,
                              color: Color.fromRGBO(252, 125, 51, 1)))),
                  child: const Text(
                    'rock blunts scissors (rock wins); scissors cut paper (scissors win);  paper covers rock (paper wins).',
                    style: TextStyle(fontSize: 17),
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "If both players choose the same shape, the game is tied and is usually immediately replayed to break the tie.",
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    dontShow = !dontShow;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: dontShow,
                      onChanged: (dontShow) {},
                    ),
                    // const SizedBox(
                    //   width: 5,
                    // ),
                    const Text(
                      "Don't show instructions again.",
                      style: TextStyle(
                          fontSize: 17, color: Color.fromRGBO(252, 125, 51, 1)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (dontShow == true) {
                    addStringToSF('skipInstruction', 'true');
                  }
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GameType()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(11),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                        child: Text('Start Game',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget tableChild(child, bool boldd) {
    return Center(
      child: Text(
        child,
        style: TextStyle(
            fontSize: 15,
            fontWeight: boldd ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
