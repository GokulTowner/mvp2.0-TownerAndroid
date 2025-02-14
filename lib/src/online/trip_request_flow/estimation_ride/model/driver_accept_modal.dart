// To parse this JSON data, do
//
//     final driverAcceptModal = driverAcceptModalFromJson(jsonString);

import 'dart:convert';

DriverAcceptModal driverAcceptModalFromJson(String str) => DriverAcceptModal.fromJson(json.decode(str));

String driverAcceptModalToJson(DriverAcceptModal data) => json.encode(data.toJson());

class DriverAcceptModal {
  bool? success;
  String? message;
  Rider? rider;
  Pickupdetails? pickupdetails;
  String? status;
  Fare? fare;
  String? taxitype;
  String? startOtp;
  String? endOtp;
  VehicleDataForLiveMeter? vehicleDataForLiveMeter;
  String? tripType;
  List<dynamic>? multiLocation;

  DriverAcceptModal({
    this.success,
    this.message,
    this.rider,
    this.pickupdetails,
    this.status,
    this.fare,
    this.taxitype,
    this.startOtp,
    this.endOtp,
    this.vehicleDataForLiveMeter,
    this.tripType,
    this.multiLocation,
  });

  factory DriverAcceptModal.fromJson(Map<String, dynamic> json) => DriverAcceptModal(
    success: json["success"],
    message: json["message"],
    rider: json["rider"] == null ? null : Rider.fromJson(json["rider"]),
    pickupdetails: json["pickupdetails"] == null ? null : Pickupdetails.fromJson(json["pickupdetails"]),
    status: json["status"],
    fare: json["fare"] == null ? null : Fare.fromJson(json["fare"]),
    taxitype: json["taxitype"],
    startOtp: json["startOTP"],
    endOtp: json["endOTP"],
    vehicleDataForLiveMeter: json["vehicleDataForLiveMeter"] == null ? null : VehicleDataForLiveMeter.fromJson(json["vehicleDataForLiveMeter"]),
    tripType: json["tripType"],
    multiLocation: json["multiLocation"] == null ? [] : List<dynamic>.from(json["multiLocation"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "rider": rider?.toJson(),
    "pickupdetails": pickupdetails?.toJson(),
    "status": status,
    "fare": fare?.toJson(),
    "taxitype": taxitype,
    "startOTP": startOtp,
    "endOTP": endOtp,
    "vehicleDataForLiveMeter": vehicleDataForLiveMeter?.toJson(),
    "tripType": tripType,
    "multiLocation": multiLocation == null ? [] : List<dynamic>.from(multiLocation!.map((x) => x)),
  };
}

class Fare {
  int? perKmRate;
  String? fareType;
  String? distance;
  String? kmFare;
  int? timeRate;
  int? waitingCharge;
  int? waitingTime;
  int? waitingFare;
  int? cancelationFeesRider;
  int? cancelationFeesDriver;
  int? pickupCharge;
  int? comison;
  int? comisonAmt;
  bool? isTax;
  int? taxPercentage;
  int? tax;
  int? minFare;
  int? flatFare;
  int? oldCancellationAmt;
  int? fareAmtBeforeSurge;
  int? totalFareWithOutOldBal;
  int? totalFare;
  Obj? nightObj;
  Obj? peakObj;
  dynamic distanceObj;
  int? fareAmt;
  String? duration;
  int? discountAmt;
  int? balanceFare;
  int? detuctedFare;
  String? paymentMode;
  ApplyValues? applyValues;
  int? googleCharge;
  int? pgcharge;

  Fare({
    this.perKmRate,
    this.fareType,
    this.distance,
    this.kmFare,
    this.timeRate,
    this.waitingCharge,
    this.waitingTime,
    this.waitingFare,
    this.cancelationFeesRider,
    this.cancelationFeesDriver,
    this.pickupCharge,
    this.comison,
    this.comisonAmt,
    this.isTax,
    this.taxPercentage,
    this.tax,
    this.minFare,
    this.flatFare,
    this.oldCancellationAmt,
    this.fareAmtBeforeSurge,
    this.totalFareWithOutOldBal,
    this.totalFare,
    this.nightObj,
    this.peakObj,
    this.distanceObj,
    this.fareAmt,
    this.duration,
    this.discountAmt,
    this.balanceFare,
    this.detuctedFare,
    this.paymentMode,
    this.applyValues,
    this.googleCharge,
    this.pgcharge,
  });

  factory Fare.fromJson(Map<String, dynamic> json) => Fare(
    perKmRate: json["perKMRate"],
    fareType: json["fareType"],
    distance: json["distance"],
    kmFare: json["KMFare"],
    timeRate: json["timeRate"],
    waitingCharge: json["waitingCharge"],
    waitingTime: json["waitingTime"],
    waitingFare: json["waitingFare"],
    cancelationFeesRider: json["cancelationFeesRider"],
    cancelationFeesDriver: json["cancelationFeesDriver"],
    pickupCharge: json["pickupCharge"],
    comison: json["comison"],
    comisonAmt: json["comisonAmt"],
    isTax: json["isTax"],
    taxPercentage: json["taxPercentage"],
    tax: json["tax"],
    minFare: json["minFare"],
    flatFare: json["flatFare"],
    oldCancellationAmt: json["oldCancellationAmt"],
    fareAmtBeforeSurge: json["fareAmtBeforeSurge"],
    totalFareWithOutOldBal: json["totalFareWithOutOldBal"],
    totalFare: json["totalFare"],
    nightObj: json["nightObj"] == null ? null : Obj.fromJson(json["nightObj"]),
    peakObj: json["peakObj"] == null ? null : Obj.fromJson(json["peakObj"]),
    distanceObj: json["distanceObj"],
    fareAmt: json["fareAmt"],
    duration: json["duration"],
    discountAmt: json["discountAmt"],
    balanceFare: json["BalanceFare"],
    detuctedFare: json["DetuctedFare"],
    paymentMode: json["paymentMode"],
    applyValues: json["applyValues"] == null ? null : ApplyValues.fromJson(json["applyValues"]),
    googleCharge: json["googleCharge"],
    pgcharge: json["pgcharge"],
  );

  Map<String, dynamic> toJson() => {
    "perKMRate": perKmRate,
    "fareType": fareType,
    "distance": distance,
    "KMFare": kmFare,
    "timeRate": timeRate,
    "waitingCharge": waitingCharge,
    "waitingTime": waitingTime,
    "waitingFare": waitingFare,
    "cancelationFeesRider": cancelationFeesRider,
    "cancelationFeesDriver": cancelationFeesDriver,
    "pickupCharge": pickupCharge,
    "comison": comison,
    "comisonAmt": comisonAmt,
    "isTax": isTax,
    "taxPercentage": taxPercentage,
    "tax": tax,
    "minFare": minFare,
    "flatFare": flatFare,
    "oldCancellationAmt": oldCancellationAmt,
    "fareAmtBeforeSurge": fareAmtBeforeSurge,
    "totalFareWithOutOldBal": totalFareWithOutOldBal,
    "totalFare": totalFare,
    "nightObj": nightObj?.toJson(),
    "peakObj": peakObj?.toJson(),
    "distanceObj": distanceObj,
    "fareAmt": fareAmt,
    "duration": duration,
    "discountAmt": discountAmt,
    "BalanceFare": balanceFare,
    "DetuctedFare": detuctedFare,
    "paymentMode": paymentMode,
    "applyValues": applyValues?.toJson(),
    "googleCharge": googleCharge,
    "pgcharge": pgcharge,
  };
}

class ApplyValues {
  bool? applyNightCharge;
  bool? applyPeakCharge;
  bool? applyWaitingTime;
  bool? applyTax;
  bool? applyCommission;
  bool? applyPickupCharge;

  ApplyValues({
    this.applyNightCharge,
    this.applyPeakCharge,
    this.applyWaitingTime,
    this.applyTax,
    this.applyCommission,
    this.applyPickupCharge,
  });

  factory ApplyValues.fromJson(Map<String, dynamic> json) => ApplyValues(
    applyNightCharge: json["applyNightCharge"],
    applyPeakCharge: json["applyPeakCharge"],
    applyWaitingTime: json["applyWaitingTime"],
    applyTax: json["applyTax"],
    applyCommission: json["applyCommission"],
    applyPickupCharge: json["applyPickupCharge"],
  );

  Map<String, dynamic> toJson() => {
    "applyNightCharge": applyNightCharge,
    "applyPeakCharge": applyPeakCharge,
    "applyWaitingTime": applyWaitingTime,
    "applyTax": applyTax,
    "applyCommission": applyCommission,
    "applyPickupCharge": applyPickupCharge,
  };
}

class Obj {
  bool? isApply;
  int? percentageIncrease;
  String? alertLable;

  Obj({
    this.isApply,
    this.percentageIncrease,
    this.alertLable,
  });

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    isApply: json["isApply"],
    percentageIncrease: json["percentageIncrease"],
    alertLable: json["alertLable"],
  );

  Map<String, dynamic> toJson() => {
    "isApply": isApply,
    "percentageIncrease": percentageIncrease,
    "alertLable": alertLable,
  };
}

class Pickupdetails {
  String? distanceKm;
  String? estTime;
  String? start;
  String? end;
  List<double>? startcoords;
  List<double>? endcoords;
  String? startDay;
  String? returnDay;
  String? outstationType;

