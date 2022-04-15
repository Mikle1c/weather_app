import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/routers/app_router_bloc/app_router_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _setTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _setTimer() {
    _timer = Timer(const Duration(seconds: 2), () => _showMainScreen());
  }

  void _showMainScreen() {
    BlocProvider.of<AppRouterBloc>(context).add(ShowMainSceen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: Image.asset(
            'assets/img/main_icon.png',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
