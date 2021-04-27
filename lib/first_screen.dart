import 'dart:async';

import 'package:flutter/material.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

int initialMinutes = 24;
int initialSeconds = 60;
String time = '25:00';
var duration = const Duration(seconds: 1);
var watch = Stopwatch();

class PomodoTimerPage extends StatefulWidget {
  @override
  _PomodoTimerPageState createState() => _PomodoTimerPageState();
}

class _PomodoTimerPageState extends State<PomodoTimerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPomodoroTimer(),
    );
  }

  Widget _buildPomodoroTimer() {
    return Center(
      child: Column(
        children: [
          timerText(),
          Expanded(
            flex: 1,
            child: Icon(
              IcoFontIcons.tomato,
              size: 200.00,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: _restart,
              ),
              IconButton(
                icon: _isPlaying() ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                onPressed: _startStopWatch,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget timerText() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Text(
        time,
        style: TextStyle(
          fontSize: 50,
        ),
      ),
    );
  }

  void _restart() {
    watch.stop();
    watch.reset();
    setState(() {
      time = '25:00';
    });
  }

  void _startStopWatch() {
    if (_isPlaying()) {
      watch.stop();
    } else {
      watch.start();
      _startTimer();
    }
  }

  bool _isPlaying() {
    return watch.isRunning;
  }

  void _startTimer() {
    Timer(duration, _keepRunning);
  }

  void _keepRunning() {
    if (watch.isRunning) {
      _startTimer();
    }
    setState(() {
      int currentMinute = int.parse(watch.elapsed.inMinutes.toString());
      int currentSeconds = int.parse(watch.elapsed.inSeconds.toString());
      int timerMinutes = initialMinutes - currentMinute;
      int timerSeconds = initialSeconds - currentSeconds;

      if (timerSeconds < 60 && timerSeconds >= 0) {
        time = timerMinutes.toString().padLeft(2, '0') +
            ':' +
            timerSeconds.toString().padLeft(2, '0');
        if (time == '00:00') {
          print('stopped');
        }
      }
      if (timerMinutes < 0) {
        time = '00:00';
        watch.stop();
      }
    });
  }
}
