class Transactions {
  final String title;
  final String subtitle;
  final String trailingTitle;
  final String trailingIcon;
  final String dateTime;
  final String status;

  Transactions({
    required this.title,
    required this.subtitle,
    required this.trailingTitle,
    required this.trailingIcon,
    required this.dateTime,
    required this.status,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) {
    return Transactions(
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      trailingTitle: json['trailingTitle'] ?? '',
      trailingIcon: json['trailingIcon'] ?? '',
      dateTime: json['dateTime'] ?? '',
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'trailingTitle': trailingTitle,
      'trailingIcon': trailingIcon,
      'dateTime': dateTime,
      'status': status,
    };
  }
}

class TransactionHistoryModel {
  final List<Transactions> transactions;

  TransactionHistoryModel({
    required this.transactions,
  });

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) {
    var list = json['transactions'] as List? ?? [];
    List<Transactions> transactionsList =
        list.map((i) => Transactions.fromJson(i)).toList();

    return TransactionHistoryModel(
      transactions: transactionsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transactions':
          transactions.map((transaction) => transaction.toJson()).toList(),
    };
  }
}
