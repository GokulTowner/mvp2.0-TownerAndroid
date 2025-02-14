class DriverSetting {
  bool status;
  bool? mandatory;
  int? percentage;
  int? amount;
  String? baseFare;
  String? extraKm;
  String? extraTime;

  DriverSetting({
    required this.status,
    this.mandatory,
    this.percentage,
    this.amount,
    this.baseFare,
    this.extraKm,
    this.extraTime,
  });

  factory DriverSetting.fromJson(Map<String, dynamic> json) {
    return DriverSetting(
      status: json['status'],
      mandatory: json['mandatory'],
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

class DriverSettingModel {
  DriverSetting governmentRateStatus;
  DriverSetting myDiscountStatus;
  DriverSetting convenienceCharge;
  DriverSetting nightFare;
  DriverSetting walletActive;
  DriverSetting subscription;
  DriverSetting inviteDrivers;
  DriverSetting referralBonus;

  DriverSettingModel({
    required this.governmentRateStatus,
    required this.myDiscountStatus,
    required this.convenienceCharge,
    required this.nightFare,
    required this.walletActive,
    required this.subscription,
    required this.inviteDrivers,
    required this.referralBonus,
  });

  factory DriverSettingModel.fromJson(Map<String, dynamic> json) {
    return DriverSettingModel(
      governmentRateStatus:
          DriverSetting.fromJson(json['governmentRateStatus']),
      myDiscountStatus: DriverSetting.fromJson(json['myDiscountStatus']),
      convenienceCharge: DriverSetting.fromJson(json['convenienceCharge']),
      nightFare: DriverSetting.fromJson(json['nightFare']),
      walletActive: DriverSetting.fromJson(json['walletActive']),
      subscription: DriverSetting.fromJson(json['subscription']),
      inviteDrivers: DriverSetting.fromJson(json['inviteDrivers']),
      referralBonus: DriverSetting.fromJson(json['referralBonus']),
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
      'inviteDrivers': inviteDrivers.toJson(),
      'referralBonus': referralBonus.toJson(),
    };
  }

  // Factory constructor for default settings
  factory DriverSettingModel.defaultSettings() {
    return DriverSettingModel(
      governmentRateStatus: DriverSetting(
          status: true, baseFare: "N/A", extraKm: "N/A", extraTime: "N/A"),
      myDiscountStatus: DriverSetting(status: true, percentage: 10, amount: 25),
      convenienceCharge: DriverSetting(status: false),
      nightFare: DriverSetting(status: false),
      walletActive: DriverSetting(status: false),
      subscription: DriverSetting(status: false),
      inviteDrivers: DriverSetting(status: false, mandatory: false),
      referralBonus: DriverSetting(status: false, mandatory: false),
    );
  }
}