  Pickupdetails({
    this.distanceKm,
    this.estTime,
    this.start,
    this.end,
    this.startcoords,
    this.endcoords,
    this.startDay,
    this.returnDay,
    this.outstationType,
  });

  factory Pickupdetails.fromJson(Map<String, dynamic> json) => Pickupdetails(
    distanceKm: json["distanceKM"],
    estTime: json["estTime"],
    start: json["start"],
    end: json["end"],
    startcoords: json["startcoords"] == null ? [] : List<double>.from(json["startcoords"]!.map((x) => x?.toDouble())),
    endcoords: json["endcoords"] == null ? [] : List<double>.from(json["endcoords"]!.map((x) => x?.toDouble())),
    startDay: json["startDay"],
    returnDay: json["returnDay"],
    outstationType: json["outstationType"],
  );

  Map<String, dynamic> toJson() => {
    "distanceKM": distanceKm,
    "estTime": estTime,
    "start": start,
    "end": end,
    "startcoords": startcoords == null ? [] : List<dynamic>.from(startcoords!.map((x) => x)),
    "endcoords": endcoords == null ? [] : List<dynamic>.from(endcoords!.map((x) => x)),
    "startDay": startDay,
    "returnDay": returnDay,
    "outstationType": outstationType,
  };
}

class Rider {
  String? cntyname;
  String? email;
  String? fcmId;
  String? fname;
  String? id;
  String? lang;
  String? notes;
  String? otherName;
  String? phone;
  String? phcode;
  String? profileurl;
  String? points;
  String? othersPhone;

