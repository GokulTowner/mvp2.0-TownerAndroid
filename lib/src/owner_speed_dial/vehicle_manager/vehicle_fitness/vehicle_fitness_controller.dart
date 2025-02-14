import 'dart:developer';
import 'package:intl/intl.dart';
import '../../../../imports.dart';

class VehicleFitnessProvider extends ChangeNotifier {
  final List<String> _fitnessList = ['<5 years', '5-10 years', '10+ years'];
  List<String> get fitnessList => _fitnessList;

  String? _selectedFitness;
  String? get selectedFitness => _selectedFitness;

  File? _fitnessImage;
  File? _fitnessPdf;
  String? selectedPdfLastPath;
  File? get fitnessImage => _fitnessImage;
  File? get fitnessPdf => _fitnessPdf;

  final TextEditingController _vehicleNumber = TextEditingController();
  final TextEditingController _fitnessNumber = TextEditingController();
  final TextEditingController _expiryDate = TextEditingController();

  TextEditingController get vehicleNumber => _vehicleNumber;
  TextEditingController get fitnessNumber => _fitnessNumber;
  TextEditingController get expiryDate => _expiryDate;

  updateSelectedValue(String? newValue) {
    if (newValue == null) return;

    _selectedFitness = newValue;
    notifyListeners();
  }

  getLastPdfPathName() {
    final uri = Uri.parse(_fitnessPdf.toString());
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    log(' last path: ${pathSegments.last}');
    log('message : ${lastPathSegment.toString()}');
    selectedPdfLastPath = lastPathSegment;
  }

  setImage(File? image, String? imageName) {
    if (imageName == null) {
      _fitnessImage = image;
      notifyListeners();
    }
  }

  setPdf(File? pdf, String? pdfName) {
    if (pdf == null) {
      return;
    }
    _fitnessPdf = pdf;
    notifyListeners();
  }

  setImageNull() {
    _fitnessImage = null;
    notifyListeners();
  }

  void showDatePickerFitness(BuildContext context) {
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
