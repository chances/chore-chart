import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:chore_chart/app.dart';
import 'package:chore_chart/pages/dashboard.dart';

import 'theme.dart';

void main() {
  // TODO: SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

  runApp(ChoresApp());
}

class ChoresApp extends StatelessWidget {
  ChoresApp({Key? key}) : super(key: key) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chore Chart',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: ChoresTheme.primary,
        scaffoldBackgroundColor: ChoresTheme.dark.primaryBg,
        canvasColor: ChoresTheme.dark.secondaryBg,
        cardColor: ChoresTheme.dark.secondaryBg,
        dialogBackgroundColor: ChoresTheme.dark.primaryBg,
        dividerColor: ChoresTheme.dark.line,
        buttonTheme: ButtonThemeData(buttonColor: ChoresTheme.highlight),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: ChoresTheme.dark.primaryButtonText,
          backgroundColor: ChoresTheme.orangePeel,
          shape: CircleBorder(),
        ),
        tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            color: ChoresTheme.dark.secondaryBg,
            borderRadius: BorderRadius.circular(4),
          ),
          textStyle: TextStyle(color: ChoresTheme.dark.primaryText),
        ),
        textTheme: Typography.whiteMountainView,
      ),
      initialRoute: '/dashboard',
      routes: {
        '/dashboard': (context) => DashboardPage(),
      },
      builder: (context, child) => AppConfig(
        media: MediaQuery.of(context), child: child!,
      ),
    );
  }
}