  Rider({
    this.cntyname,
    this.email,
    this.fcmId,
    this.fname,
    this.id,
    this.lang,
    this.notes,
    this.otherName,
    this.phone,
    this.phcode,
    this.profileurl,
    this.points,
    this.othersPhone,
  });

  factory Rider.fromJson(Map<String, dynamic> json) => Rider(
    cntyname: json["cntyname"],
    email: json["email"],
    fcmId: json["fcmId"],
    fname: json["fname"],
    id: json["id"],
    lang: json["lang"],
    notes: json["notes"],
    otherName: json["otherName"],
    phone: json["phone"],
    phcode: json["phcode"],
    profileurl: json["profileurl"],
    points: json["points"],
    othersPhone: json["othersPhone"],
  );

  Map<String, dynamic> toJson() => {
    "cntyname": cntyname,
    "email": email,
    "fcmId": fcmId,
    "fname": fname,
    "id": id,
    "lang": lang,
    "notes": notes,
    "otherName": otherName,
    "phone": phone,
    "phcode": phcode,
    "profileurl": profileurl,
    "points": points,
    "othersPhone": othersPhone,
  };
}

class VehicleDataForLiveMeter {
  VehicleDataForLiveMeter();

  factory VehicleDataForLiveMeter.fromJson(Map<String, dynamic> json) => VehicleDataForLiveMeter(
  );

  Map<String, dynamic> toJson() => {
  };
}
