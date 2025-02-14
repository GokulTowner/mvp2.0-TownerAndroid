import 'dart:developer';
import '../../../../imports.dart';

class PassbookAndChequeProvider extends ChangeNotifier {
  int? _selectedOption;
  int radioButtonValue = 0;

  int? get selectedOption => _selectedOption;

  String? _selectedPassboorOrCheque;
  String? get selectedPassboorOrCheque => _selectedPassboorOrCheque;

  File? _passboodOrChequeImage;
  File? _passboodOrChequePdf;
  String? selectedPdfLastPath;
  File? get passboodOrChequeImage => _passboodOrChequeImage;
  File? get passboodOrChequePdf => _passboodOrChequePdf;

  updateSelectedValue(String? newValue) {
    if (newValue == null) return;
    _selectedPassboorOrCheque = newValue;
    notifyListeners();
  }

  getLastPdfPathName() {
    final uri = Uri.parse(_passboodOrChequePdf.toString());
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    log(' last path: ${pathSegments.last}');
    log('message : ${lastPathSegment.toString()}');
    selectedPdfLastPath = lastPathSegment;
  }

  setImage(File? image, String? imageName) {
    if (imageName == null) {
      _passboodOrChequeImage = image;
      notifyListeners();
    }
  }

  setPdf(File? pdf, String? pdfName) {
    if (pdf == null) {
      return;
    }
    _passboodOrChequePdf = pdf;
    notifyListeners();
  }

  setImageNull() {
    _passboodOrChequeImage = null;
    notifyListeners();
  }

  setSelectedOption(int value) {
    _selectedOption = value;
    notifyListeners();
  }
}
