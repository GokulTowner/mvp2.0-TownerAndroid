import 'dart:developer';

import '../../../../imports.dart';

class TransactionService {
  Map<String, dynamic> transactionHistory = {
    "transactions": [
      {
        "title": "Paid - ID:ABC2356",
        "subtitle": "Swaminathan - 987632156",
        "trailingTitle": "₹ 300.00",
        "trailingIcon": "Icons.arrow_forward_ios",
        "dateTime": "30 May 22 | 11:30 AM",
        "status": "Successful"
      },
      {
        "title": "Paid - ID:DEF7890",
        "subtitle": "Rajesh - 987654321",
        "trailingTitle": "₹ 450.00",
        "trailingIcon": "Icons.arrow_forward_ios",
        "dateTime": "29 May 22 | 10:00 AM",
        "status": "Successful"
      },
      {
        "title": "Paid - ID:GHI1234",
        "subtitle": "Priya - 876543210",
        "trailingTitle": "₹ 200.00",
        "trailingIcon": "Icons.arrow_forward_ios",
        "dateTime": "28 May 22 | 09:15 AM",
        "status": "Failed"
      },
      {
        "title": "Paid - ID:JKL5678",
        "subtitle": "Anita - 765432109",
        "trailingTitle": "₹ 600.00",
        "trailingIcon": "Icons.arrow_forward_ios",
        "dateTime": "27 May 22 | 08:45 AM",
        "status": "Successful"
      },
      {
        "title": "Paid - ID:MNO9012",
        "subtitle": "Vikram - 654321098",
        "trailingTitle": "₹ 750.00",
        "trailingIcon": "Icons.arrow_forward_ios",
        "dateTime": "26 May 22 | 08:30 AM",
        "status": "Failed"
      },
      {
        "title": "Paid - ID:PQR3456",
        "subtitle": "Divya - 543210987",
        "trailingTitle": "₹ 500.00",
        "trailingIcon": "Icons.arrow_forward_ios",
        "dateTime": "25 May 22 | 07:15 AM",
        "status": "Successful"
      },
      {
        "title": "Paid - ID:STU7890",
        "subtitle": "Kumar - 432109876",
        "trailingTitle": "₹ 400.00",
        "trailingIcon": "Icons.arrow_forward_ios",
        "dateTime": "24 May 22 | 06:50 AM",
        "status": "Successful"
      },
      {
        "title": "Paid - ID:VWX1234",
        "subtitle": "Ravi - 321098765",
        "trailingTitle": "₹ 300.00",
        "trailingIcon": "Icons.arrow_forward_ios",
        "dateTime": "23 May 22 | 05:30 AM",
        "status": "Failed"
      },
      {
        "title": "Paid - ID:YZA5678",
        "subtitle": "Suresh - 210987654",
        "trailingTitle": "₹ 1000.00",
        "trailingIcon": "Icons.arrow_forward_ios",
        "dateTime": "22 May 22 | 05:00 AM",
        "status": "Successful"
      },
      {
        "title": "Paid - ID:BCD9012",
        "subtitle": "Mohan - 109876543",
        "trailingTitle": "₹ 850.00",
        "trailingIcon": "Icons.arrow_forward_ios",
        "dateTime": "21 May 22 | 04:45 AM",
        "status": "Successful"
      }
    ]
  };
  String transactionHistoryUrl = '';
  Dio dio = Dio();

  Future<TransactionHistoryModel?> fetchTransactionHistory() async {
    try {
      // Response response = await dio.get(transactionHistoryUrl);

      int statusCode = 200;

      if (statusCode == 200) {
        dynamic data = transactionHistory;
        TransactionHistoryModel transactionHistoryData =
            TransactionHistoryModel.fromJson(data);
        return transactionHistoryData;
      } else {
        return null;
      }
    } catch (e) {
      log('Error : $e');
      return null;
    }
  }
}
