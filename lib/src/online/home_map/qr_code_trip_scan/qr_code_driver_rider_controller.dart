import '../../../../imports.dart';

class QrDriverRiderProvider extends ChangeNotifier {
  bool _isclicked = false;

  bool get isclicked => _isclicked;

  Color isClickedFunction() {
    _isclicked = !_isclicked;
    if (_isclicked == true) {
      return cTextBlack;
    } else {
      return cBlueMain;
    }
  }
}
