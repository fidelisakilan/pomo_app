import 'package:flutter/material.dart';
import 'package:pomo_app/constants.dart';

import 'first_screen.dart';

void main() => runApp(Pomodoro());

class Pomodoro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Pomodoro App',
      home: PomodoTimerPage(),
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.purple,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
      ),
    );
  }
}
