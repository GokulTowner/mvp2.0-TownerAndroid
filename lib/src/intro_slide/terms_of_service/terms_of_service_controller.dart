import 'package:townerapp/imports.dart';

class TermsOfServiceProvider extends ChangeNotifier {
  bool _checkBox1 = false;
  bool _checkBox2 = false;

  bool get checkBox1 => _checkBox1;
  bool get checkBox2 => _checkBox2;

  setCheckBoxValue(int checkBox) {
    if (checkBox == 0) {
      _checkBox1 = !_checkBox1;
    } else if (checkBox == 1) {
      _checkBox2 = !_checkBox2;
    }
    notifyListeners();
  }

  bool checkTermsOfServiceAccepted() {
    if (_checkBox1 == true && _checkBox2 == true) {
      return true;
    } else {
      Fluttertoast.showToast(msg: tPleaseAcceptTheTermsAndComdition);
      return false;
    }
  }
}
