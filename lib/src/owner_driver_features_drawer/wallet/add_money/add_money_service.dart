import 'dart:developer';
import '../../../../imports.dart';

class AddMoneyService {
  Dio dio = Dio();
  String addMoneyWalletUrl = '';

  Future<Map<String, dynamic>?> addMoneyWallet(int amount) async {
    try {
      // Response response = await dio.post(addMoneyWalletUrl);
      int statusCode = 200;
      if (statusCode == 200) {
        dynamic data = {
          "status": true,
          "message": "Money added to wallet successfully"
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
