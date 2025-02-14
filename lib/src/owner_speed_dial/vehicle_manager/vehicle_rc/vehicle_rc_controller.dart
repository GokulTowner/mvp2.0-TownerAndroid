import 'dart:developer';
import 'package:intl/intl.dart';
import '../../../../imports.dart';

class VehicleRcProvider extends ChangeNotifier {
  final List<String> _rcList = ['<5 years', '5-10 years', '10+ years'];
  List<String> get rcList => _rcList;

  String? _selectedRto;
  String? get selectedRto => _selectedRto;

  String? _selectedRc;
  String? get selectedrc => _selectedRc;

  File? _rcImage;
  File? _rcPdf;
  String? selectedPdfLastPath;
  File? get rcImage => _rcImage;
  File? get rcPdf => _rcPdf;

  final TextEditingController _vehicleNumber = TextEditingController();
  final TextEditingController _rcNumber = TextEditingController();
  final TextEditingController _expiryDate = TextEditingController();

  TextEditingController get vehicleNumber => _vehicleNumber;
  TextEditingController get rcNumber => _rcNumber;
  TextEditingController get expiryDate => _expiryDate;

  updateSelectedValue(String? newValue) {
    if (newValue == null) return;

    _selectedRc = newValue;
    notifyListeners();
  }

  selectRto(String? value) {
    if (value == null) return;
    _selectedRto = value;
    notifyListeners();
  }

  getLastPdfPathName() {
    final uri = Uri.parse(_rcPdf.toString());
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    log(' last path: ${pathSegments.last}');
    log('message : ${lastPathSegment.toString()}');
    selectedPdfLastPath = lastPathSegment;
  }

  setImage(File? image, String? imageName) {
    if (imageName == null) {
      _rcImage = image;
      notifyListeners();
    }
  }

  setPdf(File? pdf, String? pdfName) {
    if (pdf == null) {
      return;
    }
    _rcPdf = pdf;
    notifyListeners();
  }

  setImageNull() {
    _rcImage = null;
    notifyListeners();
  }

  void showDatePickerRc(BuildContext context) {
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
