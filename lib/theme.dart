import 'package:flutter/material.dart';
import 'package:tinycolor2/tinycolor2.dart';

class ChoresTheme {
  static final Color primary = Colors.orange[400]!;
  static final homeBg = TinyColor.fromColor(primary).lighten(25).color;
  static final homeBgB = TinyColor.fromColor(primary).lighten().color;
}
