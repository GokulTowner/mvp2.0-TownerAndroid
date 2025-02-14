class SubscriptionDriverModel {
  final String planId;
  final String vehId;
  final String planName;
  final String planAmount;
  final String vehModel;
  final int planValidity;
  final int remainingDays;
  final String validityType;
  final String startDate;
  final String endDate;
  final List<Plan> expiredPlans;

  SubscriptionDriverModel({
    required this.planId,
    required this.vehId,
    required this.planName,
    required this.planAmount,
    required this.vehModel,
    required this.planValidity,
    required this.remainingDays,
    required this.validityType,
    required this.startDate,
    required this.endDate,
    required this.expiredPlans,
  });

  factory SubscriptionDriverModel.fromJson(Map<String, dynamic> json) {
    var expiredPlansJson = json['expiredPlans'] as List;
    List<Plan> expiredPlansList =
        expiredPlansJson.map((i) => Plan.fromJson(i)).toList();

    return SubscriptionDriverModel(
      planId: json['planId'],
      vehId: json['vehId'],
      planName: json['planName'],
      planAmount: json['planAmount'],
      vehModel: json['vehModel'],
      planValidity: json['planValidity'],
      remainingDays: json['remainingDays'],
      validityType: json['validityType'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      expiredPlans: expiredPlansList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'planId': planId,
      'vehId': vehId,
      'planName': planName,
      'planAmount': planAmount,
      'vehModel': vehModel,
      'planValidity': planValidity,
      'remainingDays': remainingDays,
      'validityType': validityType,
      'startDate': startDate,
      'endDate': endDate,
      'expiredPlans': expiredPlans.map((plan) => plan.toJson()).toList(),
    };
  }
}

class Plan {
  final String planId;
  final String vehId;
  final String planName;
  final String planAmount;
  final String vehModel;
  final int planValidity;
  final int remainingDays;
  final String validityType;
  final String startDate;
  final String endDate;

  Plan({
    required this.planId,
    required this.vehId,
    required this.planName,
    required this.planAmount,
    required this.vehModel,
    required this.planValidity,
    required this.remainingDays,
    required this.validityType,
    required this.startDate,
    required this.endDate,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      planId: json['planId'],
      vehId: json['vehId'],
      planName: json['planName'],
      planAmount: json['planAmount'],
      vehModel: json['vehModel'],
      planValidity: json['planValidity'],
      remainingDays: json['remainingDays'],
      validityType: json['validityType'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'planId': planId,
      'vehId': vehId,
      'planName': planName,
      'planAmount': planAmount,
      'vehModel': vehModel,
      'planValidity': planValidity,
      'remainingDays': remainingDays,
      'validityType': validityType,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
