import 'package:flutter/material.dart';

class Congratulations extends StatefulWidget {
  const Congratulations({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  State<Congratulations> createState() => _CongratulationsState();
}

class _CongratulationsState extends State<Congratulations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.message),
      ),
    );
  }
}
