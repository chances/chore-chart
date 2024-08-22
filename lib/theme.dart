import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChoresTheme with ChangeNotifier {
  static final ChoresTheme instance = ChoresTheme();

  var _isDark = true;

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
  // Brand
  static final Color primary = ChoresTheme.biceBlue;
  static final Color secondary = ChoresTheme.skyBlue;
  static final Color tertiary = ChoresTheme.orangePeel;
  static final Color alternate = const Color(0xFF262D34);
  // Text & BG
  static final Color primaryText = Colors.white;
  static final Color secondaryText = const Color(0xFF95A1AC);
  static final Color primaryBackground = const Color(0xFF121619);
  static final Color secondaryBackground = const Color(0xFF1D2428);
  // Accents
  static final Color highlight = ChoresTheme.tertiary;
  static final Color accent1 = const Color(0x4C4B39EF);
  static final Color accent2 = const Color(0x4C4C9F70);
  static final Color accent3 = const Color(0x4CFFA739);
  static final Color accent4 = const Color(0xB2262D34);
  // Semantic Colors
  static final Color success = ChoresTheme.shamrockGreen;
  static final Color error = const Color(0xFFC93638);
  static final Color warning = ChoresTheme.mustard;
  static final Color info = Colors.white;
  // Widgets
  static final Color primaryButtonText = Colors.white;
  static final Color line = const Color(0xFF22282F);

  static ChoresTheme of(BuildContext context) => Provider.of<ChoresTheme>(context);

  ThemeData get theme => _isDark ? dark : light;

  TextStyle get hyperlink => theme
        .typography
        .white
        .bodyMedium
        !.apply(color: ChoresTheme.primary)
        .copyWith(
          letterSpacing: 0.0,
          fontWeight: FontWeight.w600,
        );

  void toggleBrightness() {
    _isDark = !_isDark;
    notifyListeners();
  }

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ChoresTheme.primary,
    scaffoldBackgroundColor: ChoresTheme.primaryBackground,
    canvasColor: ChoresTheme.secondaryBackground,
    cardColor: ChoresTheme.secondaryBackground,
    dialogBackgroundColor: ChoresTheme.primaryBackground,
    dividerColor: ChoresTheme.line,
    buttonTheme: ButtonThemeData(buttonColor: ChoresTheme.highlight),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: ChoresTheme.primaryButtonText,
      backgroundColor: ChoresTheme.orangePeel,
      shape: CircleBorder(),
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: ChoresTheme.secondaryBackground,
        borderRadius: BorderRadius.circular(4),
      ),
      textStyle: TextStyle(color: ChoresTheme.primaryText),
    ),
    snackBarTheme: SnackBarThemeData(
        backgroundColor: ChoresTheme.secondaryBackground,
        contentTextStyle: TextStyle(color: ChoresTheme.primaryText),
        actionBackgroundColor: ChoresTheme.primaryBackground,
        actionTextColor: ChoresTheme.primaryButtonText),
    textTheme: Typography.whiteMountainView.apply(
      fontFamily: 'Readex Pro',
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ChoresTheme.secondaryBackground, width: 2.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ChoresTheme.primary, width: 2.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ChoresTheme.alternate, width: 2.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ChoresTheme.alternate, width: 2.0),
        borderRadius: BorderRadius.circular(12.0),
      ),
      filled: true,
      fillColor: ChoresTheme.primaryBackground,
    ),
  );

  // FIXME: Design the light theme
  static final light = dark.copyWith(brightness: Brightness.light);
  // TODO: Implement `AppTheme.with`.
  //static final light = instance.light.with(
  //  alternate: const Color(0xE0E3E7),
  //  primaryText: const Color(0x121619),
  //  secondaryText: const Color(0xEBE7E4),
  //  primaryBg: const Color(0xF1F4F8),
  //  secondaryBg: Colors.white,
  //  accent4: const Color(0xCCFFFFFF),
  //);
}
