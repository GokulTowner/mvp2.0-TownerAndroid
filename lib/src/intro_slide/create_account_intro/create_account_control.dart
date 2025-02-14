import '../../../imports.dart';

class CreateAccountPageProvider extends ChangeNotifier {
  bool _checkBoxStatus = false;

  bool get checkBoxStatus => _checkBoxStatus;

  void setCheckBoxValue() {
    _checkBoxStatus = !_checkBoxStatus;
    notifyListeners();
  }
}
