
import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

class ChoresTheme {
  static final primary = Colors.orange[400];
  static final homeBg = primary.toTinyColor().lighten(25).color;
  static final homeBgB = primary.toTinyColor().lighten().color;
}
