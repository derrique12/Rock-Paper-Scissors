import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:ropascissor/Screens/Information/gametype.dart';
import 'package:ropascissor/Screens/Information/instructions.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primarySwatch: Colors.blue
          ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> navigatorPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString('skipInstruction') == "true"
        ? Navigator.of(context).pushReplacement(
            PageRouteBuilder(pageBuilder: (_, __, ___) => const GameType()))
        : Navigator.of(context).pushReplacement(PageRouteBuilder(
            pageBuilder: (_, __, ___) => const Instructions()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(226, 255, 255, 255),
      body: Stack(
        children: [
          // Center(
          //   child: Padding(
          //     padding: const EdgeInsets.only(bottom: 170.0),
          //     child: Opacity(
          //       child: Image.asset('assets/images/ropasci.png', height: 200),
          //       opacity: 0.7,
          //     ),
          //   ),
          // ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Opacity(
                  child: Image.asset('assets/images/ropasci.png', height: 200),
                  opacity: 0.7,
                ),
                const SizedBox(
                  height: 15,
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Agne',
                  ),
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Rock paper scissors',
                        textStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        speed: const Duration(
                          milliseconds: 100,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Agne',
                    color: Color.fromRGBO(252, 125, 51, 1),
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'rock blunts scissors,',
                      ),
                      TypewriterAnimatedText(
                        'scissors cut paper,',
                      ),
                      TypewriterAnimatedText(
                        'paper covers rock.',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                // Play Button
                InkWell(
                  onTap: () {
                    navigatorPage();
                  },
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(65),
                        color: Colors.white,
                        border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(153, 71, 71, 71))),
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            Center(
                              child: Container(
                                height: 110,
                                width: 110,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        151, 230, 232, 247),
                                    borderRadius: BorderRadius.circular(65),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromARGB(
                                              206, 158, 158, 158))
                                    ]),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(181, 0, 81, 255),
                                borderRadius: BorderRadius.circular(65),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 35,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 4.0,
                                  color: Colors.green,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: AnimatedTextKit(
                              repeatForever: true,
                              animatedTexts: [
                                FlickerAnimatedText('Play'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
