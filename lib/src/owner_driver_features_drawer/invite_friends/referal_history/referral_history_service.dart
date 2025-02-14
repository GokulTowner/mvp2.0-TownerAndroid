import 'dart:developer';
import '../../../../imports.dart';

class ReferHistoryService {
  Map<String, dynamic> referHistoryData = {
    "totalBalance": "₹500",
    "referName": "Sandeep",
    "referDate": "May 30,2024",
    "referTime": "04.00 PM",
    "referStatus": "Accepted",
    "referCode": "546789",
    "referType": "Rider",
    "referralAmount": "75",
  };

  Dio dio = Dio();
  String referHistoryUrl = 'api/refer_history';

  Future<ReferHistoryModel?> fetchReferHistoryData() async {
    try {
      // Response response = await dio.get(referHistoryUrl);
      int statuscode = 200;
      if (statuscode == 200) {
        dynamic result = ReferHistoryModel.fromJson(referHistoryData);
        return result;
      } else {
        throw Exception('Failed to fetch refer history data');
      }
    } catch (e) {
      log('Error fetching refer history data: $e');
      return null;
    }
  }
}
