class SubscriptionRequestModel {
  final String traAgId;
  final int totalAmount;
  final List<SubscriptionDetail> subscriptions;

  SubscriptionRequestModel({
    required this.traAgId,
    required this.totalAmount,
    required this.subscriptions,
  });

  factory SubscriptionRequestModel.fromJson(Map<String, dynamic> json) {
    var subscriptionsJson = json['subscriptions'] as List;
    List<SubscriptionDetail> subscriptionsList =
        subscriptionsJson.map((i) => SubscriptionDetail.fromJson(i)).toList();

    return SubscriptionRequestModel(
      traAgId: json['traAgId'],
      totalAmount: json['totalAmount'],
      subscriptions: subscriptionsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'traAgId': traAgId,
      'totalAmount': totalAmount,
      'subscriptions': subscriptions.map((sub) => sub.toJson()).toList(),
    };
  }
}

class SubscriptionDetail {
  final String vehId;
  final String planId;
  final int planAmount;

  SubscriptionDetail({
    required this.vehId,
    required this.planId,
    required this.planAmount,
  });

  factory SubscriptionDetail.fromJson(Map<String, dynamic> json) {
    return SubscriptionDetail(
      vehId: json['vehId'],
      planId: json['planId'],
      planAmount: json['planAmount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vehId': vehId,
      'planId': planId,
      'planAmount': planAmount,
    };
  }
}
