import 'dart:async';
import 'package:flutter/material.dart';

class CountdownProvider with ChangeNotifier {
  int _counter = 30;
  late Timer _timer;

  int get counter => _counter;

  CountdownProvider() {
    _startTimer();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_counter == 0) {
        timer.cancel();
      } else {
        _counter--;
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
