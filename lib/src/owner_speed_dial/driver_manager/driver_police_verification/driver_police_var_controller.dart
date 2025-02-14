import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:townerapp/models/driver_info_modal.dart';

import '../../../../imports.dart';
import '../../../../network/driver_repo.dart';

class DriverPolicVarProvider extends ChangeNotifier {
  bool _isReadOnly = false;
  bool get isReadOnly => _isReadOnly;

  final TextEditingController _policeVarNo = TextEditingController();
  TextEditingController get policeVarNo => _policeVarNo;

  File? _policeVarImage;
  File? _policeVarPdf;
  File? get policeVarImage => _policeVarImage;
  File? get policeVarPdf => _policeVarPdf;
  String? selectedPdfLastPath;

  setIsReadOnly(bool value) {
    _isReadOnly = value;
    notifyListeners();
  }

  getDriverDetailsForViewAndEditOwner(DriverProfileModel driverProfile) {
    _policeVarNo.text = driverProfile.pVerification.pVerificationId;

    notifyListeners();
  }

  getDriverDetailsForViewAndEditDriver(DriverDetailsModel driverDetails) {
    _policeVarNo.text = driverDetails.pVerification.pVerificationId;

    notifyListeners();
  }

  clearAllForAddProfile() {
    _policeVarNo.clear();
    notifyListeners();
  }

  getLastPdfPathName() {
    final uri = Uri.parse(_policeVarPdf.toString());
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    log(' last path: ${pathSegments.last}');
    log('message : ${lastPathSegment.toString()}');
    selectedPdfLastPath = lastPathSegment;
  }

  setImage(File? image, String? imageName) {
    if (imageName == null) {
      _policeVarImage = image;
      notifyListeners();
    }
  }

  setPdf(File? pdf, String? pdfName) {
    if (pdf == null) {
      return;
    }
    _policeVarPdf = pdf;
    notifyListeners();
  }

  setImageNull() {
    _policeVarImage = null;
    notifyListeners();
  }

  Future<void> saveData(BuildContext context) async {
    try {
      var map = {
        "pVerificationId": policeVarNo.text,
      };

      FormData.fromMap({
        "filefor": await MultipartFile.fromFile((policeVarPdf?.path ?? policeVarImage?.path)!,
            filename: 'Police'),
        "type": "pVerificationImage"
      });
      final result = await DriverRepo.uploadDoc(map);

      if (result != null) {
      } else {}
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
