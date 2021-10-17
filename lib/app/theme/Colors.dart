import 'package:flutter/material.dart';

const MaterialColor primaryColor = MaterialColor(
  _PrimaryValue,
  <int, Color>{
    50: Color.fromRGBO(139, 145, 74, 0.1),
    100: Color.fromRGBO(139, 145, 74, 0.2),
    200: Color.fromRGBO(139, 145, 74, 0.3),
    300: Color.fromRGBO(139, 145, 74, 0.4),
    400: Color.fromRGBO(139, 145, 74, 0.5),
    500: Color(_PrimaryValue),
    600: Color.fromRGBO(139, 145, 74, 0.7),
    700: Color.fromRGBO(139, 145, 74, 0.8),
    800: Color.fromRGBO(139, 145, 74, 0.9),
    900: Color.fromRGBO(139, 145, 74, 1),
  },
);
const int _PrimaryValue = 0xFF8BC34A;

const MaterialColor secondaryColor = MaterialColor(
  _SecondaryValue,
  <int, Color>{
    50: Color.fromRGBO(162, 207, 110, 0.1),
    100: Color.fromRGBO(162, 207, 110, 0.2),
    200: Color.fromRGBO(162, 207, 110, 0.3),
    300: Color.fromRGBO(162, 207, 110, 0.4),
    400: Color.fromRGBO(162, 207, 110, 0.5),
    500: Color(_SecondaryValue),
    600: Color.fromRGBO(162, 207, 110, 0.7),
    700: Color.fromRGBO(162, 207, 110, 0.8),
    800: Color.fromRGBO(162, 207, 110, 0.9),
    900: Color.fromRGBO(162, 207, 110, 1),
  },
);
const int _SecondaryValue = 0xFFA2CF6E;
