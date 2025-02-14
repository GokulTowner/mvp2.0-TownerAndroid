import 'dart:developer';
import 'package:flutter/foundation.dart';

import '../../../../imports.dart';
import '../../../../models/driver_info_modal.dart';
import '../../../../network/driver_repo.dart';

class DriverUniqueIdProvider extends ChangeNotifier {
  bool _isReadOnly = false;
  bool get isReadOnly => _isReadOnly;

  final TextEditingController _uniqueId = TextEditingController();
  TextEditingController get uniqueId => _uniqueId;

  File? _uniqueIdImage;
  File? _uniqueIdPdf;
  File? get uniqueIdImage => _uniqueIdImage;
  File? get uniqueIdPdf => _uniqueIdPdf;
  String? selectedPdfLastPath;

  setIsReadOnly(bool value) {
    _isReadOnly = value;
    notifyListeners();
  }

  getDriverDetailsForViewAndEditOwner(DriverProfileModel driverProfile) {
    _uniqueId.text = driverProfile.uniqueDriver.uniqueDriverId;

    notifyListeners();
  }

  getDriverDetailsForViewAndEditDriver(DriverDetailsModel driverDetails) {
    _uniqueId.text = driverDetails.uniqueDriver.uniqueDriverId;

    notifyListeners();
  }

  clearAllForAddProfile() {
    _uniqueId.clear();
    notifyListeners();
  }

  getLastPdfPathName() {
    final uri = Uri.parse(_uniqueIdPdf.toString());
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    log(' last path: ${pathSegments.last}');
    log('message : ${lastPathSegment.toString()}');
    selectedPdfLastPath = lastPathSegment;
  }

  setImage(File? image, String? imageName) {
    if (imageName == null) {
      _uniqueIdImage = image;
      notifyListeners();
    }
  }

  setPdf(File? pdf, String? pdfName) {
    if (pdf == null) {
      return;
    }
    _uniqueIdPdf = pdf;
    notifyListeners();
  }

  setImageNull() {
    _uniqueIdImage = null;
    notifyListeners();
  }


  Future<void> saveUniqueData(BuildContext context) async {
    try {
      var map = {
        "uniqueDriverId": uniqueId.text,
      };

      FormData.fromMap({
        "filefor": await MultipartFile.fromFile((uniqueIdPdf?.path ?? uniqueIdImage?.path)!,
            filename: 'license'),
        "type": "uniqueDriverIdImage"
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
