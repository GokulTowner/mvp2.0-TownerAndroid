import 'dart:developer';
import '../../../imports.dart';

class OwnerSettingService {
  Map<String, dynamic> settingsData = {
    "govRate": {"status": true, "mandatory": true},
    "myDiscount": {"status": false, "mandatory": true},
    "promotionalDiscount": {"status": true, "mandatory": true},
    "convenienceCharge": {"status": false, "mandatory": false},
    "gst": {"status": false, "mandatory": false},
    "onlineBooking": {"status": false, "mandatory": false},
    "leadCharge": {"status": false, "mandatory": false},
    "selfBooking": {"status": false, "mandatory": false},
    "billShare": {"status": false, "mandatory": false},
    "itrFiling": {"status": false, "mandatory": false},
    "gstRegFiling": {"status": false, "mandatory": false},
    "plFilling": {"status": false, "mandatory": false},
    "inviteCustomers": {"status": false, "mandatory": false},
    "tripsHistory": {"status": false, "mandatory": false},
    "inviteDrivers": {"status": false, "mandatory": false},
    "walletActive": {"status": false, "mandatory": false},
    "referralBonus": {"status": false, "mandatory": false}
  };

  Dio dio = Dio();
  String getOwnerSettingUrl = '';
  String updateOwnerSettingUrl = '';
  Future<OwnerSettingModel?> fetchOwnerSettings() async {
    try {
      // Response response = await dio.get(getOwnerSettingUrl);

      int statusCode = 200;

      if (statusCode == 200) {
        dynamic data = settingsData;

        OwnerSettingModel ownerSettingsData = OwnerSettingModel.fromJson(data);
        return ownerSettingsData;
      } else {
        return null;
      }
    } catch (e) {
      log('Error : $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> updateOwnerSetting(
      OwnerSettingModel data) async {
    try {
      // Response response = await dio.post(
      //   updateOwnerSettingUrl,
      //   data: data.toJson(),
      // );
      log('Settings Data : ${data.toJson()}');
      int statusCode = 200;
      if (statusCode == 200) {
        dynamic data = {
          "status": true,
          "message": "Settings update succesfully"
        };
        return data;
      } else {
        return null;
      }
    } catch (e) {
      log('Error : $e');
      return null;
    }
  }
}
