class TransactionExpense {
  String transactionId;
  double amount;
  String dateAndTime;
  double gst;
  String status;
  String paymentMode;
  bool withGstBill;

  TransactionExpense({
    required this.transactionId,
    required this.amount,
    required this.dateAndTime,
    required this.gst,
    required this.status,
    required this.paymentMode,
    required this.withGstBill,
  });

  factory TransactionExpense.fromJson(Map<String, dynamic> json) {
    return TransactionExpense(
      transactionId: json['transactionId'],
      amount: json['amount'].toDouble(),
      dateAndTime: json['dateAndTime'],
      gst: json['gst'].toDouble(),
      status: json['status'],
      paymentMode: json['paymentMode'],
      withGstBill: json['withGstBill'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transactionId': transactionId,
      'amount': amount,
      'dateAndTime': dateAndTime,
      'gst': gst,
      'status': status,
      'paymentMode': paymentMode,
      'withGstBill': withGstBill,
    };
  }
}

class TotalExpendituresModel {
  double totalExpenditures;
  List<TransactionExpense> transactions;

  TotalExpendituresModel({
    required this.totalExpenditures,
    required this.transactions,
  });

  factory TotalExpendituresModel.fromJson(Map<String, dynamic> json) {
    var list = json['transctions'] as List;
    List<TransactionExpense> transactionsList =
        list.map((i) => TransactionExpense.fromJson(i)).toList();

    return TotalExpendituresModel(
      totalExpenditures: json['totalExpenditures'].toDouble(),
      transactions: transactionsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalExpenditures': totalExpenditures,
      'transctions': transactions.map((i) => i.toJson()).toList(),
    };
  }
}
