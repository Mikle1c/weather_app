import 'package:flutter/material.dart';

const Color primary = Color(0xFFFF7A40);
const Color primaryVariant = Color(0xFF2472BC);
const Color line = Color(0xFFD3D7EA);
const Color greenRound = Color(0xFF7AE58B);
const Color bg = Color(0xFFFFFFFF);
const Color bgGrey = Color(0xFFF4F5F8);
const Color now = Color(0xFFFF3939);
const Color first = Color(0xFFFFD260);
const Color bt = Color(0xFF499CFF);
const Color textBlack = Color(0xFF191D2C);
const Color textGrey = Color(0xFFB3B6CA);
const Color disabledButton = Color(0xFFD3D7EA);

const double largeTitle1 = 24;
const double largeTitle2 = 22;
const double headline1 = 17;
const double headline2 = 15;
const double body1 = 15;
const double body2 = 13;
const double body3 = 13;
const double button = 13;
const double helperText = 11;

const double borderRadius = 5;

const apiHost = 'https://api.openweathermap.org/data/2.5';

const secretPath = 'assets/secrets.json';
const citiesPath = 'assets/cities.json';

final boxShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.1),
    spreadRadius: 2,
    blurRadius: 20,
    offset: const Offset(0, 3), // changes position of shadow
  ),
];
