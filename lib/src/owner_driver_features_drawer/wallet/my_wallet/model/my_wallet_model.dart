class WalletModel {
  final String id;
  final String totalAmount;
  final String currency;
  final List<Transaction> history;

  WalletModel({
    required this.id,
    required this.totalAmount,
    required this.currency,
    required this.history,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    var historyList = json['wallet']['history'] as List? ?? [];
    List<Transaction> transactions =
        historyList.map((i) => Transaction.fromJson(i)).toList();

    return WalletModel(
      id: json['wallet']['id'] ?? '',
      totalAmount: json['wallet']['totalAmount'] ?? '',
      currency: json['wallet']['currency'] ?? '',
      history: transactions,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'wallet': {
        'id': id,
        'totalAmount': totalAmount,
        'currency': currency,
        'history': history.map((transaction) => transaction.toJson()).toList(),
      }
    };
  }
}

class Transaction {
  final String id;
  final String amount;
  final String status;
  final String date;
  final String time;

  Transaction({
    required this.id,
    required this.amount,
    required this.status,
    required this.date,
    required this.time,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] ?? '',
      amount: json['amount'] ?? '',
      status: json['status'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'status': status,
      'date': date,
      'time': time,
    };
  }
}
