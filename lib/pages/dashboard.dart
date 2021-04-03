import 'package:flutter/material.dart';

import 'package:chore_chart/app.dart';
import 'package:chore_chart/theme.dart';
import 'package:chore_chart/widgets/logo.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() => _counter++);
  }

  @override
  Widget build(BuildContext context) {
    final config = AppConfig.of(context);

    return Scaffold(
      body: Container(
        // color: ChoresTheme.homeBg,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ChoresTheme.homeBg, ChoresTheme.homeBgB],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.9],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: config.vh(0.1)),
                child: Logo(config.vw(0.3, fromLogicalSize: true)),
              ),
              Text('You have pushed the button this many times:'),
              Text('$_counter', style: Theme.of(context).textTheme.headline4),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
