import 'dart:developer';
import '../../../../imports.dart';

class DriverGovIdProvider extends ChangeNotifier {
  File? _panCard;
  File? _voterId;
  File? _adhar;

  File? _panCardPdf;
  File? _voterIdPdf;
  File? _adharPdf;

  String? selectedPdfPancard;
  String? selectedPdfVoterId;
  String? selectedPdfAdhar;

  final TextEditingController _panNumber = TextEditingController();

  TextEditingController get panNumber => _panNumber;
  File? get panCard => _panCard;
  File? get voterId => _voterId;
  File? get adhar => _adhar;

  File? get panCardPdf => _panCardPdf;
  File? get voterIdPdf => _voterIdPdf;
  File? get adharPdf => _adharPdf;

  getLastPdfPathName(dynamic pdfName) {
    File? pdfVarName;
    if (pdfName == 'panCard') {
      pdfVarName = _panCardPdf;
    } else if (pdfName == 'voterId') {
      pdfVarName = _voterIdPdf;
    } else if (pdfName == 'adhar') {
      pdfVarName = _adharPdf;
    }
    final uri = Uri.parse(pdfVarName.toString());
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;

    if (pdfName == 'panCard') {
      selectedPdfPancard = lastPathSegment;
    } else if (pdfName == 'voterId') {
      selectedPdfVoterId = lastPathSegment;
    } else if (pdfName == 'adhar') {
      selectedPdfAdhar = lastPathSegment;
    }
  }

  setImage(File? image, String? imageName) {
    log('Image Name : $imageName');
    if (imageName == 'panCard') {
      _panCard = image;
      notifyListeners();
    } else if (imageName == 'voterId') {
      _voterId = image;
      notifyListeners();
    } else if (imageName == 'adhar') {
      _adhar = image;
      notifyListeners();
    }
  }

  setPdf(File? pdf, String? typeName) {
    if (pdf == null) {
      return;
    }
    if (typeName == 'panCard') {
      _panCardPdf = pdf;
      log('pdf: $_panCardPdf');
      notifyListeners();
    } else if (typeName == 'voterId') {
      _voterIdPdf = pdf;
      notifyListeners();
    } else if (typeName == 'adhar') {
      _adharPdf = pdf;
      notifyListeners();
    }
  }

  setImageNull(String typeName) {
    if (typeName == 'panCard') {
      _panCard = null;
      notifyListeners();
    } else if (typeName == 'voterId') {
      _voterId = null;
      notifyListeners();
    } else if (typeName == 'adhar') {
      _adhar = null;
      notifyListeners();
    }
  }
}
