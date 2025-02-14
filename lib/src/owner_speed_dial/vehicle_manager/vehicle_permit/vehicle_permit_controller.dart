import 'dart:developer';
import 'package:intl/intl.dart';
import '../../../../imports.dart';

class VehiclePermitProvider extends ChangeNotifier {
  final List<String> _permitList = ['All india permit', 'State Permit'];
  List<String> get permitList => _permitList;

  String? _selectedpermit;
  String? get selectedpermit => _selectedpermit;

  File? _permitImage;
  File? _permitPdf;
  String? selectedPdfLastPath;
  File? get permitImage => _permitImage;
  File? get permitPdf => _permitPdf;

  final TextEditingController _vehicleNumber = TextEditingController();
  final TextEditingController _permitNumber = TextEditingController();
  final TextEditingController _expiryDate = TextEditingController();

  TextEditingController get vehicleNumber => _vehicleNumber;
  TextEditingController get permitNumber => _permitNumber;
  TextEditingController get expiryDate => _expiryDate;

  updateSelectedValue(String? newValue) {
    if (newValue == null) return;
    _selectedpermit = newValue;
    notifyListeners();
  }

  getLastPdfPathName() {
    final uri = Uri.parse(_permitPdf.toString());
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    log(' last path: ${pathSegments.last}');
    log('message : ${lastPathSegment.toString()}');
    selectedPdfLastPath = lastPathSegment;
  }

  setImage(File? image, String? imageName) {
    if (imageName == null) {
      _permitImage = image;
      notifyListeners();
    }
  }

  setPdf(File? pdf, String? pdfName) {
    if (pdf == null) {
      return;
    }
    _permitPdf = pdf;
    notifyListeners();
  }

  setImageNull() {
    _permitImage = null;
    notifyListeners();
  }

  void showDatePickerPermit(BuildContext context) {
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
