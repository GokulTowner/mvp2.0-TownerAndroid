import 'dart:developer';
import '../../../imports.dart';

class OtpVarificationService {
  Dio dio = Dio();
  String otpSubmitUrl = AppConstantUrl.otpUrl;

  Future<dynamic>? postOtp(String userId, String otp) async {
    try {
      // Response response = await dio.post(
      //   otpSubmitUrl,
      //   data: {"id": userId, "otp": otp},
      // );

      int statusCode = 200;
      if (statusCode == 200) {
        dynamic result = {
          "status ": true,
          "message": "otp verified successfully"
        };
        return result;
      } else {
        dynamic result = {
          "status ": false,
          "message": "otp not verified successfully"
        };
        return result;
      }
    } catch (e) {
      log('Error on otp : $e');
      return null;
    }
  }

  Future<dynamic>? resentOtp(
      String userId, String mobileNumber, String appSingnature) async {
    try {
      // Response response = await dio.post(
      //   otpSubmitUrl,
      //   data: {"userId": userId, "mobileNumber": mobileNumber},
      // );

      int statusCode = 200;
      if (statusCode == 200) {
        dynamic result = {
          "status ": true,
          "message": "otp resent successfully"
        };
        return result;
      } else {
        dynamic result = {
          "status ": false,
          "message": "otp not resent successfully"
        };
        return result;
      }
    } catch (e) {
      log('Error on otp : $e');
      return null;
    }
  }
}
