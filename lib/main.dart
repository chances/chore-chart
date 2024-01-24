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
        primaryColor: ChoresTheme.primary,
        buttonTheme: ButtonThemeData(buttonColor: ChoresTheme.primary),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
        ),
        tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(4),
          ),
          textStyle: TextStyle(color: Colors.white),
        ),
        textTheme: Typography.blackMountainView,
      ),
      initialRoute: '/dashboard',
      routes: {
        '/dashboard': (context) => DashboardPage(),
      },
      builder: (context, child) =>
          AppConfig(media: MediaQuery.of(context), child: child!),
    );
  }
}
