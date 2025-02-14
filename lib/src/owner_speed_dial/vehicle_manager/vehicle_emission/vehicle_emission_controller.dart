import 'dart:developer';
import 'package:intl/intl.dart';
import '../../../../imports.dart';

class VehicleEmissionProvider extends ChangeNotifier {
  final List<String> _emissionList = [
    'Emission type 1',
    'Emission type 2',
    'Emission type 3'
  ];
  List<String> get emissionList => _emissionList;

  String? _selectedemission;
  String? get selectedemission => _selectedemission;

  File? _emissionImage;
  File? _emissionPdf;
  String? selectedPdfLastPath;
  File? get emissionImage => _emissionImage;
  File? get emissionPdf => _emissionPdf;

  final TextEditingController _vehicleNumber = TextEditingController();
  final TextEditingController _emissionNumber = TextEditingController();
  final TextEditingController _expiryDate = TextEditingController();

  TextEditingController get vehicleNumber => _vehicleNumber;
  TextEditingController get emissionNumber => _emissionNumber;
  TextEditingController get expiryDate => _expiryDate;

  updateSelectedValue(String? newValue) {
    if (newValue == null) return;

    _selectedemission = newValue;
    notifyListeners();
  }

  getLastPdfPathName() {
    final uri = Uri.parse(_emissionPdf.toString());
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    log(' last path: ${pathSegments.last}');
    log('message : ${lastPathSegment.toString()}');
    selectedPdfLastPath = lastPathSegment;
  }

  setImage(File? image, String? imageName) {
    if (imageName == null) {
      _emissionImage = image;
      notifyListeners();
    }
  }

  setPdf(File? pdf, String? pdfName) {
    if (pdf == null) {
      return;
    }
    _emissionPdf = pdf;
    notifyListeners();
  }

  setImageNull() {
    _emissionImage = null;
    notifyListeners();
  }

  void showDatePickerEmission(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1947),
      lastDate: DateTime(2100),
    ).then(
      (value) {
        if (value != null) {
          _expiryDate.text = DateFormat('dd-MM-yyy').format(value);
          notifyListeners();
        }
      },
    );
  }
}
