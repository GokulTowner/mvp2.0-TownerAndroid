import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:townerapp/models/driver_info_modal.dart';
import 'package:townerapp/src/owner_speed_dial/driver_manager/add_driver/model/driver_docs_modal.dart';

import '../../../../imports.dart';
import '../../../../network/driver_repo.dart';

class AddDriverProvider extends ChangeNotifier {
  AddDriverProvider() {
      fetchDriverDetailsForDriver();
      fetchDriverDocs();
  }

  DriverDocsModal? _driverDetails;
  DriverDocsModal? get driverDetails => _driverDetails;


  DriverDetailsModel? _driverDummyDetails;
  DriverDetailsModel? get driverDummyDetails => _driverDummyDetails;

  DriverProfileModel? _driverProfile;
  DriverProfileModel? get driverProfiel => _driverProfile;

  bool _isReadOnly = false;
  bool get isReadOnly => _isReadOnly;

  bool _showPass = true;
  bool get showPass => _showPass;

  final TextEditingController _driverName = TextEditingController();
  final TextEditingController _driverPhoneNumber = TextEditingController();
  final TextEditingController _driverPassword = TextEditingController();

  TextEditingController get driverName => _driverName;
  TextEditingController get driverPhoneNumber => _driverPhoneNumber;
  TextEditingController get driverPassword => _driverPassword;

  File? _image;
  File? get image => _image;

  setShowPass() {
    _showPass = !_showPass;
    notifyListeners();
  }

  setIsReadOnly(bool value) {
    _isReadOnly = value;
    notifyListeners();
  }

  getDriverDetailsForViewAndEditOwner(
      int index, List<DriverProfileModel> driverProfileList) {
    _driverProfile = driverProfileList[index];
    _driverName.text = _driverProfile?.aadhar.nameInAadhar ?? 'No Data';
    _driverPhoneNumber.text = _driverProfile?.driverPhoneNumber ?? 'No Data';
    notifyListeners();
  }

  getDriverDetailsForViewAndEditDriver() {
    // log('driver profile ${_driverDetails?.driverName.toString()}');
    _driverName.text = localStorageService.userDriver?.name ?? 'No Data';
    _driverPhoneNumber.text = localStorageService.userDriver?.email ?? 'No Data';
    notifyListeners();
  }

  setImage(File? image, String? imageName) {
    if (imageName == null) {
      _image = image;
      notifyListeners();
    } else if (imageName == 'panCard') {}
  }

  clearAllForAddProfile() {
    _driverName.clear();
    _driverPhoneNumber.clear();
    notifyListeners();
    if (_image == null) return;
    _image!.delete();
    notifyListeners();
  }

  Future<void> fetchDriverDetailsForDriver() async {
    AddDriverService addDriverService = AddDriverService();

    final result = await addDriverService.getDriverDetails();
    if (result != null) {
      _driverDummyDetails = result;
      notifyListeners();
      getDriverDetailsForViewAndEditDriver();
    } else {
      flutterToastFailShort('Something went Wrong', 14);
    }
  }


  Future<void> fetchDriverDocs() async {
    try {
      final result = await DriverRepo.getDocuments(null);

      if (result != null) {
        var data = driverDocsModalFromMap(jsonEncode(result));
        _driverDetails = data;
        notifyListeners();
        getDriverDetailsForViewAndEditDriver();
      } else {
        flutterToastFailShort('Something went Wrong', 14);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

  }

  void saveData(BuildContext context) async{

    try {
      var map  = FormData.fromMap({
        'files': [
          await MultipartFile.fromFile((image?.path)!, filename: ''),
        ],
        "name": driverName.text,
        "expDate": "",
        "fieldName": "DriverSelfie",
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
