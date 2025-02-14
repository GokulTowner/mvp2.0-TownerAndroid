import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:townerapp/models/driver_info_modal.dart';
import '../../../../imports.dart';
import '../../../../network/driver_repo.dart';

class DriverVoterIdProvider extends ChangeNotifier {
  bool _isReadOnly = false;
  bool get isReadOnly => _isReadOnly;

  final TextEditingController _name = TextEditingController();
  final TextEditingController _fatherName = TextEditingController();
  final TextEditingController _voterIdNumber = TextEditingController();
  final TextEditingController _dateOfBirth = TextEditingController();

  TextEditingController get name => _name;
  TextEditingController get fatherName => _fatherName;
  TextEditingController get voterIdNumber => _voterIdNumber;
  TextEditingController get dateOfBirth => _dateOfBirth;

  File? _voterIdImage;
  File? _voterIdPdf;
  File? get voterIdImage => _voterIdImage;
  File? get voterIdPdf => _voterIdPdf;
  String? selectedPdfLastPath;

  setIsReadOnly(bool value) {
    _isReadOnly = value;
    notifyListeners();
  }

  getDriverDetailsForViewAndEditOwner(DriverProfileModel driverProfile) {
    _name.text = driverProfile.voterId.nameInVoterId;
    _voterIdNumber.text = driverProfile.voterId.voterIdNumber;
    _fatherName.text = driverProfile.voterId.fatherName;
    _dateOfBirth.text = driverProfile.voterId.dateOfBirth;
    notifyListeners();
  }

  getDriverDetailsForViewAndEditDriver(DriverDetailsModel driverDetails) {
    _name.text = driverDetails.voterId.nameInVoterId;
    _voterIdNumber.text = driverDetails.voterId.voterIdNumber;
    _fatherName.text = driverDetails.voterId.fatherName;
    _dateOfBirth.text = driverDetails.voterId.dateOfBirth;
    notifyListeners();
  }

  clearAllForAddProfile() {
    _name.clear();
    _voterIdNumber.clear();
    _fatherName.clear();
    _dateOfBirth.clear();
    // _selectedRto = 'Select Rto';
    notifyListeners();
  }

  getLastPdfPathName() {
    final uri = Uri.parse(_voterIdPdf.toString());
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    log(' last path: ${pathSegments.last}');
    log('message : ${lastPathSegment.toString()}');
    selectedPdfLastPath = lastPathSegment;
  }

  setImage(File? image, String? imageName) {
    if (imageName == null) {
      _voterIdImage = image;
      notifyListeners();
    }
  }

  setPdf(File? pdf, String? pdfName) {
    if (pdf == null) {
      return;
    }
    _voterIdPdf = pdf;
    notifyListeners();
  }

  setImageNull() {
    _voterIdImage = null;
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

  Future<void> saveVoter(BuildContext context) async {
    try {
      var map = {

      };

      FormData.fromMap({
        "filefor": await MultipartFile.fromFile((voterIdPdf?.path ?? voterIdImage?.path)!,
            filename: 'license'),
        "nameInVoterId": name.text,
        "fatherName": fatherName.text,
        "dateOfBirth": dateOfBirth.text,
        "voterIdNumber": voterIdNumber.text,
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
