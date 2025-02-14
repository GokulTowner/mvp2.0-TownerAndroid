import 'dart:developer';

import '../../../../imports.dart';

class SubscriptionDriveService {
  Dio dio = Dio();

  Map<String, dynamic> driverSubscription = {
    "planId": "001",
    "vehId": "0020",
    "planName": "Free: 30 days",
    "planAmount": "4600",
    "vehModel": "Honda City",
    "planValidity": 30,
    "remainingDays": 10,
    "validityType": "Monthly",
    "startDate": "10/Feb/2024 | 10:AM",
    "endDate": "10/Mar/2024 | 10:AM",
    "expiredPlans": [
      {
        "planId": "001",
        "vehId": "0020",
        "planName": "monthly-4600",
        "planAmount": "4600",
        "vehModel": "Honda City",
        "planValidity": 30,
        "remainingDays": 0,
        "validityType": "Monthly",
        "startDate": "10/Feb/2024 | 10:AM",
        "endDate": "10/Mar/2024 | 10:AM",
      },
      {
        "planId": "002",
        "vehId": "0030",
        "planName": "weekly-600",
        "planAmount": "4600",
        "vehModel": "Honda City",
        "planValidity": 30,
        "remainingDays": 0,
        "validityType": "Monthly",
        "startDate": "10/Feb/2024 | 10:AM",
        "endDate": "10/Mar/2024 | 10:AM",
      },
      {
        "planId": "002",
        "vehId": "0030",
        "planName": "weekly-600",
        "planAmount": "4600",
        "vehModel": "Honda City",
        "planValidity": 30,
        "remainingDays": 0,
        "validityType": "Monthly",
        "startDate": "10/Feb/2024 | 10:AM",
        "endDate": "10/Mar/2024 | 10:AM",
      },
    ]
  };

  Future<SubscriptionDriverModel?> fetchDriverSubscription() async {
    // String driverSubscriptionUrl = '';

    try {
      // Response response = await dio.get(driverSubscriptionUrl);

      int statusCode = 200;
      if (statusCode == 200) {
        dynamic data = driverSubscription;

        SubscriptionDriverModel subscriptionDriverDetails =
            SubscriptionDriverModel.fromJson(data);
        return subscriptionDriverDetails;
      } else {
        return null;
      }
    } catch (e) {
      log("Error : $e");
      return null;
    }
  }
}
