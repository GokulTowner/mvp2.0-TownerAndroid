import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:townerapp/models/driver_info_modal.dart';

import '../../../../imports.dart';
import '../../../../network/driver_repo.dart';

class DriverDisplayCardProvider extends ChangeNotifier {
  bool _isReadOnly = false;
  bool get isReadOnly => _isReadOnly;
  final TextEditingController _displayCardNo = TextEditingController();
  TextEditingController get displayCardNo => _displayCardNo;

  File? _displayCardImage;
  File? _displayCardPdf;
  File? get displayCardImage => _displayCardImage;
  File? get displayCardPdf => _displayCardPdf;
  String? selectedPdfLastPath;

  setIsReadOnly(bool value) {
    _isReadOnly = value;
    notifyListeners();
  }

  getDriverDetailsForViewAndEditOwner(DriverProfileModel driverProfile) {
    _displayCardNo.text = driverProfile.displayCard.displayCardNumber;
    notifyListeners();
  }

  getDriverDetailsForViewAndEditDriver(DriverDetailsModel driverDetails) {
    _displayCardNo.text = driverDetails.displayCard.displayCardNumber;
    notifyListeners();
  }

  clearAllForAddProfile() {
    _displayCardNo.clear();
    notifyListeners();
  }

  getLastPdfPathName() {
    final uri = Uri.parse(_displayCardPdf.toString());
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    log(' last path: ${pathSegments.last}');
    log('message : ${lastPathSegment.toString()}');
    selectedPdfLastPath = lastPathSegment;
  }

  setImage(File? image, String? imageName) {
    if (imageName == null) {
      _displayCardImage = image;
      notifyListeners();
    }
  }

  setPdf(File? pdf, String? pdfName) {
    if (pdf == null) {
      return;
    }
    _displayCardPdf = pdf;
    notifyListeners();
  }

  setImageNull() {
    _displayCardImage = null;
    notifyListeners();
  }

  Future<void> saveCardData(BuildContext context) async {
    try {
      var map = {
        "displayCardNumber": displayCardNo.text,

      };

      FormData.fromMap({
        "filefor": await MultipartFile.fromFile((displayCardPdf?.path ?? displayCardImage?.path)!,
            filename: 'Card'),
        "type": "displayCardImage"
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
