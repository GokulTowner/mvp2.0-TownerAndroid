// ignore_for_file: unused_local_variable
import 'dart:developer';
import 'package:townerapp/config/app_base_url.dart';
import 'package:townerapp/config/app_end_url.dart';

import '../../../imports.dart';

class LoginService {
  Dio dio = Dio();

  Future<Map<String, dynamic>?> postLoginRequest(
      LoginModel data, bool isOwner) async {
    String loginUrl = BaseUrl.baseUrl + EndUrl.ownerLoginUrl;
    const String apiUrl = AppConstantUrl.loginUrl;
    try {
      // Response response = await ApiHelper().postRequest(
      //   url: loginUrl,
      //   data: data.toJson(),
      // );

      // log('status code : ${response.statusCode} ${response.data}');

      int? statusCode;

      if (data.mobile == '8907444333' && data.password == 'dev@123') {
        statusCode = 200;
      } else {
        statusCode = 400;
      }

      if (statusCode == 200) {
        //handle the login
        // List<dynamic> loginData = [];
        // bool? status = response.data['status'];
        // String? token = response.data['token'];
        // loginData.add(token);
        // loginData.add(status);

        dynamic loginResponseDriver = {
          "status": true,
          "token": "sddhfhy97rh79rfh937987ryf98r327hhew83",
          "userData": {
            "ownerId": "0001",
            "driverId": "002",
            "name": "John Scaria",
            "phoneNumber": "9495988432",
            "rating": "4.4",
            "image":
                "https://www.habbaspilaw.com/wp-content/uploads/2015/11/bigstock-Portrait-Taxi-Driver-Smile-Car-71892247.jpg",
            "vehNumber": "KL-59-H-2923",
            "vehType": "Sedan",
            "docPercentage": .43
          }
        };

        dynamic loginResponseOwner = {
          "status": true,
          "token": "sddhfhy97rh79rfh937987ryf98r327hhew83",
          "userData": {
            "ownerId": "0003",
            "name": "Kevin Kennady",
            "phoneNumber": "8900444333",
            "docPercentage": .75,
            "totalVeh": 6,
            "totalDriver": 5,
            "image":
                "https://img.freepik.com/premium-photo/portrait-male-business-owner-showing-happy-smiling-face-as-he-has-successfully-invested-his-business-using-computers-financial-budget-documents-work_89286-655.jpg",
            "businessLogo":
                "https://i.pinimg.com/originals/42/e2/00/42e200a20c2344c7e16b15efb2704d3b.jpg",
            "agencyName": "Safari Travels",
          }
        };

        // bool? status = loginResponse[tStatus];
        // String? token = loginResponse[tToken];
        // loginData.add(token);
        // loginData.add(status);

        return isOwner == true ? loginResponseOwner : loginResponseDriver;
      } else {
        // throw handleDioError(
        //     DioException(response: response, requestOptions: RequestOptions()));
        return null;
      }
    } catch (e) {
      log('Error $e');
      return null;
    }
  }
}
