import 'dart:developer';
import 'package:townerapp/imports.dart';

class OwnerAdharProvider extends ChangeNotifier {
  String? _selectedAdhar;
  String? get selectedAdhar => _selectedAdhar;

  File? _adharImage;
  File? _adharPdf;
  String? selectedPdfLastPath;
  File? get adharImage => _adharImage;
  File? get adharPdf => _adharPdf;

  final TextEditingController _adharNumber = TextEditingController();

  TextEditingController get adharNumber => _adharNumber;

  updateSelectedValue(String? newValue) {
    if (newValue == null) return;

    _selectedAdhar = newValue;
    notifyListeners();
  }

  getLastPdfPathName() {
    final uri = Uri.parse(_adharPdf.toString());
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    log(' last path: ${pathSegments.last}');
    log('message : ${lastPathSegment.toString()}');
    selectedPdfLastPath = lastPathSegment;
  }

  setImage(File? image, String? imageName) {
    if (imageName == null) {
      _adharImage = image;
      notifyListeners();
    }
  }

  setPdf(File? pdf, String? pdfName) {
    if (pdf == null) {
      return;
    }
    _adharPdf = pdf;
    notifyListeners();
  }

  setImageNull() {
    _adharImage = null;
    notifyListeners();
  }
}
