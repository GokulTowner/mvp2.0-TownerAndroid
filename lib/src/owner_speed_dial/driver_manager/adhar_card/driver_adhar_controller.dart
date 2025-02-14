import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:townerapp/models/driver_info_modal.dart';
import '../../../../imports.dart';
import '../../../../network/driver_repo.dart';
import '../add_driver/model/driver_docs_modal.dart';

class DriverAadharCardProvider extends ChangeNotifier {
  bool _isReadOnly = false;
  bool get isReadOnly => _isReadOnly;

  final TextEditingController _name = TextEditingController();
  final TextEditingController _fatherName = TextEditingController();
  final TextEditingController _aadharNumber = TextEditingController();
  final TextEditingController _dateOfBirth = TextEditingController();

  TextEditingController get name => _name;
  TextEditingController get fatherName => _fatherName;
  TextEditingController get aadharNumber => _aadharNumber;
  TextEditingController get dateOfBirth => _dateOfBirth;

  File? _aadharCardImage;
  File? _aadharCardPdf;
  File? get aadharCardImage => _aadharCardImage;
  File? get aadharCardPdf => _aadharCardPdf;
  String? selectedPdfLastPath;

  setIsReadOnly(bool value) {
    _isReadOnly = value;
    notifyListeners();
  }

  getDriverDetailsForViewAndEditOwner(DriverProfileModel driverProfile) {
    _name.text = driverProfile.aadhar.nameInAadhar;
    _aadharNumber.text = driverProfile.aadhar.adharNumber;
    _fatherName.text = driverProfile.aadhar.fatherName;
    _dateOfBirth.text = driverProfile.aadhar.dateOfBirth;
    notifyListeners();
  }

  getDriverDetailsForViewAndEditDriver(DriverDocument? driverDetails) {

    if(driverDetails== null) return;


    // _name.text = driverDetails.aadhar.nameInAadhar;
    // _aadharNumber.text = driverDetails.aadhar.adharNumber;
    // _fatherName.text = driverDetails.aadhar.fatherName;
    // _dateOfBirth.text = driverDetails.aadhar.dateOfBirth;

    _name.text = "-";
    _aadharNumber.text = "-";
    _fatherName.text = "-";
    _dateOfBirth.text = "-";
    notifyListeners();
  }

  clearAllForAddProfile() {
    _name.clear();
    _aadharNumber.clear();
    _fatherName.clear();
    _dateOfBirth.clear();
    // _selectedRto = 'Select Rto';
    notifyListeners();
  }

  getLastPdfPathName() {
    final uri = Uri.parse(_aadharCardPdf.toString());
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    log(' last path: ${pathSegments.last}');
    log('message : ${lastPathSegment.toString()}');
    selectedPdfLastPath = lastPathSegment;
  }

  setImage(File? image, String? imageName) {
    if (imageName == null) {
      _aadharCardImage = image;
      notifyListeners();
    }
  }

  setPdf(File? pdf, String? pdfName) {
    if (pdf == null) {
      return;
    }
    _aadharCardPdf = pdf;
    notifyListeners();
  }

  setImageNull() {
    _aadharCardImage = null;
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

  Future<void> saveAdhar(BuildContext context) async {
    try {
      var map = FormData.fromMap({
        'files': [ await MultipartFile.fromFile((aadharCardPdf?.path ?? _aadharCardImage?.path)!)],
        "nameInAadhar": name.text,
        "fatherName": fatherName.text,
        "dateOfBirth": dateOfBirth.text,
        "adharNumber": aadharNumber.text,
        "expDate": "",
        "fieldName": "aadharCard",
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
