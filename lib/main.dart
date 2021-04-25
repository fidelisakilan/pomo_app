import 'package:flutter/material.dart';

import 'first_screen.dart';

void main() => runApp(Pomodoro());

class Pomodoro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Pomodoro App',
      home: FirstScreen(),
      theme: ThemeData(),
    );
  }
}
