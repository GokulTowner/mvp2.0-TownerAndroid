import 'dart:developer';
import '../../../imports.dart';

class VehicleProfileDriverService {
  Map<String, dynamic> vehicleDetails = {
    "type": "Sedan",
    "model": "Honda City",
    "driverAlloted": "John",
    "rc": "KL-59-B-4452",
    "status": "Approved",
    "imagePath":
        "https://northfleet.in/wp-content/uploads/2023/12/maruti-Suzuki-Dzire.webp"
  };

  Dio dio = Dio();
  String vehicleDetailsUrl = '';

  Future<VehicleProfileDriverModel?> fetchVehicleDetails() async {
    try {
      // Response response = await dio.get(vehicleDetailsUrl);
      int statusCode = 200;

      if (statusCode == 200) {
        dynamic data = vehicleDetails;

        VehicleProfileDriverModel vehicleData =
            VehicleProfileDriverModel.fromJson(data);
        return vehicleData;
      } else {
        return null;
      }
    } catch (e) {
      log('Error :$e');
      return null;
    }
  }
}
