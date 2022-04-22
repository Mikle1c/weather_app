import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_svg/svg.dart';

class Sprung extends Curve {
  factory Sprung([double damping = 20]) => Sprung.custom(damping: damping);

  Sprung.custom({
    double damping = 20,
    double stiffness = 180,
    double mass = 1.0,
    double velocity = 0.0,
  }) : _sim = SpringSimulation(
          SpringDescription(
            damping: damping,
            mass: mass,
            stiffness: stiffness,
          ),
          0.0,
          1.0,
          velocity,
        );

  final SpringSimulation _sim;

  @override
  double transform(double t) => _sim.x(t) + t * (1 - _sim.x(1.0));
}

mixin ShowErrorDialog {
  Future showErrorDialog(BuildContext context, String message, bool fromTop) {
    Timer(const Duration(seconds: 2), () {
      if (Navigator.of(context).canPop()) {}
      Navigator.of(context).pop();
    });
    return showGeneralDialog(
      barrierLabel: "Label",
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Column(
          children: [
            const SizedBox(height: 40),
            Card(
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.red, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0)),
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Container(
                padding: const EdgeInsets.all(20),
                // height: 100,
                child: Row(
                  children: [
                    SvgPicture.asset('assets/img/error_red_icon.svg',
                        fit: BoxFit.fill),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        message,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: anim1.drive(
              Tween(begin: Offset(0, fromTop ? -1 : 1), end: const Offset(0, 0))
                  .chain(CurveTween(curve: Sprung()))),
          child: child,
        );
      },
    );
  }
}
