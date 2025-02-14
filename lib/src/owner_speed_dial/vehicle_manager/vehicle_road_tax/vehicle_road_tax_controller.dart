import 'dart:developer';
import 'package:intl/intl.dart';
import '../../../../imports.dart';

class VehicleRoadTaxProvider extends ChangeNotifier {
  final List<String> _roadTaxList = ['RTO Bangalore', 'RTO Mumbai'];
  List<String> get roadTaxList => _roadTaxList;

  String? _selectedroadTax;
  String? get selectedroadTax => _selectedroadTax;

  File? _roadTaxImage;
  File? _roadTaxPdf;
  String? selectedPdfLastPath;
  File? get roadTaxImage => _roadTaxImage;
  File? get roadTaxPdf => _roadTaxPdf;

  final TextEditingController _vehicleNumber = TextEditingController();
  final TextEditingController _roadTaxNumber = TextEditingController();
  final TextEditingController _expiryDate = TextEditingController();

  TextEditingController get vehicleNumber => _vehicleNumber;
  TextEditingController get roadTaxNumber => _roadTaxNumber;
  TextEditingController get expiryDate => _expiryDate;

  updateSelectedValue(String? newValue) {
    if (newValue == null) return;

    _selectedroadTax = newValue;
    notifyListeners();
  }

  getLastPdfPathName() {
    final uri = Uri.parse(_roadTaxPdf.toString());
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    log(' last path: ${pathSegments.last}');
    log('message : ${lastPathSegment.toString()}');
    selectedPdfLastPath = lastPathSegment;
  }

  setImage(File? image, String? imageName) {
    if (imageName == null) {
      _roadTaxImage = image;
      notifyListeners();
    }
  }

  setPdf(File? pdf, String? pdfName) {
    if (pdf == null) {
      return;
    }
    _roadTaxPdf = pdf;
    notifyListeners();
  }

  setImageNull() {
    _roadTaxImage = null;
    notifyListeners();
  }

  void showDatePickerroadTax(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1947),
      lastDate: DateTime(2100),
    ).then((value) {
      if (value != null) {
        _expiryDate.text = DateFormat('dd-MM-yyy').format(value);
        notifyListeners();
      }
    });
  }
}
