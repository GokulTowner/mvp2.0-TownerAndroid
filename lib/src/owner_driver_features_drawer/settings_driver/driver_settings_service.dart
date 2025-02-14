import 'dart:developer';
import '../../../imports.dart';

class DriverSettingService {
  Map<String, dynamic> settingsData = {
    "governmentRateStatus": {
      "status": true,
      "baseFare": "4*100 = 100",
      "extraKm": "21 for 1 KM",
      "extraTime": "1 for 1 min"
    },
    "myDiscountStatus": {
      "status": true,
      "percentage": 10,
      "amount": 25,
    },
    "convenienceCharge": {"status": false},
    "nightFare": {"status": false},
    "walletActive": {"status": false},
    "subscription": {"status": false},
    "inviteDrivers": {"status": false, "mandatory": false},
    "referralBonus": {"status": false, "mandatory": false}
  };

  Dio dio = Dio();
  String getDriverSettingUrl = '';
  String updateDriverSettingUrl = '';
  Future<DriverSettingModel?> fetchDriverSettings() async {
    try {
      // Response response = await dio.get(getDriverSettingUrl);

      int statusCode = 200;

      if (statusCode == 200) {
        dynamic data = settingsData;

        DriverSettingModel driverSettingsData =
            DriverSettingModel.fromJson(data);
        return driverSettingsData;
      } else {
        return null;
      }
    } catch (e) {
      log('Error : $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> updateDriverSetting(
      DriverSettingModel data) async {
    try {
      // Response response = await dio.post(
      //   updateDriverSettingUrl,
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
