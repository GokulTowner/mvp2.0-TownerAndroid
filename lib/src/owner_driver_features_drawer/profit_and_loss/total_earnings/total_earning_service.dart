import 'dart:developer';
import '../../../../imports.dart';

class TotalEarningsService {
  static Map<String, dynamic> totalEarningsData = {
    "cashEarnings": 1000.00,
    "walletEarnings": 300.00,
    "transctions": [
      {
        "transactionId": "TX123456",
        "amount": 500.00,
        "dateAndTime": "08-06-2024 | 12:34 PM",
        "gst": 50.00,
        "status": "trip income",
        "paymentMode": "cash"
      },
      {
        "transactionId": "TX123457",
        "amount": 750.00,
        "dateAndTime": "08-06-2024 | 02:20 PM",
        "gst": 75.00,
        "status": "wallet",
        "paymentMode": "wallet"
      },
      {
        "transactionId": "TX123458",
        "amount": 1000.00,
        "dateAndTime": "08-06-2024 | 04:15 PM",
        "gst": 100.00,
        "status": "towner coins",
        "paymentMode": "cash"
      },
      {
        "transactionId": "TX123459",
        "amount": 250.00,
        "dateAndTime": "08-06-2024 | 06:50 PM",
        "gst": 25.00,
        "status": "trip income",
        "paymentMode": "wallet"
      },
      {
        "transactionId": "TX123460",
        "amount": 1200.00,
        "dateAndTime": "08-06-2024 | 08:30 PM",
        "gst": 120.00,
        "status": "wallet",
        "paymentMode": "cash"
      }
    ]
  };

  String profitAndLossUrl = '';
  Dio dio = Dio();

  Future<TotalEarningsModel?> fetchProfitAndLoss() async {
    try {
      // Response response = await dio.get(profitAndLossUrl);

      int statusCode = 200;
      if (statusCode == 200) {
        dynamic totalEar = totalEarningsData;

        TotalEarningsModel totolEarningsModel =
            TotalEarningsModel.fromJson(totalEar);
        return totolEarningsModel;
      } else {
        return null;
      }
    } catch (e) {
      log("Error : $e");
      return null;
    }
  }
}
