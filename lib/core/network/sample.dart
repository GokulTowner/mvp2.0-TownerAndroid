import 'dart:developer';
import 'package:townerapp/config/app_base_url.dart';
import 'package:townerapp/config/app_end_url.dart';
import '../../../imports.dart';

class LoginService {
  final Dio _dio;

  LoginService(this._dio);

  Future<Map<String, dynamic>> postLoginRequest(
      LoginModel data, bool isOwner) async {
    String loginUrl = BaseUrl.baseUrl + EndUrl.ownerLoginUrl;

    try {
      // Simulating API call with dummy logic
      Map<String, dynamic>? response;
      if (data.mobile == '1111111111' && data.password == '1') {
        response = isOwner ? _dummyOwnerResponse() : _dummyDriverResponse();
      } else {
        // Simulate a bad response
        throw DioException(
            requestOptions: RequestOptions(path: loginUrl),
            response: Response(
                statusCode: 400,
                requestOptions: RequestOptions(path: loginUrl),
                data: {'message': 'Invalid credentials'}),
            type: DioExceptionType.badResponse);
      }

      if (response != null) {
        return response;
      } else {
        throw DioException(
          requestOptions: RequestOptions(path: loginUrl),
          response: Response(
              statusCode: 404,
              requestOptions: RequestOptions(path: loginUrl),
              data: {'message': 'User not found'}),
          type: DioExceptionType.badResponse,
        );
      }
    } on DioException catch (e) {
      log('DioException: $e');
      throw handleDioError(e);
    } catch (e) {
      log('Unexpected error: $e');
      throw handleError(e.toString());
    }
  }

  Map<String, dynamic> _dummyDriverResponse() {
    return {
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
        "docPercentage": 0.43
      }
    };
  }

  Map<String, dynamic> _dummyOwnerResponse() {
    return {
      "status": true,
      "token": "sddhfhy97rh79rfh937987ryf98r327hhew83",
      "userData": {
        "ownerId": "0003",
        "name": "Kevin Kennady",
        "phoneNumber": "8900444333",
        "docPercentage": 0.75,
        "totalVeh": 6,
        "totalDriver": 5,
        "image":
            "https://img.freepik.com/premium-photo/portrait-male-business-owner-showing-happy-smiling-face-as-he-has-successfully-invested-his-business-using-computers-financial-budget-documents-work_89286-655.jpg",
        "businessLogo":
            "https://i.pinimg.com/originals/42/e2/00/42e200a20c2344c7e16b15efb2704d3b.jpg",
        "agencyName": "Safari Travels",
      }
    };
  }
}
