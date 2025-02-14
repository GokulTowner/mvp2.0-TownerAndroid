import 'dart:developer';
import '../../../imports.dart';

class CreateAccountService {
  Dio dio = Dio();

  Future<Map<String, dynamic>?> createAccountService(
      CreateAccountModel data) async {
    // String createAccountUrl = '';
    log('create account : ${data.toJson()}');
    try {
      // Response response = await Dio().post(
      //   createAccountUrl,
      //   data: data.toJson(),
      // );

      int statusCode = 200;
      log('Create account data : ${data.toJson()}');
      if (statusCode == 200) {
        log('Data sent successfully!');
        // log(response.data);
        // bool status = response.data['status'];

        Map<String, dynamic> status = {
          'status': true,
          'message': 'Data submitted successfully',
        };

        return status;
      } else {
        // log('Failed to send data with status code: ${response.statusCode}');
        // log(response.data);
        // logger.d('logger : ${response.data}');
        return null;
      }
    } catch (e) {
      // Handle error if any
      // log('Error occurred: $e');
      // logger.d('logger Error on Catch: $e');
      return null;
    }
  }
}
