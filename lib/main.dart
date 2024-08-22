import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:chore_chart/app.dart';
import 'package:chore_chart/pages/dashboard.dart';
import 'package:chore_chart/pages/login.dart';

import 'theme.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
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
    return MultiProvider(
      providers: [
        StreamProvider(create: (_) => Supabase.instance.client.auth.onAuthStateChange.map((state) => state.session?.user), initialData: null),
        ChangeNotifierProvider(create: (_) => ChoresTheme.instance),
      ],
      // TODO: https://pub.dev/documentation/go_router/latest/topics/Transition%20animations-topic.html
      child: MaterialApp.router(
        title: 'Chores',
        theme: ChoresTheme.instance.theme.copyWith(
          inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
                labelStyle:
                    Theme.of(context).typography.white.labelLarge?.copyWith(letterSpacing: 0.0),
              ),
        ),
        routerConfig: GoRouter(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => DashboardPage(),
              routes: [],
            ),
            GoRoute(
              path: '/login',
              builder: (context, state) => LoginPage(),
            ),
          ],
          redirect: (context, _) => (Provider.of<User?>(context)?.isAnonymous ?? true) ? '/login' : '/',
          // TODO: refreshListenable: ,
        ),
        builder: (context, child) => App(
          media: MediaQuery.of(context),
          child: child!,
        ),
      ),
    );
  }
}
