import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/routers/main_bloc/main_bloc.dart';
import 'package:weather/screens/information_screen/information_screen.dart';
import 'package:weather/screens/weather_screen/weather_screen.dart';
import 'package:weather/utilities/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _bottomBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: BlocConsumer<MainBloc, MainState>(
          buildWhen: (context, state) {
            if (state is WeatherTabState || state is InformationTabState) {
              return true;
            }

            return false;
          },
          builder: (context, state) {
            if (state is WeatherTabState) {
              return const WeatherScreen();
            } else {
              return const InformationScreen();
            }
          },
          listener: (context, state) {}),
      bottomNavigationBar: BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        // backgroundColor: Colors.red,
        selectedItemColor: primary,
        unselectedItemColor: textGrey,
        selectedIconTheme: const IconThemeData(color: primary),
        unselectedIconTheme: const IconThemeData(color: textGrey),
        type: BottomNavigationBarType.fixed,
        currentIndex: _bottomBarIndex,
        onTap: (index) {
          MainEvent event = ShowWeatherEvent();

          if (index == 0) {
            event = ShowWeatherEvent();
          }
          if (index == 1) {
            event = ShowInformationEvent();
          }

          setState(() {
            _bottomBarIndex = index;
          });

          BlocProvider.of<MainBloc>(context).add(event);
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.sunny_snowing,
                color: _bottomBarIndex == 0 ? primary : textGrey,
              ),
              label: 'Погода'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.info,
                color: _bottomBarIndex == 1 ? primary : textGrey,
              ),
              label: 'Информация'),
        ],
      ),
    );
  }
}
