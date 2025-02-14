class VehicleDetailsSubscriptionModel {
  String vehicleId;
  String vehicleNumber;
  String vehicleModel;
  String driver;
  String subValidity;
  bool isChecked;
  Subscription selectedSubscription;
  Subscription currentSubscription;

  VehicleDetailsSubscriptionModel({
    required this.vehicleId,
    required this.vehicleNumber,
    required this.vehicleModel,
    required this.driver,
    required this.subValidity,
    required this.isChecked,
    required this.selectedSubscription,
    required this.currentSubscription,
  });

  factory VehicleDetailsSubscriptionModel.fromJson(Map<String, dynamic> json) {
    return VehicleDetailsSubscriptionModel(
      vehicleId: json['vehicleId'] ?? '',
      vehicleNumber: json['vehicleNumber'] ?? '',
      vehicleModel: json['vehicleModel'] ?? '',
      driver: json['driver'] ?? '',
      subValidity: json['subValidity'] ?? '',
      isChecked: json['isChecked'] ?? false,
      selectedSubscription: Subscription.fromJson(json['selectedSubscription']),
      currentSubscription: Subscription.fromJson(json['currentSubscription']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vehicleId': vehicleId,
      'vehicleNumber': vehicleNumber,
      'vehicleModel': vehicleModel,
      'driver': driver,
      'subValidity': subValidity,
      'isChecked': isChecked,
      'selectedSubscription': selectedSubscription.toJson(),
      'currentSubscription': currentSubscription.toJson(),
    };
  }
}

class Subscription {
  String id;
  String name;
  double price;

  Subscription({
    required this.id,
    required this.name,
    required this.price,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      price: (json['price'] ?? 0.0),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'amount': price,
    };
  }
}
