import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import '../../../../imports.dart';
import '../../../../models/driver_info_modal.dart';
import '../../../../network/driver_repo.dart';
import '../add_driver/model/driver_docs_modal.dart';

class DriverPancardProvider extends ChangeNotifier {
  bool _isReadOnly = false;
  bool get isReadOnly => _isReadOnly;

  final TextEditingController _name = TextEditingController();
  final TextEditingController _fatherName = TextEditingController();
  final TextEditingController _pancardNumber = TextEditingController();
  final TextEditingController _dateOfBirth = TextEditingController();

  TextEditingController get name => _name;
  TextEditingController get fatherName => _fatherName;
  TextEditingController get pancardNumber => _pancardNumber;
  TextEditingController get dateOfBirth => _dateOfBirth;

  File? _pancardImage;
  File? _pancardPdf;
  File? get pancardImage => _pancardImage;
  File? get pancardPdf => _pancardPdf;
  String? selectedPdfLastPath;

  setIsReadOnly(bool value) {
    _isReadOnly = value;
    log('_isreadOnly : $_isReadOnly');
    notifyListeners();
  }

  getDriverDetailsForViewAndEditOwner(DriverProfileModel driverProfile) {
    _name.text = driverProfile.pancard.nameInPancard;
    _pancardNumber.text = driverProfile.pancard.panNumber;
    _fatherName.text = driverProfile.pancard.fatherName;
    _dateOfBirth.text = driverProfile.pancard.dateOfBirth;
    notifyListeners();
  }

  getDriverDetailsForViewAndEditDriver(DriverDocument? driverDetails) {
    if(driverDetails==null)return;

    _name.text = "-";
    _pancardNumber.text = "-";
    _fatherName.text = "-";
    _dateOfBirth.text = "-";
    notifyListeners();
  }

  clearAllForAddProfile() {
    _name.clear();
    _pancardNumber.clear();
    _fatherName.clear();
    _dateOfBirth.clear();
    // _selectedRto = 'Select Rto';
    notifyListeners();
  }

  getLastPdfPathName() {
    final uri = Uri.parse(_pancardPdf.toString());
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    log(' last path: ${pathSegments.last}');
    log('message : ${lastPathSegment.toString()}');
    selectedPdfLastPath = lastPathSegment;
  }

  setImage(File? image, String? imageName) {
    if (imageName == null) {
      _pancardImage = image;
      notifyListeners();
    }
  }

  setPdf(File? pdf, String? pdfName) {
    if (pdf == null) {
      return;
    }
    _pancardPdf = pdf;
    notifyListeners();
  }

  setImageNull() {
    _pancardImage = null;
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


  Future<void> savePan(BuildContext context) async {
    try {
      var map = FormData.fromMap({
        'files': [
          await MultipartFile.fromFile(
              (pancardPdf?.path ?? pancardImage?.path)!,
              filename: '')
        ],
        "nameInPancard": name.text,
        "fatherName": fatherName.text,
        "dateOfBirth": dateOfBirth.text,
        "panNumber": pancardNumber.text,
        "expDate": "",
        "fieldName": "panCard",
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
