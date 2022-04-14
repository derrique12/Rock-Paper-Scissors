import 'package:flutter/material.dart';

class CountRound extends StatefulWidget {
  const CountRound({Key? key, required this.number}) : super(key: key);
  final int number;
  @override
  State<CountRound> createState() => _CountRoundState();
}

class _CountRoundState extends State<CountRound> with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(
        seconds: 3,
      ),
      vsync: this,
    );

    _animationController.addListener(() => setState(() {}));
    TickerFuture tickerFuture = _animationController.repeat();
    tickerFuture.timeout(const Duration(seconds: 2), onTimeout: () {
      _animationController.forward(from: 0);
      _animationController.stop(canceled: true);
    });
    //  implement initState
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: SizedBox(
        width: 100.0,
        height: 100.0,
        child: Center(
          child: Text(
            widget.number.toString(),
            style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 100),
          ),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: _animationController.value * 1.5,
          child: child,
        );
        // Transform.rotate(
        //   angle: _controller.value * 2.0 * math.pi,
        //   child: child,
        // );
      },
    );
  }
}
