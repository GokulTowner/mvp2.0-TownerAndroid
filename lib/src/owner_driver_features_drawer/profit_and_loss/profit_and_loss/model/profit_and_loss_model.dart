class ProfitAndLossModel {
  String totalEarnings;
  String totalExpenditure;

  // Default constructor
  ProfitAndLossModel(
      {required this.totalEarnings, required this.totalExpenditure});

  // Factory constructor for creating a new instance from a map
  factory ProfitAndLossModel.fromJson(Map<String, dynamic> json) {
    return ProfitAndLossModel(
      totalEarnings: json['totalEarnings'],
      totalExpenditure: json['totalExpenditure'],
    );
  }

  // Method to convert an instance to a map
  Map<String, dynamic> toJson() {
    return {
      'totalEarnings': totalEarnings,
      'totalExpenditure': totalExpenditure,
    };
  }

  // Method to calculate net profit/loss
  String calculateNetProfitOrLoss() {
    double earnings = double.parse(totalEarnings);
    double expenditure = double.parse(totalExpenditure);
    double netProfitOrLoss = earnings - expenditure;

    return netProfitOrLoss.toString();
  }
}
