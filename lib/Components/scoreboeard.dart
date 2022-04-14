import 'package:flutter/material.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({
    Key? key,
    required this.yourScore,
    required this.cpuScore,
  }) : super(key: key);
  final int cpuScore;
  final int yourScore;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            // border: Border.all(width: 1, color: Colors.grey),
            ),
        width: 120,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoardSquare(score: cpuScore),
            const SizedBox(
              width: 3,
            ),
            BoardSquare(score: yourScore)
          ],
        ));
  }
}

class BoardSquare extends StatelessWidget {
  const BoardSquare({
    Key? key,
    required this.score,
  }) : super(key: key);

  final int score;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          color: Colors.black),
      child: Center(
        child: Text(score.toString(),
            style: const TextStyle(color: Colors.orange, fontSize: 25)),
      ),
    );
  }
}
