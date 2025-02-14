import 'dart:developer';
import '../../../../imports.dart';

class GstProvider extends ChangeNotifier {
  String? _selectedGst;
  String? get selectedGst => _selectedGst;

  File? _gstImage;
  File? _gstPdf;
  String? selectedPdfLastPath;
  File? get gstImage => _gstImage;
  File? get gstPdf => _gstPdf;

  final TextEditingController _gstNumber = TextEditingController();

  TextEditingController get gstNumber => _gstNumber;

  updateSelectedValue(String? newValue) {
    if (newValue == null) return;

    _selectedGst = newValue;
    notifyListeners();
  }

  getLastPdfPathName() {
    final uri = Uri.parse(_gstPdf.toString());
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    log(' last path: ${pathSegments.last}');
    log('message : ${lastPathSegment.toString()}');
    selectedPdfLastPath = lastPathSegment;
  }

  setImage(File? image, String? imageName) {
    if (imageName == null) {
      _gstImage = image;
      notifyListeners();
    }
  }

  setPdf(File? pdf, String? pdfName) {
    if (pdf == null) {
      return;
    }
    _gstPdf = pdf;
    notifyListeners();
  }

  setImageNull() {
    _gstImage = null;
    notifyListeners();
  }
}
