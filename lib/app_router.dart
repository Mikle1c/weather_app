import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/routers/app_router_bloc/app_router_bloc.dart';
import 'package:weather/screens/main_screen.dart';
import 'package:weather/screens/splash_screen.dart';

class AppRouter extends StatelessWidget {
  AppRouter({Key? key}) : super(key: key);
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return AppRouterBloc()..add(ShowSplashSceen());
      },
      child: BlocBuilder<AppRouterBloc, AppRouterState>(
        builder: (context, state) {
          Widget _child = const SplashScreen();
          if (state is SplashScreenShowState) {
            _child = const SplashScreen();
          } else if (state is MainScreenShowState) {
            _child = const MainScreen();
          }

          return WillPopScope(
            onWillPop: () async {
              navigatorKey.currentState?.pop();
              return false;
            },
            child: Navigator(
              key: navigatorKey,
              pages: [
                MaterialPage(
                  child: _child,
                ),
              ],
              onPopPage: (route, result) {
                return false;
              },
            ),
          );
        },
      ),
    );
  }
}
