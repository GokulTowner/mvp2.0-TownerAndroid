import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:townerapp/models/driver_info_modal.dart';
import '../../../../imports.dart';
import '../../../../network/driver_repo.dart';
import '../add_driver/model/driver_docs_modal.dart';

class DriverLicenseProvider extends ChangeNotifier {
  bool _isReadOnly = false;

  bool get isReadOnly => _isReadOnly;

  final TextEditingController _dlNumber = TextEditingController();
  final TextEditingController _dlValidity = TextEditingController();
  final TextEditingController _badgeNumber = TextEditingController();
  final TextEditingController _badgeValidity = TextEditingController();
  final TextEditingController _fatherName = TextEditingController();
  final TextEditingController _dateOfBirth = TextEditingController();

  TextEditingController get dlNumber => _dlNumber;

  TextEditingController get dlValidity => _dlValidity;

  TextEditingController get badgeNumber => _badgeNumber;

  TextEditingController get badgeValidity => _badgeValidity;

  TextEditingController get fatherName => _fatherName;

  TextEditingController get dateOfBirth => _dateOfBirth;

  String? _selectedRto;

  String? get selectedRto => _selectedRto ?? 'Select RTO';

  File? _dlImage;
  File? _dlPdf;

  File? get dlImage => _dlImage;

  File? get dlPdf => _dlPdf;
  String? selectedPdfLastPath;

  setIsReadOnly(bool value) {
    _isReadOnly = value;
    notifyListeners();
  }

  getDriverDetailsForViewAndEditOwner(DriverProfileModel driverProfile) {
    _dlNumber.text = driverProfile.dlDetails.dlNumber;
    _dlValidity.text = driverProfile.dlDetails.dlValidity;
    _badgeNumber.text = driverProfile.dlDetails.badgeNumber;
    _badgeValidity.text = driverProfile.dlDetails.badgeValidity;
    _fatherName.text = driverProfile.dlDetails.fatherName;
    _dateOfBirth.text = driverProfile.dlDetails.dateOfBirth;
    _selectedRto = driverProfile.dlDetails.selectedRTO;
    notifyListeners();
  }

  getDriverDetailsForViewAndEditDriver(DriverDocument? driverDetails) {
    // _dlNumber.text = driverDetails.dlDetails.dlNumber;
    // _dlValidity.text = driverDetails.dlDetails.dlValidity;
    // _badgeNumber.text = driverDetails.dlDetails.badgeNumber;
    // _badgeValidity.text = driverDetails.dlDetails.badgeValidity;
    // _fatherName.text = driverDetails.dlDetails.fatherName;
    // _dateOfBirth.text = driverDetails.dlDetails.dateOfBirth;
    // _selectedRto = driverDetails.dlDetails.selectedRTO;

    if(driverDetails==null)return;

    _dlNumber.text = "-";
    _dlValidity.text = driverDetails.field?.firstWhere((e)=>e.slug == Slug.EXP_DATE).value??'-';
    _badgeNumber.text = "-";
    _badgeValidity.text = "-";
    _fatherName.text = "-";
    _dateOfBirth.text = "-";
    _selectedRto = null;

    // _dlImage = driverDetails.field?.firstWhere((e)=>e.slug == Slug.FRONT_IMAGE).value??'-';
    notifyListeners();
  }

  clearAllForAddProfile() {
    _dlNumber.clear();
    _dlValidity.clear();
    _badgeNumber.clear();
    _badgeValidity.clear();
    _fatherName.clear();
    _dateOfBirth.clear();
    // _selectedRto = 'Select Rto';
    notifyListeners();
  }

  getLastPdfPathName() {
    final uri = Uri.parse(_dlPdf.toString());
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    log(' last path: ${pathSegments.last}');
    log('message : ${lastPathSegment.toString()}');
    selectedPdfLastPath = lastPathSegment;
  }

  setImage(File? image, String? imageName) {
    if (imageName == null) {
      _dlImage = image;
      notifyListeners();
    }
  }

  setPdf(File? pdf, String? pdfName) {
    if (pdf == null) {
      return;
    }
    _dlPdf = pdf;
    notifyListeners();
  }

  setImageNull() {
    _dlImage = null;
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
          _dateOfBirth.text = DateFormat('dd-MM-yyy').format(value);
          notifyListeners();
        }
      },
    );
  }

  Future<void> updateRto(String? newRto) async {
    if (newRto == null) return;

    _selectedRto = newRto;
    notifyListeners();
  }

  Future<void> saveLicenseData(BuildContext context) async {
    try {
      var map  = FormData.fromMap({
        'files': [
          await MultipartFile.fromFile((dlPdf?.path ?? dlImage?.path)!, filename: ''),
        ],
        "dlNumber": dlNumber.text,
        "expDate": dlValidity.text,
        "badgeNumber": badgeNumber.text,
        "badgeValidity": badgeValidity.text,
        "fatherName": fatherName.text,
        "dateOfBirth": dateOfBirth.text,
        "selectedRTO": selectedRto,
        "fieldName": "drivingLicense",
      });
      final result = await DriverRepo.uploadDoc(map);

      if (result != null)  {
        DriverProfileCreateSuccessPopup
        driverProfileCreateSuccessPopup =
        DriverProfileCreateSuccessPopup();
        driverProfileCreateSuccessPopup.showMessage(context);

        setIsReadOnly(true);

        // TODO:- fetch profile docs api

      } else {
        Fluttertoast.showToast(
          msg: 'Something went wrong',
          backgroundColor: Colors.black,
          textColor: Colors.white,
        );
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
