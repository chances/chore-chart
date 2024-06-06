import 'package:flutter/material.dart';

import 'package:chore_chart/app.dart';
import 'package:chore_chart/theme.dart';
import 'package:chore_chart/widgets/logo.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

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
      appBar: AppBar(
        // FIXME: backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Monday January 1, 1900',
          // TODO: formatDate(_model.day!),
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontFamily: 'Outfit',
            color: Colors.white,
            fontSize: 22.0,
            letterSpacing: 0.0,
          ),
        ),
        actions: [
          Tooltip(
            message: 'Today',
            waitDuration: Duration(milliseconds: 100),
            showDuration: Duration(milliseconds: 1500),
            triggerMode: TooltipTriggerMode.tap,
            child: IconButton(
              icon: Icon(
                Icons.today,
                // FIXME: This should use a color from `ThemeData`
                color: Colors.white,
                size: 24.0,
              ),
              onPressed: () {
                // TODO: Date-range calendar chooser
              },
            ),
          ),
          Tooltip(
            message: 'More options...',
            waitDuration: Duration(milliseconds: 100),
            showDuration: Duration(milliseconds: 1500),
            triggerMode: TooltipTriggerMode.tap,
            child: IconButton(
              icon: Icon(
                Icons.more_vert,
                // FIXME: This should use a color from `ThemeData`
                color: Colors.white,
                size: 24.0,
              ),
              onPressed: () async {
                // TODO: Open action menu
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: Container(
        // FIXME: color: ChoresTheme.biceBlue,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ChoresTheme.biceBlue, ChoresTheme.amethyst],
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
              Text('$_counter', style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Create a New Chore',
        child: Icon(Icons.add),
      ),
    );
  }
}
