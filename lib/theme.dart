import 'package:flutter/material.dart';
import 'package:tinycolor2/tinycolor2.dart';

class AppTheme {
  // Brand
  Color primary = const Color(0xFF146996);
  Color secondary = const Color(0xFFABD2FA);
  Color tertiary = const Color(0xFFFFA739);
  Color alternate = const Color(0xFF262D34);
  // Text & BG
  Color primaryText = Colors.white;
  Color secondaryText = const Color(0xFF95A1AC);
  Color primaryBg = const Color(0xFF121619);
  Color secondaryBg = const Color(0xFF1D2428);
  // Accents
  Color accent1 = const Color(0x4C4B39EF);
  Color accent2 = const Color(0x4C4C9F70);
  Color accent3 = const Color(0x4CFFA739);
  Color accent4 = const Color(0xB2262D34);
  // Semantic Colors
  Color success = const Color(0xFF4C9F70);
  Color error = const Color(0xFFC93638);
  Color warning = const Color(0xFFF9CF58);
  Color info = Colors.white;
  // Widgets
  Color primaryButtonText = Colors.white;
  Color line = const Color(0xFF22282F);
}

class ChoresTheme {
  static final Color primary = ChoresTheme.dark.primary;
  static final Color highlight = ChoresTheme.dark.tertiary;

  static final AppTheme dark = AppTheme();
  // TODO: Implement `AppTheme.with`.
  //static final AppTheme light = const AppTheme().with(
  //  alternate: const Color(0xE0E3E7),
  //  primaryText: const Color(0x121619),
  //  secondaryText: const Color(0xEBE7E4),
  //  primaryBg: const Color(0xF1F4F8),
  //  secondaryBg: Colors.white,
  //  accent4: const Color(0xCCFFFFFF),
  //);

  // Named Colors
  static final biceBlue = const Color(0xFF146996);
  static final orangePeel = const Color(0xFFFFA739);
  static final prussianBlue = const Color(0xFF22334A);
  static final shamrockGreen = const Color(0xFF4C9F70);
  static final skyBlue = const Color(0xFF5ADBFF);
  static final cadetGray = const Color(0xFF95A1AC);
  static final amethyst = const Color(0xFF9F70C0);
  static final eggplant = const Color(0xFF713E5A);
  static final night = const Color(0xFF121619);
  static final uranianBlue = const Color(0xFFABD2FA);
  static final mustard = const Color(0xFFF9CF58);
}
