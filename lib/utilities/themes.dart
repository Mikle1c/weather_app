import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';

ThemeData lightTheme() {
  return ThemeData(
      inputDecorationTheme: (InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: textGrey, width: 0.5),
          borderRadius: BorderRadius.circular(16.0),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: textGrey, width: 0.5),
          borderRadius: BorderRadius.circular(16.0),
        ),
        hintStyle: const TextStyle(
          color: textGrey,
        ),
      )),
      fontFamily: 'Montserrat',
      appBarTheme: const AppBarTheme(
        color: bg,
        iconTheme: IconThemeData(color: textBlack),
      ),
      backgroundColor: bg,
      scaffoldBackgroundColor: bg,
      buttonTheme: const ButtonThemeData(
        buttonColor: primary,
      ),
      textTheme: const TextTheme(
        headline5: TextStyle(
          fontSize: largeTitle1,
        ),
        headline6:
            TextStyle(fontSize: largeTitle2, fontStyle: FontStyle.normal),
        subtitle1: TextStyle(fontSize: headline1),
        subtitle2: TextStyle(fontSize: headline2),
        bodyText1: TextStyle(fontSize: body1, fontWeight: FontWeight.w600),
        bodyText2: TextStyle(fontSize: body2),
        caption: TextStyle(fontSize: body3),
        button: TextStyle(fontSize: button),
        overline: TextStyle(
            letterSpacing: 0.1,
            fontSize: helperText,
            color: textGrey,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500),
      ));
}
