import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:animations/animations.dart';

class SlowConnectionDialog extends StatefulWidget {
  /// Creates the demo page for [FadeScaleTransition].
  const SlowConnectionDialog({Key? key}) : super(key: key);

  @override
  _SlowConnectionDialogState createState() => _SlowConnectionDialogState();
}

class _SlowConnectionDialogState extends State<SlowConnectionDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      value: 0.0,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
      vsync: this,
    )..addStatusListener((AnimationStatus status) {
        setState(() {});
      });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // bool get _isAnimationRunningForwardsOrComplete {
  //   switch (_controller.status) {
  //     case AnimationStatus.forward:
  //     case AnimationStatus.completed:
  //       return true;
  //     case AnimationStatus.reverse:
  //     case AnimationStatus.dismissed:
  //       return false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return FadeScaleTransition(
          animation: _controller,
          child: Dialog(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Lottie.asset(
                    'assets/lottie/slow_connection.json',
                    fit: BoxFit.cover,
                    repeat: false,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  Text(
                    'Periksa koneksi internet anda',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
