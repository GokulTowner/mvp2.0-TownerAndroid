import '../imports.dart';

void flutterToastFailLong(String message, double fontSize) {
  Fluttertoast.showToast(
    msg: message,
    fontSize: fontSize,
    toastLength: Toast.LENGTH_LONG,
    textColor: cMessageRed,
    backgroundColor: cDarkBlack,
  );
}

void flutterToastSuccessLong(String message, double fontSize) {
  Fluttertoast.showToast(
    msg: message,
    fontSize: fontSize,
    toastLength: Toast.LENGTH_LONG,
    textColor: cMainGreen,
    backgroundColor: cDarkBlack,
  );
}

void flutterToastFailShort(String message, double fontSize) {
  Fluttertoast.showToast(
    msg: message,
    fontSize: fontSize,
    toastLength: Toast.LENGTH_SHORT,
    textColor: cMessageRed,
    backgroundColor: cDarkBlack,
  );
}

void flutterToastSuccessShort(String message, double fontSize) {
  Fluttertoast.showToast(
    msg: message,
    fontSize: fontSize,
    toastLength: Toast.LENGTH_SHORT,
    textColor: cMainGreen,
    backgroundColor: cDarkBlack,
  );
}
