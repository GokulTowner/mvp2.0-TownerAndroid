import 'dart:developer';
import '../../../../imports.dart';

class BuySubscriptionService {
  final List<Map<String, dynamic>> vehicleDetailsForSubscriptionList = [
    // {
    //   "vehicleId": "1",
    //   "vehicleNumber": "KL-44-J-6533",
    //   "vehicleModel": "Honda City",
    //   "driver": "Ajeesh",
    //   "subValidity": "1",
    //   "isChecked": false,
    //   "selectedSubscription": 'sub_1day',
    //   "currentSubscription": "daily"
    // },
    // {
    //   "vehicleId": "2",
    //   "vehicleNumber": "KL-44-J-6533",
    //   "vehicleModel": "Toyota Yaris",
    //   "driver": "John",
    //   "subValidity": "1",
    //   "isChecked": false,
    //   "selectedSubscription": 'sub_1day',
    //   "currentSubscription": "daily"
    // },
    // {
    //   "vehicleId": "3",
    //   "vehicleNumber": "KL-44-J-6533",
    //   "vehicleModel": "Ford EcoSport",
    //   "driver": "Alice",
    //   "subValidity": "6",
    //   "isChecked": false,
    //   "selectedSubscription": 'sub_weekly',
    //   "currentSubscription": "weekly"
    // },

    //************************************************* */
    // {
    //   "vehicleId": "4",
    //   "vehicleNumber": "KL-44-J-6533",
    //   "vehicleModel": "Hyundai Verna",
    //   "driver": "David",
    //   "subValidity": "1",
    //   "isChecked": false,
    //   "selectedSubscription": 'sub_monthly',
    //   "currentSubscription": "daily"
    // },
    // {
    //   "vehicleId": "5",
    //   "vehicleNumber": "KL-44-J-6533",
    //   "vehicleModel": "Volkswagen Polo",
    //   "driver": "Emily",
    //   "subValidity": "7",
    //   "isChecked": false,
    //   "selectedSubscription": 'sub_weekly',
    //   "currentSubscription": "weekly"
    // },
    // {
    //   "vehicleId": "6",
    //   "vehicleNumber": "KL-44-J-6533",
    //   "vehicleModel": "Honda",
    //   "driver": "Michael",
    //   "subValidity": "26",
    //   "isChecked": false,
    //   "selectedSubscription": 'sub_monthly',
    //   "currentSubscription": "monthly"
    // },
    // {
    //   "vehicleId": "7",
    //   "vehicleNumber": "KL-44-J-6533",
    //   "vehicleModel": "Toyota Yaris",
    //   "driver": "Sophia",
    //   "subValidity": "4",
    //   "isChecked": false,
    //   "selectedSubscription": 'sub_weekly',
    //   "currentSubscription": "weekly"
    // },
    // {
    //   "vehicleId": "8",
    //   "vehicleNumber": "KL-44-J-6533",
    //   "vehicleModel": "Ford EcoSport",
    //   "driver": "Olivia",
    //   "subValidity": "9",
    //   "isChecked": false,
    //   "selectedSubscription": 'sub_monthly',
    //   "currentSubscription": "monthly"
    // },

    //****************************************************
    {
      "vehicleId": "9",
      "vehicleNumber": "KL-44-J-6533",
      "vehicleModel": "Hyundai Verna",
      "driver": "William",
      "subValidity": "3",
      "isChecked": false,
      "selectedSubscription": {
        "id": "not_selected",
        "name": "No Subscription",
        "price": 0.00
      },
      "currentSubscription": {
        "id": "sub_weekly",
        "name": "weekly",
        "price": 600.00
      },
    },

    {
      "vehicleId": "10",
      "vehicleNumber": "KL-44-J-6533",
      "vehicleModel": "Volkswagen Polo",
      "driver": "Daniel",
      "subValidity": "15",
      "isChecked": false,
      "selectedSubscription": {
        "id": "not_selected",
        "name": "No Subscription",
        "price": 0.00
      },
      "currentSubscription": {
        "id": "sub_monthly",
        "name": "monthly",
        "price": 1600.00
      },
    },
  ];

  final Map<String, double> subscriptionDetails = {
    "1day": 200,
    "weekly": 500,
    "monthly": 1600,
  };

  final List<Map<String, dynamic>> subscriptionDetails1 = [
    {
      "id": "not_selected",
      "name": "No Subscription",
      "price": 0.00,
    },
    {
      "id": "sub_1day",
      "name": "1day",
      "price": 200.00,
    },
    {
      "id": "sub_weekly",
      "name": "weekly",
      "price": 600.00,
    },
    {
      "id": "sub_monthly",
      "name": "monthly",
      "price": 1600.00,
    }
  ];

  String subscriptionVehicleListUrl = '';
  String subscriptionDetailsUrl = '';
  Dio dio = Dio();

  Future<List<VehicleDetailsSubscriptionModel>?>
      fetchSubscriptionListVehicleDetails() async {
    try {
      // Response response = await dio.get(subscriptionVehicleListUrl);

      int response = 200;
      if (response == 200) {
        List<VehicleDetailsSubscriptionModel> result =
            vehicleDetailsForSubscriptionList
                .map((json) => VehicleDetailsSubscriptionModel.fromJson(json))
                .toList();
        return result;
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  List<SubscriptionPlan> parseSubscriptionDetails(
      List<Map<String, dynamic>> details) {
    return details.map((detail) => SubscriptionPlan.fromJson(detail)).toList();
  }

  Future<List<SubscriptionPlan>?> fetchSubscriptionDetails() async {
    try {
      // Response response = await dio.get(subscriptionVehicleListUrl);

      int response = 200;
      if (response == 200) {
        List<Map<String, dynamic>> subscriptionDetail = subscriptionDetails1;
        List<SubscriptionPlan> subscriptionPlans =
            subscriptionDetail.map((detail) {
          return SubscriptionPlan.fromJson(detail);
        }).toList();

        return subscriptionPlans;
      } else {
        return null;
      }
    } catch (e) {
      log('Error : $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> addSubscription(
      SubscriptionRequestModel data) async {
    log('Add Subscription : ${data.toJson()}');
    // String subscriptionRequestUrs = "";
    // Dio dio = Dio();

    try {
      // Response response = await dio.post(
      //   subscriptionRequestUrs,
      //   data: data.toJson(),
      // );
      int statusCode = 200;
      if (statusCode == 200) {
        Map<String, dynamic> result = {
          "status": true,
          "massege": "Subscription added successfully"
        };
        return result;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}

// Map<String, dynamic> sampleJson = {
//   "traAgId": "001",
//   "totalAmount": 2000,
//   "subscriptions": [
//     {
//       "vehId": "002",
//       "planId": "weekly_01",
//       "planAmount": 200,
//     }
//   ]
// };
