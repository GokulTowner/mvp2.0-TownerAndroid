class OwnerSetting {
  bool status;
  bool mandatory;

  OwnerSetting({
    required this.status,
    required this.mandatory,
  });

  factory OwnerSetting.fromJson(Map<String, dynamic> json) {
    return OwnerSetting(
      status: json['status'],
      mandatory: json['mandatory'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'mandatory': mandatory,
    };
  }
}

class OwnerSettingModel {
  OwnerSetting govRate;
  OwnerSetting myDiscount;
  OwnerSetting promotionalDiscount;
  OwnerSetting convenienceCharge;
  OwnerSetting gst;
  OwnerSetting onlineBooking;
  OwnerSetting leadCharge;
  OwnerSetting selfBooking;
  OwnerSetting billShare;
  OwnerSetting itrFiling;
  OwnerSetting gstRegFiling;
  OwnerSetting plFilling;
  OwnerSetting inviteCustomers;
  OwnerSetting tripsHistory;
  OwnerSetting inviteDrivers;
  OwnerSetting walletActive;
  OwnerSetting referralBonus;

  OwnerSettingModel({
    required this.govRate,
    required this.myDiscount,
    required this.promotionalDiscount,
    required this.convenienceCharge,
    required this.gst,
    required this.onlineBooking,
    required this.leadCharge,
    required this.selfBooking,
    required this.billShare,
    required this.itrFiling,
    required this.gstRegFiling,
    required this.plFilling,
    required this.inviteCustomers,
    required this.tripsHistory,
    required this.inviteDrivers,
    required this.walletActive,
    required this.referralBonus,
  });

  factory OwnerSettingModel.defaultSettings() {
    return OwnerSettingModel(
      govRate: OwnerSetting(status: false, mandatory: false),
      myDiscount: OwnerSetting(status: false, mandatory: false),
      promotionalDiscount: OwnerSetting(status: false, mandatory: false),
      convenienceCharge: OwnerSetting(status: false, mandatory: false),
      gst: OwnerSetting(status: false, mandatory: false),
      onlineBooking: OwnerSetting(status: false, mandatory: false),
      leadCharge: OwnerSetting(status: false, mandatory: false),
      selfBooking: OwnerSetting(status: false, mandatory: false),
      billShare: OwnerSetting(status: false, mandatory: false),
      itrFiling: OwnerSetting(status: false, mandatory: false),
      gstRegFiling: OwnerSetting(status: false, mandatory: false),
      plFilling: OwnerSetting(status: false, mandatory: false),
      inviteCustomers: OwnerSetting(status: false, mandatory: false),
      tripsHistory: OwnerSetting(status: false, mandatory: false),
      inviteDrivers: OwnerSetting(status: false, mandatory: false),
      walletActive: OwnerSetting(status: false, mandatory: false),
      referralBonus: OwnerSetting(status: false, mandatory: false),
    );
  }

  factory OwnerSettingModel.fromJson(Map<String, dynamic> json) {
    return OwnerSettingModel(
      govRate: OwnerSetting.fromJson(json['govRate']),
      myDiscount: OwnerSetting.fromJson(json['myDiscount']),
      promotionalDiscount: OwnerSetting.fromJson(json['promotionalDiscount']),
      convenienceCharge: OwnerSetting.fromJson(json['convenienceCharge']),
      gst: OwnerSetting.fromJson(json['gst']),
      onlineBooking: OwnerSetting.fromJson(json['onlineBooking']),
      leadCharge: OwnerSetting.fromJson(json['leadCharge']),
      selfBooking: OwnerSetting.fromJson(json['selfBooking']),
      billShare: OwnerSetting.fromJson(json['billShare']),
      itrFiling: OwnerSetting.fromJson(json['itrFiling']),
      gstRegFiling: OwnerSetting.fromJson(json['gstRegFiling']),
      plFilling: OwnerSetting.fromJson(json['plFilling']),
      inviteCustomers: OwnerSetting.fromJson(json['inviteCustomers']),
      tripsHistory: OwnerSetting.fromJson(json['tripsHistory']),
      inviteDrivers: OwnerSetting.fromJson(json['inviteDrivers']),
      walletActive: OwnerSetting.fromJson(json['walletActive']),
      referralBonus: OwnerSetting.fromJson(json['referralBonus']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'govRate': govRate.toJson(),
      'myDiscount': myDiscount.toJson(),
      'promotionalDiscount': promotionalDiscount.toJson(),
      'convenienceCharge': convenienceCharge.toJson(),
      'gst': gst.toJson(),
      'onlineBooking': onlineBooking.toJson(),
      'leadCharge': leadCharge.toJson(),
      'selfBooking': selfBooking.toJson(),
      'billShare': billShare.toJson(),
      'itrFiling': itrFiling.toJson(),
      'gstRegFiling': gstRegFiling.toJson(),
      'plFilling': plFilling.toJson(),
      'inviteCustomers': inviteCustomers.toJson(),
      'tripsHistory': tripsHistory.toJson(),
      'inviteDrivers': inviteDrivers.toJson(),
      'walletActive': walletActive.toJson(),
      'referralBonus': referralBonus.toJson(),
    };
  }
}
