class AddPlanModel {
  final String vehicleId;
  final String planId;
  final String planAmount;

  AddPlanModel({
    required this.vehicleId,
    required this.planId,
    required this.planAmount,
  });

  // Factory method to create an AddPlanModel from a JSON object
  factory AddPlanModel.fromJson(Map<String, dynamic> json) {
    return AddPlanModel(
      vehicleId: json['vehicleId'],
      planId: json['planId'],
      planAmount: json['planAmount'],
    );
  }

  // Method to convert an AddPlanModel to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'vehicleId': vehicleId,
      'planId': planId,
      'planAmount': planAmount,
    };
  }
}
