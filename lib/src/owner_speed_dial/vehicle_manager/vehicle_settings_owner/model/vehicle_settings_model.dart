class VehicleSetting {
  bool status;
  bool? mandatory;
  int? percentage;
  int? amount;
  String? baseFare;
  String? extraKm;
  String? extraTime;

  VehicleSetting({
    required this.status,
    this.mandatory,
    this.percentage,
    this.amount,
    this.baseFare,
    this.extraKm,
    this.extraTime,
  });

  factory VehicleSetting.fromJson(Map<String, dynamic> json) {
    return VehicleSetting(
      status: json['status'],
      mandatory: json['mandatory'] ?? true,
      percentage: json['percentage'],
      amount: json['amount'],
      baseFare: json['baseFare'],
      extraKm: json['extraKm'],
      extraTime: json['extraTime'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {'status': status};
    if (mandatory != null) {
      data['mandatory'] = mandatory;
    }
    if (percentage != null) {
      data['percentage'] = percentage;
    }
    if (amount != null) {
      data['amount'] = amount;
    }
    if (baseFare != null) {
      data['baseFare'] = baseFare;
    }
    if (extraKm != null) {
      data['extraKm'] = extraKm;
    }
    if (extraTime != null) {
      data['extraTime'] = extraTime;
    }
    return data;
  }
}

class VehicleSettingsModel {
  VehicleSetting governmentRateStatus;
  VehicleSetting myDiscountStatus;
  VehicleSetting convenienceCharge;
  VehicleSetting nightFare;
  VehicleSetting walletActive;
  VehicleSetting subscription;

  VehicleSettingsModel({
    required this.governmentRateStatus,
    required this.myDiscountStatus,
    required this.convenienceCharge,
    required this.nightFare,
    required this.walletActive,
    required this.subscription,
  });

  factory VehicleSettingsModel.fromJson(Map<String, dynamic> json) {
    return VehicleSettingsModel(
      governmentRateStatus:
          VehicleSetting.fromJson(json['governmentRateStatus']),
      myDiscountStatus: VehicleSetting.fromJson(json['myDiscountStatus']),
      convenienceCharge: VehicleSetting.fromJson(json['convenienceCharge']),
      nightFare: VehicleSetting.fromJson(json['nightFare']),
      walletActive: VehicleSetting.fromJson(json['walletActive']),
      subscription: VehicleSetting.fromJson(json['subscription']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'governmentRateStatus': governmentRateStatus.toJson(),
      'myDiscountStatus': myDiscountStatus.toJson(),
      'convenienceCharge': convenienceCharge.toJson(),
      'nightFare': nightFare.toJson(),
      'walletActive': walletActive.toJson(),
      'subscription': subscription.toJson(),
    };
  }

  // Factory constructor for default settings
  factory VehicleSettingsModel.defaultSettings() {
    return VehicleSettingsModel(
      governmentRateStatus: VehicleSetting(
        status: true,
        baseFare: "",
        extraKm: "",
        extraTime: "",
      ),
      myDiscountStatus: VehicleSetting(
        status: true,
        mandatory: false,
        percentage: 10,
        amount: 25,
      ),
      convenienceCharge: VehicleSetting(
        status: false,
        mandatory: false,
      ),
      nightFare: VehicleSetting(
        status: false,
        mandatory: false,
      ),
      walletActive: VehicleSetting(
        status: false,
        mandatory: false,
      ),
      subscription: VehicleSetting(
        status: false,
        mandatory: false,
      ),
    );
  }
}
