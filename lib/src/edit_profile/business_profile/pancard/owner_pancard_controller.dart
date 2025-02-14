import 'dart:developer';
import '../../../../imports.dart';

class OwnerPancardProvider extends ChangeNotifier {
  String? _selectedPancard;
  String? get selectedPancard => _selectedPancard;

  File? _pancardImage;
  File? _pancardPdf;
  String? selectedPdfLastPath;
  File? get pancardImage => _pancardImage;
  File? get pancardPdf => _pancardPdf;

  final TextEditingController _pancardNumber = TextEditingController();

  TextEditingController get pancardNumber => _pancardNumber;

  updateSelectedValue(String? newValue) {
    if (newValue == null) return;

    _selectedPancard = newValue;
    notifyListeners();
  }

  getLastPdfPathName() {
    final uri = Uri.parse(_pancardPdf.toString());
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    log(' last path: ${pathSegments.last}');
    log('message : ${lastPathSegment.toString()}');
    selectedPdfLastPath = lastPathSegment;
  }

  setImage(File? image, String? imageName) {
    if (imageName == null) {
      _pancardImage = image;
      notifyListeners();
    }
  }

  setPdf(File? pdf, String? pdfName) {
    if (pdf == null) {
      return;
    }
    _pancardPdf = pdf;
    notifyListeners();
  }

  setImageNull() {
    _pancardImage = null;
    notifyListeners();
  }
}
