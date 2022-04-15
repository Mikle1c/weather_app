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

// mixin ShowSuccessView {
//   Future profileStartDialog(
//     BuildContext context,
//     String title,
//     String message, {
//     bool isCustonAction = false,
//     Function? action,
//   }) {
//     return showGeneralDialog(
//       barrierColor: Colors.transparent,
//       transitionBuilder: (context, a1, a2, widget) {
//         final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
//         return Transform(
//           transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
//           child: Opacity(
//             opacity: a1.value,
//             child: AlertDialog(
//               backgroundColor: Colors.white.withOpacity(0.4),
//               shape: OutlineInputBorder(
//                   borderSide: const BorderSide(color: Colors.white),
//                   borderRadius: BorderRadius.circular(16.0)),
//               title: Text(title),
//               content: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Image.asset('assets/img/profile_app_icon.png'),
//                     Text(
//                       'Регистрация и вход доступны только школам',
//                       textAlign: TextAlign.center,
//                       style: Theme.of(context)
//                           .textTheme
//                           .headline5
//                           ?.copyWith(color: Colors.white),
//                     ),
//                     Text(
//                       'Регистрация для игроков будет открыта в скором времени.',
//                       textAlign: TextAlign.center,
//                       style: Theme.of(context)
//                           .textTheme
//                           .bodyText2
//                           ?.copyWith(color: Colors.white),
//                     ),
//                     const SizedBox(
//                       height: 24,
//                     ),
//                     TextButton(
//                       style: ButtonStyle(
//                           padding:
//                               MaterialStateProperty.all<EdgeInsetsGeometry>(
//                                   const EdgeInsets.symmetric(vertical: 18)),
//                           shape:
//                               MaterialStateProperty.all<RoundedRectangleBorder>(
//                             RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(16.0),
//                             ),
//                           ),
//                           backgroundColor:
//                               MaterialStateProperty.all(Colors.white)),
//                       onPressed: () {
//                         if (isCustonAction && action != null) {
//                           action();
//                         }
//                         Navigator.pop(context);
//                       },
//                       child: Text(
//                         'Продолжить',
//                         style: Theme.of(context).textTheme.subtitle2,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//       transitionDuration: const Duration(milliseconds: 200),
//       // barrierDismissible: true,
//       barrierLabel: '',
//       context: context,
//       pageBuilder: (context, animation1, animation2) {
//         return Container();
//       },
//     );
//   }
// }
