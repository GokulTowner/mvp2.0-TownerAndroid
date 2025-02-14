import 'dart:developer';
import 'package:intl/intl.dart';
import '../../../../imports.dart';

class AddVehicleProvider extends ChangeNotifier {
  bool _isStepTwo = false;
  bool get isStepTwo => _isStepTwo;

  File? _vehicleRcImage;
  File? _vehicleRcPdf;

  File? get vehicleRcImage => _vehicleRcImage;
  File? get vehicleRcPdf => _vehicleRcPdf;

  String? _selectedVehicleRcLastPath;
  String? get selectedVehicleRcLastPath => _selectedVehicleRcLastPath;

  final List<String> _vehicleTypeList = ['SUV', 'Sedan', 'Hatchback'];
  final List<int> _seatingCapacityList = [2, 4, 6];
  final List<String> _serviceTypeList = ['Daily', 'Rental', 'Outstation'];
  final List<String> _fuelTypeList = ['CNG', 'EV', 'Petrol', 'Diecel'];
  final List<String> _vehicleCategoryList = ['Passenger ', 'Loginstics'];
  final List<String> _vehicleColorList = ['Red ', 'Green', 'Blue'];

  List<String> get vehicleTypeList => _vehicleTypeList;
  List<int> get seatingCapacityList => _seatingCapacityList;
  List<String> get serviceTypeList => _serviceTypeList;
  List<String> get fuelTypeList => _fuelTypeList;
  List<String> get vehicleCategoryList => _vehicleCategoryList;
  List<String> get vehicleColorList => _vehicleColorList;

  String? _selectedVehicleType;
  String? _selectedSeatingCapacity;
  String? _selecctedServiceType;
  String? _selectedFuelType;
  String? _selectedVehicleCategory;
  String? _selectedVehicleColor;

  String? get selectedVehicleType => _selectedVehicleType;
  String? get selectedSeatingCapacity => _selectedSeatingCapacity;
  String? get selecctedServiceType => _selecctedServiceType;
  String? get selectedFuelType => _selectedFuelType;
  String? get selectedVehicleCategory => _selectedVehicleCategory;
  String? get selectedVehicleColor => _selectedVehicleColor;

  final TextEditingController _vehicleNo = TextEditingController();
  final TextEditingController _vehicleModel = TextEditingController();
  final TextEditingController _vehicleManYear = TextEditingController();

  TextEditingController get vehicleNo => _vehicleNo;
  TextEditingController get vehicleModel => _vehicleModel;
  TextEditingController get vehicleManYear => _vehicleManYear;

  updateselectedValue(String? newValue, String? type) {
    if (newValue == null) return;
    if (type == null) return;

    if (type == 'vehicleType') {
      _selectedVehicleType = newValue;
      notifyListeners();
    } else if (type == 'seatingCapacity') {
      _selectedSeatingCapacity = newValue;
      notifyListeners();
    } else if (type == 'serviceP') {
      _selecctedServiceType = newValue;
      notifyListeners();
    } else if (type == 'fuelType') {
      _selectedFuelType = newValue;
      notifyListeners();
    } else if (type == 'vehicleCategory') {
      _selectedVehicleCategory = newValue;
      notifyListeners();
    } else if (type == 'vehicleColor') {
      _selectedVehicleColor = newValue;
      notifyListeners();
    }
  }

  setStepTwo() {
    _isStepTwo = !_isStepTwo;
    notifyListeners();
  }

  getLastPdfPathName() {
    final uri = Uri.parse(_vehicleRcPdf.toString());
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    log(' last path: ${pathSegments.last}');
    log('message : ${lastPathSegment.toString()}');
    _selectedVehicleRcLastPath = lastPathSegment;
  }

  setImage(File? image, String? imageName) {
    _vehicleRcImage = image;
    notifyListeners();
  }

  setPdf(File? pdf, String? pdfName) {
    if (pdf == null) {
      return;
    }
    _vehicleRcPdf = pdf;
    notifyListeners();
  }

  setImageNull() {
    _vehicleRcImage = null;
    notifyListeners();
  }

  void showDatePickerDriver(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1947),
      lastDate: DateTime(2100),
    ).then(
      (value) {
        if (value != null) {
          _vehicleManYear.text = DateFormat('dd-MM-yyy').format(value);
          notifyListeners();
        }
      },
    );
  }
}
