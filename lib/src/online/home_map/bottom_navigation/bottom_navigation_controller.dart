import '../../../../imports.dart';

class BottomNavigationProvider with ChangeNotifier {
  bool _isGotoHome = false;
  bool get isGotoHome => _isGotoHome;

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setIsGotoHome(bool status) {
    _isGotoHome = status;
    notifyListeners();
  }
}
