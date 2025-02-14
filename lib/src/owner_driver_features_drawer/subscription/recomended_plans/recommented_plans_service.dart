import 'dart:developer';
import '../../../../imports.dart';

class RecommentedService {
  List<Map<String, dynamic>> subscriptionPlans = [
    {
      "planId": "001",
      "planName": "1 Day Pack",
      "subAmount": "200",
      "validity": "1",
      "description": "It's a trial pack for a day",
      "subBenefits": [
        'ITR filing',
        'Online Payment',
        'Online Booking',
      ]
    },
    {
      "planId": "002",
      "planName": "Weekly Pack",
      "subAmount": "1100",
      "validity": "7",
      "description": "It's a trial pack for a week",
      "subBenefits": [
        'ITR filing',
        'Online Payment',
        'Online Booking',
      ]
    },
    {
      "planId": "003",
      "planName": "Monthly Pack",
      "subAmount": "4500",
      "validity": "30",
      "description": "It's a trial pack for a month",
      "subBenefits": [
        'ITR filing',
        'Online Payment',
        'Online Booking',
      ]
    }
  ];

  Dio dio = Dio();
  String recommentedPlansUrl = '';

  Future<List<RecommentedPlansModel>?> fetchRecommentPlans() async {
    try {
      // Response response = await dio.get(recommentedPlansUrl);

      int statusCode = 200;
      if (statusCode == 200) {
        List<dynamic> data = subscriptionPlans;

        List<RecommentedPlansModel> recommentedPlans =
            data.map((data) => RecommentedPlansModel.fromJson(data)).toList();

        return recommentedPlans;
      }
    } catch (e) {
      log('Error : $e');
      return null;
    }
    return null;
  }

  Future<Map<String, dynamic>?> addPlan(AddPlanModel model) async {
    // String addPlanUrl = '';
    try {
      // Response response = await dio.post(addPlanUrl, data: model);
      int statusCode = 200;
      if (statusCode == 200) {
        dynamic data = {
          "status": true,
          "message": "Your subscription added successfully"
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
