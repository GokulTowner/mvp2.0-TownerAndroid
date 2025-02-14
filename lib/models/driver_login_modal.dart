// To parse this JSON data, do
//
//     final driverLoginModal = driverLoginModalFromMap(jsonString);

import 'dart:convert';

DriverLoginModal driverLoginModalFromMap(String str) => DriverLoginModal.fromMap(json.decode(str));

String driverLoginModalToMap(DriverLoginModal data) => json.encode(data.toMap());

class DriverLoginModal {
  final bool? success;
  final String? message;
  final List<DriverData>? datas;
  final String? token;
  final String? fbCusToken;

  DriverLoginModal({
    this.success,
    this.message,
    this.datas,
    this.token,
    this.fbCusToken,
  });

  factory DriverLoginModal.fromMap(Map<String, dynamic> json) => DriverLoginModal(
    success: json["success"],
    message: json["message"],
    datas: json["datas"] == null ? [] : List<DriverData>.from(json["datas"]!.map((x) => DriverData.fromMap(x))),
    token: json["token"],
    fbCusToken: json["FbCusToken"],
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "datas": datas == null ? [] : List<dynamic>.from(datas!.map((x) => x.toMap())),
    "token": token,
    "FbCusToken": fbCusToken,
  };
}

class DriverData {
  final String? name;
  final String? email;
  final String? nic;
  final List<Status>? status;
  final String? code;
  final String? userId;
  final Profile? profile;
  final String? walletType;
  final int? walletCredit;
  final int? walletLimit;
  final String? limitAlert;

  DriverData({
    this.name,
    this.email,
    this.nic,
    this.status,
    this.code,
    this.userId,
    this.profile,
    this.walletType,
    this.walletCredit,
    this.walletLimit,
    this.limitAlert,
  });

  factory DriverData.fromMap(Map<String, dynamic> json) => DriverData(
    name: json["name"],
    email: json["email"],
    nic: json["nic"],
    status: json["status"] == null ? [] : List<Status>.from(json["status"]!.map((x) => Status.fromMap(x))),
    code: json["code"],
    userId: json["userId"],
    profile: json["profile"] == null ? null : Profile.fromMap(json["profile"]),
    walletType: json["walletType"],
    walletCredit: json["walletCredit"],
    walletLimit: json["walletLimit"],
    limitAlert: json["LimitAlert"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "email": email,
    "nic": nic,
    "status": status == null ? [] : List<dynamic>.from(status!.map((x) => x.toMap())),
    "code": code,
    "userId": userId,
    "profile": profile?.toMap(),
    "walletType": walletType,
    "walletCredit": walletCredit,
    "walletLimit": walletLimit,
    "LimitAlert": limitAlert,
  };
}

class Profile {
  final UserProfile? userProfile;

  Profile({
    this.userProfile,
  });

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
    userProfile: json["userProfile"] == null ? null : UserProfile.fromMap(json["userProfile"]),
  );

  Map<String, dynamic> toMap() => {
    "userProfile": userProfile?.toMap(),
  };
}

class UserProfile {
  final dynamic currentActiveTaxi;
  final bool? isDriverCreditModuleEnabledForUseAfterLogin;
  final String? profileurl;

  UserProfile({
    this.currentActiveTaxi,
    this.isDriverCreditModuleEnabledForUseAfterLogin,
    this.profileurl,
  });

  factory UserProfile.fromMap(Map<String, dynamic> json) => UserProfile(
    currentActiveTaxi: json["currentActiveTaxi"],
    isDriverCreditModuleEnabledForUseAfterLogin: json["isDriverCreditModuleEnabledForUseAfterLogin"],
    profileurl: json["profileurl"],
  );

  Map<String, dynamic> toMap() => {
    "currentActiveTaxi": currentActiveTaxi,
    "isDriverCreditModuleEnabledForUseAfterLogin": isDriverCreditModuleEnabledForUseAfterLogin,
    "profileurl": profileurl,
  };
}

class Status {
  final String? curstatus;
  final String? models;
  final String? docs;
  final String? canoperate;
  final String? id;

  Status({
    this.curstatus,
    this.models,
    this.docs,
    this.canoperate,
    this.id,
  });

  factory Status.fromMap(Map<String, dynamic> json) => Status(
    curstatus: json["curstatus"],
    models: json["models"],
    docs: json["docs"],
    canoperate: json["canoperate"],
    id: json["_id"],
  );

  Map<String, dynamic> toMap() => {
    "curstatus": curstatus,
    "models": models,
    "docs": docs,
    "canoperate": canoperate,
    "_id": id,
  };
}
