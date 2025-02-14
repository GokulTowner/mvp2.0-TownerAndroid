class ReferralBonusModel {
  final String bonusId;
  final String bonusName;
  final int bonusAmount;
  final String description;
  final String status;
  final String dateTime;

  ReferralBonusModel({
    required this.bonusId,
    required this.bonusName,
    required this.bonusAmount,
    required this.description,
    required this.status,
    required this.dateTime,
  });

  factory ReferralBonusModel.fromJson(Map<String, dynamic> json) {
    return ReferralBonusModel(
      bonusId: json['bonusId'],
      bonusName: json['bounsName'],
      bonusAmount: json['bonusAmount'],
      description: json['discription'],
      status: json['status'],
      dateTime: json['dateTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bonusId': bonusId,
      'bounsName': bonusName,
      'bonusAmount': bonusAmount,
      'discription': description,
      'status': status,
      'dateTime': dateTime,
    };
  }
}
