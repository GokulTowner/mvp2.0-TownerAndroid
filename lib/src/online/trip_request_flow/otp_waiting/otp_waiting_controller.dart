import '../../../../imports.dart';

class CountdownTimerController extends ChangeNotifier {
  int _secondsRemaining = 180;
  late Timer _timer;

  CountdownTimerController() {
    startTimer();
  }

  int get secondsRemaining => _secondsRemaining;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (timer) {
        if (_secondsRemaining < 1) {
          timer.cancel();
        } else {
          _secondsRemaining--;
          notifyListeners();
        }
      },
    );
  }

  String getFormattedTime() {
    int minutes = (_secondsRemaining ~/ 60);
    int seconds = (_secondsRemaining % 60);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
