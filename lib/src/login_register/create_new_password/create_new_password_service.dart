import 'dart:developer';
import '../../../imports.dart';

class CreateNewPasswordService {
  Dio dio = Dio();
  String createNewPassword = AppConstantUrl.createNewPasswordUrl;

  Future<dynamic>? postNewCreatePassword(
      bool isOwner, String password, String userId) async {
    try {
      // Response response = await dio.post(
      //   createNewPasswordUrl,
      //   data: {"isOwner": isOwner, "password": password,"userId":userId},
      // );

      int statusCode = 200;

      if (statusCode == 200) {
        dynamic data = {
          "status": true,
          "message": "New password created successfully"
        };

        return data;
      } else {
        dynamic data = {"status": false, "message": "Cant't creagte password"};
        return data;
      }
    } catch (e) {
      log('Error  : $e');
      return null;
    }
  }
}
