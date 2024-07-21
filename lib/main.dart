import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:chore_chart/app.dart';
import 'package:chore_chart/pages/dashboard.dart';
import 'package:chore_chart/pages/welcome.dart';

import 'theme.dart';

void main() async {
  // TODO: SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();
  await Supabase.initialize(
    url: dotenv.get('SUPABASE_URL'),
    anonKey: dotenv.get('SUPABASE_ANON_KEY'),
  );

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
        snackBarTheme: SnackBarThemeData(
          backgroundColor: ChoresTheme.dark.secondaryBg,
          contentTextStyle: TextStyle(
            color: ChoresTheme.dark.primaryText
          ),
          actionBackgroundColor: ChoresTheme.dark.primaryBg,
          actionTextColor: ChoresTheme.dark.primaryButtonText
        ),
        textTheme: Typography.whiteMountainView.apply(
          fontFamily: 'Readex Pro',
        ),
      ),
      // TODO: initialRoute: isLoggedIn ? '/dashboard' : '/welcome',
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/dashboard': (context) => DashboardPage(),
      },
      builder: (context, child) => AppConfig(
        media: MediaQuery.of(context),
        child: child!,
      ),
    );
  }
}
