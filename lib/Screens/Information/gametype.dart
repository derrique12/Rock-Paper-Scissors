import 'package:flutter/material.dart';
import 'package:ropascissor/Screens/Home/home.dart';
import 'package:ropascissor/Screens/settings/settings.dart';

class GameType extends StatefulWidget {
  const GameType({Key? key}) : super(key: key);

  @override
  State<GameType> createState() => _GameTypeState();
}

class _GameTypeState extends State<GameType> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Single Player"), value: "single"),
      const DropdownMenuItem(child: Text("Multi Players"), value: "multi"),
    ];
    return menuItems;
  }

  String selectedValue = "single";
  int numberOfRounds = 3;
  //rgb(192,192,192) #C0C0C0
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Stack(
        children: [
          Stack(
            children: [
              ////Background Styling
              Container(),
              ///////Choosing Options
              Center(
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.7,
                      child: Image.asset(
                        'assets/images/wallpaper.jpg',
                        height: height,
                        width: width,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(5),
                              child: DropdownButtonFormField<String>(
                                style: ktextStyle,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(192, 192, 192, 1),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color.fromRGBO(192, 192, 192, 1),
                                        width: 2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                value: selectedValue,
                                items: dropdownItems,
                                onChanged: (value) {
                                  selectedValue = value!;
                                },
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: SmallBox(
                                  child: Text(
                                    numberOfRounds.toString(),
                                    style: ktextStyle,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 35,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: InkWell(
                                  onTap: () {
                                    if (numberOfRounds <= 13) {
                                      setState(() {
                                        numberOfRounds += 2;
                                      });
                                    }
                                  },
                                  child: const SmallBox(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      color: Color.fromRGBO(252, 125, 51, 1)),
                                ),
                              ),
                              numberOfRounds != 3
                                  ? InkWell(
                                      onTap: () {
                                        if (numberOfRounds >= 5) {
                                          setState(() {
                                            numberOfRounds -= 2;
                                          });
                                        }
                                      },
                                      child: const SmallBox(
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        color: Color.fromRGBO(252, 125, 51, 1),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Padding(
                            padding: EdgeInsets.only(left: 4.0),
                            child: Text(
                              '* Select number of rounds',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home(
                                            roundsNumber: numberOfRounds,
                                          )));
                            },
                            child: deContainer(
                                child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 12),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Text(
                                          'Start Game',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                    // Row(
                                    //   children: const [
                                    //     Icon(
                                    //       Icons.exit_to_app,
                                    //       size: 32,
                                    //       color: Color.fromARGB(255, 109, 109, 109),
                                    //     ),
                                    //     SizedBox(
                                    //       width: 8,
                                    //     ),
                                    //     Text(
                                    //       'Exit Game',
                                    //       style: ktextStyle,
                                    //     )
                                    //   ],
                                    // ),
                                    )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            bottom: 30,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Settings()));
              },
              child: const Icon(
                Icons.menu_book_rounded,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget deContainer({required Widget child}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(252, 125, 51, 1),
        border:
            Border.all(color: const Color.fromRGBO(192, 192, 192, 1), width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}

class SmallBox extends StatelessWidget {
  const SmallBox({
    Key? key,
    required this.child,
    this.color,
  }) : super(key: key);

  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        border:
            Border.all(color: const Color.fromRGBO(192, 192, 192, 1), width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}

const ktextStyle =
    TextStyle(fontSize: 20, color: Color.fromARGB(255, 87, 87, 87));
