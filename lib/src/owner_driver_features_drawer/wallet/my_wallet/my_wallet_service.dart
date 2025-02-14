import 'dart:developer';
import '../../../../imports.dart';

class WalletService {
  final Map<String, dynamic> walletDetails = {
    "wallet": {
      "id": "WALLET123",
      "totalAmount": "₹ 12000.00",
      "currency": "INR",
      "history": [
        {
          "id": "ABC123456",
          "amount": "₹ 300.00",
          "status": "Successful",
          "date": "30 May 22",
          "time": "11:30 AM"
        },
        {
          "id": "ABC123457",
          "amount": "₹ 500.00",
          "status": "Successful",
          "date": "29 May 22",
          "time": "10:30 AM"
        },
        {
          "id": "ABC123458",
          "amount": "₹ 100.00",
          "status": "Failed",
          "date": "28 May 22",
          "time": "09:30 AM"
        }
      ]
    }
  };

  final Dio dio = Dio();

  Future<WalletModel?> fetchWalletDetails() async {
    try {
      // Simulate fetching data from a network request
      // Response response = await dio.get(welcomeBonusUrl);

      int statusCode = 200;

      if (statusCode == 200) {
        dynamic data = walletDetails;
        WalletModel walletData = WalletModel.fromJson(data);
        return walletData;
      } else {
        return null;
      }
    } catch (e) {
      log('Error : $e');
      return null;
    }
  }
}
