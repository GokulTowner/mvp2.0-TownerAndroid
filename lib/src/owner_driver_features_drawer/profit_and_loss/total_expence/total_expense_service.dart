import 'dart:developer';
import '../../../../imports.dart';

class TotalExpendituresService {
  static Map<String, dynamic> totalExpendituresData = {
    "totalExpenditures": 1500,
    "transctions": [
      {
        "transactionId": "TX123456",
        "amount": 300.00,
        "dateAndTime": "08-06-2024 | 12:34 PM",
        "gst": 30.00,
        "status": "trip expense",
        "paymentMode": "cash",
        "withGstBill": true
      },
      {
        "transactionId": "TX123457",
        "amount": 450.00,
        "dateAndTime": "08-06-2024 | 02:20 PM",
        "gst": 0.00,
        "status": "repair",
        "paymentMode": "wallet",
        "withGstBill": false
      },
      {
        "transactionId": "TX123458",
        "amount": 200.00,
        "dateAndTime": "08-06-2024 | 04:15 PM",
        "gst": 20.00,
        "status": "maintenance",
        "paymentMode": "cash",
        "withGstBill": true
      },
      {
        "transactionId": "TX123459",
        "amount": 350.00,
        "dateAndTime": "08-06-2024 | 06:50 PM",
        "gst": 0.0,
        "status": "fuel",
        "paymentMode": "wallet",
        "withGstBill": false
      },
      {
        "transactionId": "TX123460",
        "amount": 200.00,
        "dateAndTime": "08-06-2024 | 08:30 PM",
        "gst": 20.00,
        "status": "trip expense",
        "paymentMode": "cash",
        "withGstBill": true
      }
    ]
  };

  String totalExpenditureUrl = '';
  Dio dio = Dio();
  Future<TotalExpendituresModel?> fetchTotalExpenditure() async {
    try {
      int statusCode = 200;
      if (statusCode == 200) {
        dynamic expenseDetails = totalExpendituresData;
        TotalExpendituresModel totalExpendituresModel =
            TotalExpendituresModel.fromJson(expenseDetails);
        return totalExpendituresModel;
      } else {
        return null;
      }
    } catch (e) {
      log('Error $e');
      return null;
    }
  }
}
