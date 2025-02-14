import 'dart:developer';
import '../../../imports.dart';

class BusinessAnalyticsService {
  Map<String, dynamic> businessAnalytics = {
    "totalTrips": [
      {
        "acceptedTrips": {
          "label": "Accepted Trips",
          "count": 2000,
          "color": "#31b539"
        },
      },
      {
        "rejectedTrips": {
          "label": "Rejected Trips",
          "count": 800,
          "color": "#ff0000"
        },
      },
    ],
    "pymntTypeOvrvw": [
      {
        "myWallet": {
          "label": "Online",
          "hours": 75,
          "color": "#31b539",
        },
      },
      {
        "payCash": {
          "label": "Offline",
          "hours": 20,
          "color": "#ff0000",
        },
      },
      {
        "other": {
          "label": "Offline",
          "hours": 5,
          "color": "#31b539",
        },
      }
    ],
    "totalWorkingHours": [
      {
        "online": {
          "label": "Online",
          "hours": 500,
          "color": "#31b539",
        },
      },
      {
        "offline": {
          "label": "Offline",
          "hours": 200,
          "color": "#ff0000",
        },
      }
    ]
  };

  Dio dio = Dio();
  String businessAnalyticsUrl = '';

  Future<BusinessAnalyticsModel?> fetchBusinessAnalytic() async {
    try {
      // Response response = await dio.get(businessAnalyticsUrl);

      int statusCode = 200;
      if (statusCode == 200) {
        dynamic data = businessAnalytics;
        BusinessAnalyticsModel businessAnalyticsModel =
            BusinessAnalyticsModel.fromJson(data);
        return businessAnalyticsModel;
      } else {
        throw (Exception('Something went wrong'));
      }
    } catch (e) {
      log('Error : $e');
      throw (Exception('Something went wrong'));
    }
  }
}
