import 'dart:developer';
import '../../../imports.dart';

class ForgotPasswordService {
  Dio dio = Dio();

  String forgotPasswordUrl = AppConstantUrl.forgotPasswordUrl;

  Future<Map<String, dynamic>?> postforgotPassword(
      ForgotPasswordModel data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(tToken);
    // if (token == null) return null;

    log('Token in forgot password : $token');

    try {
      // Response response = await dio.post(
      //   forgotPasswordUrl,
      //   data: data.toJson(),
      //   options: Options(
      //     headers: {
      //       'Authorization': 'Bearer $token',
      //     },
      //   ),
      // );

      log('Data .tojson ${data.toJson()}');

      int statusCode = 200;
      if (statusCode == 200) {
        dynamic data = {
          "status": true,
          "message": "Number submit successfully"
        };
        return data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
