class RecommentedPlansModel {
  String planId;
  String planName;
  String subAmount;
  String validity;
  String description;
  List<String>? subBenefits;

  RecommentedPlansModel({
    required this.planId,
    required this.planName,
    required this.subAmount,
    required this.validity,
    required this.description,
    this.subBenefits,
  });

  factory RecommentedPlansModel.fromJson(Map<String, dynamic> json) {
    return RecommentedPlansModel(
      planId: json['planId'],
      planName: json['planName'],
      subAmount: json['subAmount'],
      validity: json['validity'],
      description: json['description'],
      subBenefits: List<String>.from(json['subBenefits']),
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'planName': planName,
  //     'subAmount': subAmount,
  //     'validity': validity,
  //     'description': description,
  //     'subBenefits': subBenefits,
  //   };
  // }
}
