import 'dart:developer';
import '../../../../imports.dart';

class VehicleSettingsService {
  Map<String, dynamic> vehSetting = {
    "governmentRateStatus": {
      "status": true,
      "baseFare": "4*100 = 100",
      "extraKm": "21 for 1 KM",
      "extraTime": "1 for 1 min"
    },
    "myDiscountStatus": {
      "status": false,
      "mandatory": false,
      "percentage": 10,
      "amount": 25,
    },
    "convenienceCharge": {
      "status": false,
      "mandatory": false,
    },
    "nightFare": {
      "status": false,
      "mandatory": false,
    },
    "walletActive": {
      "status": false,
      "mandatory": false,
    },
    "subscription": {
      "status": false,
      "mandatory": false,
    },
  };

  Dio dio = Dio();
  String getVehicleSettingUrl = '';
  String updateVehicleSettingUrl = '';
  Future<VehicleSettingsModel?> fetchVehicleSettings(String vehId) async {
    try {
      // Response response = await dio.get(getVehicleSettingUrl);

      int statusCode = 200;

      if (statusCode == 200) {
        dynamic data = vehSetting;

        VehicleSettingsModel vehicleSettingsData =
            VehicleSettingsModel.fromJson(data);
        return vehicleSettingsData;
      } else {
        return null;
      }
    } catch (e) {
      log('Error : $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> updateVehicleSetting(
      VehicleSettingsModel data, String vehId) async {
    try {
      // Response response = await dio.post(
      //   updateVehicleSettingUrl,
      //   data: {
      //     "vehId": vehId,
      //     ...data.toJson(),
      //   },
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
