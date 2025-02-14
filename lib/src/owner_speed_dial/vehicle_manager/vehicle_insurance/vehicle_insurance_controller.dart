import 'dart:developer';
import 'package:intl/intl.dart';
import '../../../../imports.dart';

class VehicleInsuranceProvider extends ChangeNotifier {
  final List<String> _insuranceProviderList = ['ICICI Auto', 'Digit Insurance'];
  List<String> get insuranceProviderList => _insuranceProviderList;

  String? _selectedInsurance;
  String? get selectedInsurance => _selectedInsurance;

  File? _insuranceImage;
  File? _insurancePdf;
  String? selectedPdfLastPath;
  File? get insuranceImage => _insuranceImage;
  File? get insurancePdf => _insurancePdf;

  final TextEditingController _vehicleNumber = TextEditingController();
  final TextEditingController _policyNumber = TextEditingController();
  final TextEditingController _expiryDate = TextEditingController();

  TextEditingController get vehicleNumber => _vehicleNumber;
  TextEditingController get policyNumber => _policyNumber;
  TextEditingController get expiryDate => _expiryDate;

  updateSelectedValue(String? newValue) {
    if (newValue == null) return;

    _selectedInsurance = newValue;
    notifyListeners();
  }

  getLastPdfPathName() {
    final uri = Uri.parse(_insurancePdf.toString());
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    log(' last path: ${pathSegments.last}');
    log('message : ${lastPathSegment.toString()}');
    selectedPdfLastPath = lastPathSegment;
  }

  setImage(File? image, String? imageName) {
    if (imageName == null) {
      _insuranceImage = image;
      notifyListeners();
    }
  }

  setPdf(File? pdf, String? pdfName) {
    if (pdf == null) {
      return;
    }
    _insurancePdf = pdf;
    notifyListeners();
  }

  setImageNull() {
    _insuranceImage = null;
    notifyListeners();
  }

  void showDatePickerInsurance(BuildContext context) {
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
