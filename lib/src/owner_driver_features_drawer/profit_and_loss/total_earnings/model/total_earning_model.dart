class TransactionDetails {
  String transactionId;
  double amount;
  String dateAndTime;
  double gst;
  String status;
  String paymentMode;

  TransactionDetails({
    this.transactionId = '',
    this.amount = 0.0,
    this.dateAndTime = '',
    this.gst = 0.0,
    this.status = '',
    this.paymentMode = '',
  });

  factory TransactionDetails.fromJson(Map<String, dynamic> json) {
    return TransactionDetails(
      transactionId: json['transactionId'] ?? '',
      amount: (json['amount'] ?? 0.0).toDouble(),
      dateAndTime: json['dateAndTime'] ?? '',
      gst: (json['gst'] ?? 0.0).toDouble(),
      status: json['status'] ?? '',
      paymentMode: json['paymentMode'] ?? '',
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
    };
  }
}

class TotalEarningsModel {
  double cashEarnings;
  double walletEarnings;
  List<TransactionDetails> transctions;

  TotalEarningsModel({
    this.cashEarnings = 0.0,
    this.walletEarnings = 0.0,
    this.transctions = const [],
  });

  factory TotalEarningsModel.defaultSettings() {
    return TotalEarningsModel(
      cashEarnings: 0.0,
      walletEarnings: 0.0,
      transctions: [],
    );
  }

  factory TotalEarningsModel.fromJson(Map<String, dynamic> json) {
    var list = json['transctions'] as List;
    List<TransactionDetails> transactionsList =
        list.map((i) => TransactionDetails.fromJson(i)).toList();

    return TotalEarningsModel(
      cashEarnings: (json['cashEarnings'] ?? 0.0).toDouble(),
      walletEarnings: (json['walletEarnings'] ?? 0.0).toDouble(),
      transctions: transactionsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cashEarnings': cashEarnings,
      'walletEarnings': walletEarnings,
      'transctions': transctions.map((i) => i.toJson()).toList(),
    };
  }
}
