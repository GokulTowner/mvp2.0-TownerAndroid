// To parse this JSON data, do
//
//     final myTripsModal = myTripsModalFromJson(jsonString);

import 'dart:convert';

List<MyTripsModal> myTripsModalFromJson(String str) => List<MyTripsModal>.from(json.decode(str).map((x) => MyTripsModal.fromJson(x)));

String myTripsModalToJson(List<MyTripsModal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyTripsModal {
  Other? other;
  Csp? csp;
  Dsp? dsp;
  Acsp? acsp;
  Adsp? adsp;
  ApplyValues? applyValues;
  Tripinvoicedriverdetails? tripinvoicedriverdetails;
  Scheduletripprocess? scheduletripprocess;
  String? id;
  String? tenantId;
  String? tripCode;
  String? requestFrom;
  String? requestId;
  String? triptype;
  String? bookingType;
  String? bookingFor;
  String? notes;
  String? date;
  dynamic hotelid;
  dynamic cpy;
  String? cpyid;
  String? drivercmpnyname;
  dynamic ridcpyid;
  String? ridercmpnyname;
  String? dvr;
  String? dvrid;
  String? rid;
  String? ridrating;
  String? ridid;
  String? fare;
  String? vehicle;
  String? service;
  String? paymentSts;
  String? paymentMode;
  int? noofseats;
  List<dynamic>? additionalFee;
  String? estTime;
  String? status;
  List<String>? tripOtp;
  String? paymenttxnid;
  String? review;
  List<ReqDvr>? reqDvr;
  List<dynamic>? curReq;
  String? needClear;
  String? tripDt;
  String? utc;
  DateTime? tripFdt;
  String? gmtTime;
  String? scId;
  String? scity;
  bool? isMultiLocation;
  List<dynamic>? multiLocation;
  DateTime? createdAt;
  int? tripno;
  int? v;
  Driverfb? driverfb;

  MyTripsModal({
    this.other,
    this.csp,
    this.dsp,
    this.acsp,
    this.adsp,
    this.applyValues,
    this.tripinvoicedriverdetails,
    this.scheduletripprocess,
    this.id,
    this.tenantId,
    this.tripCode,
    this.requestFrom,
    this.requestId,
    this.triptype,
    this.bookingType,
    this.bookingFor,
    this.notes,
    this.date,
    this.hotelid,
    this.cpy,
    this.cpyid,
    this.drivercmpnyname,
    this.ridcpyid,
    this.ridercmpnyname,
    this.dvr,
    this.dvrid,
    this.rid,
    this.ridrating,
    this.ridid,
    this.fare,
    this.vehicle,
    this.service,
    this.paymentSts,
    this.paymentMode,
    this.noofseats,
    this.additionalFee,
    this.estTime,
    this.status,
    this.tripOtp,
    this.paymenttxnid,
    this.review,
    this.reqDvr,
    this.curReq,
    this.needClear,
    this.tripDt,
    this.utc,
    this.tripFdt,
    this.gmtTime,
    this.scId,
    this.scity,
    this.isMultiLocation,
    this.multiLocation,
    this.createdAt,
    this.tripno,
    this.v,
    this.driverfb,
  });

  factory MyTripsModal.fromJson(Map<String, dynamic> json) => MyTripsModal(
    other: json["other"] == null ? null : Other.fromJson(json["other"]),
    csp: json["csp"] == null ? null : Csp.fromJson(json["csp"]),
    dsp: json["dsp"] == null ? null : Dsp.fromJson(json["dsp"]),
    acsp: json["acsp"] == null ? null : Acsp.fromJson(json["acsp"]),
    adsp: json["adsp"] == null ? null : Adsp.fromJson(json["adsp"]),
    applyValues: json["applyValues"] == null ? null : ApplyValues.fromJson(json["applyValues"]),
    tripinvoicedriverdetails: json["tripinvoicedriverdetails"] == null ? null : Tripinvoicedriverdetails.fromJson(json["tripinvoicedriverdetails"]),
    scheduletripprocess: json["scheduletripprocess"] == null ? null : Scheduletripprocess.fromJson(json["scheduletripprocess"]),
    id: json["_id"],
    tenantId: json["tenantId"],
    tripCode: json["tripCode"],
    requestFrom: json["requestFrom"],
    requestId: json["requestId"],
    triptype: json["triptype"],
    bookingType: json["bookingType"],
    bookingFor: json["bookingFor"],
    notes: json["notes"],
    date: json["date"],
    hotelid: json["hotelid"],
    cpy: json["cpy"],
    cpyid: json["cpyid"],
    drivercmpnyname: json["drivercmpnyname"],
    ridcpyid: json["ridcpyid"],
    ridercmpnyname: json["ridercmpnyname"],
    dvr: json["dvr"],
    dvrid: json["dvrid"],
    rid: json["rid"],
    ridrating: json["ridrating"],
    ridid: json["ridid"],
    fare: json["fare"],
    vehicle: json["vehicle"],
    service: json["service"],
    paymentSts: json["paymentSts"],
    paymentMode: json["paymentMode"],
    noofseats: json["noofseats"],
    additionalFee: json["additionalFee"] == null ? [] : List<dynamic>.from(json["additionalFee"]!.map((x) => x)),
    estTime: json["estTime"],
    status: json["status"],
    tripOtp: json["tripOTP"] == null ? [] : List<String>.from(json["tripOTP"]!.map((x) => x)),
    paymenttxnid: json["paymenttxnid"],
    review: json["review"],
    reqDvr: json["reqDvr"] == null ? [] : List<ReqDvr>.from(json["reqDvr"]!.map((x) => ReqDvr.fromJson(x))),
    curReq: json["curReq"] == null ? [] : List<dynamic>.from(json["curReq"]!.map((x) => x)),
    needClear: json["needClear"],
    tripDt: json["tripDT"],
    utc: json["utc"],
    tripFdt: json["tripFDT"] == null ? null : DateTime.parse(json["tripFDT"]),
    gmtTime: json["gmtTime"],
    scId: json["scId"],
    scity: json["scity"],
    isMultiLocation: json["isMultiLocation"],
    multiLocation: json["multiLocation"] == null ? [] : List<dynamic>.from(json["multiLocation"]!.map((x) => x)),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    tripno: json["tripno"],
    v: json["__v"],
    driverfb: json["driverfb"] == null ? null : Driverfb.fromJson(json["driverfb"]),
  );

  Map<String, dynamic> toJson() => {
    "other": other?.toJson(),
    "csp": csp?.toJson(),
    "dsp": dsp?.toJson(),
    "acsp": acsp?.toJson(),
    "adsp": adsp?.toJson(),
    "applyValues": applyValues?.toJson(),
    "tripinvoicedriverdetails": tripinvoicedriverdetails?.toJson(),
    "scheduletripprocess": scheduletripprocess?.toJson(),
    "_id": id,
    "tenantId": tenantId,
    "tripCode": tripCode,
    "requestFrom": requestFrom,
    "requestId": requestId,
    "triptype": triptype,
    "bookingType": bookingType,
    "bookingFor": bookingFor,
    "notes": notes,
    "date": date,
    "hotelid": hotelid,
    "cpy": cpy,
    "cpyid": cpyid,
    "drivercmpnyname": drivercmpnyname,
    "ridcpyid": ridcpyid,
    "ridercmpnyname": ridercmpnyname,
    "dvr": dvr,
    "dvrid": dvrid,
    "rid": rid,
    "ridrating": ridrating,
    "ridid": ridid,
    "fare": fare,
    "vehicle": vehicle,
    "service": service,
    "paymentSts": paymentSts,
    "paymentMode": paymentMode,
    "noofseats": noofseats,
    "additionalFee": additionalFee == null ? [] : List<dynamic>.from(additionalFee!.map((x) => x)),
    "estTime": estTime,
    "status": status,
    "tripOTP": tripOtp == null ? [] : List<dynamic>.from(tripOtp!.map((x) => x)),
    "paymenttxnid": paymenttxnid,
    "review": review,
    "reqDvr": reqDvr == null ? [] : List<dynamic>.from(reqDvr!.map((x) => x.toJson())),
    "curReq": curReq == null ? [] : List<dynamic>.from(curReq!.map((x) => x)),
    "needClear": needClear,
    "tripDT": tripDt,
    "utc": utc,
    "tripFDT": tripFdt?.toIso8601String(),
    "gmtTime": gmtTime,
    "scId": scId,
    "scity": scity,
    "isMultiLocation": isMultiLocation,
    "multiLocation": multiLocation == null ? [] : List<dynamic>.from(multiLocation!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "tripno": tripno,
    "__v": v,
    "driverfb": driverfb?.toJson(),
  };
}

class Acsp {
  int? companyAllowance;
  int? tollFee;
  int? endMeter;
  dynamic packageId;
  String? packageName;
  int? baseTime;
  int? returnTime;
  int? returnKm;
  int? hillKm;
  int? hillFare;
  int? driverEarning;
  int? dayFare;
  int? noOfNights;
  int? noOfDays;
  int? dayRate;
  int? nightFare;
  int? nightRate;
  int? gatewayCharge;
  int? drivermanualdiscountAmt;
  int? drivermanualconvenyancefee;
  int? base;
  String? dist;
  int? distfare;
  String? time;
  int? timefare;
  double? comison;
  int? cost;
  int? startMeter;
  DateTime? startTime;
  String? via;
  int? actualcost;
  double? bal;
  int? baseKm;
  int? booking;
  int? carddebt;
  String? chId;
  int? companyCommission;
  int? conveyance;
  int? costBeforeDiscount;
  int? detect;
  String? discountName;
  int? discountPercentage;
  List<DistanceObj>? distanceObj;
  DateTime? endTime;
  int? extraKm;
  int? extraTime;
  int? fareAmtBeforeSurge;
  int? fareForExtraKm;
  int? fareForExtraTime;
  String? fareType;
  int? farewithoutTaxNBookingFee;
  int? googleCharge;
  int? hotelcommision;
  bool? isNight;
  bool? isPeak;
  int? minFare;
  int? minFareAdded;
  String? minwaitingTime;
  int? nightPer;
  int? oldBalance;
  int? outstanding;
  int? peakPer;
  int? perKmRate;
  int? pgcharge;
  int? promoamt;
  double? roundOff;
  int? surgeAmt;
  String? surgeReason;
  double? tax;
  int? taxPercentage;
  int? taxPercentagecgst;
  int? taxPercentagesgst;
  double? taxcgst;
  double? taxsgst;
  int? timeRate;
  int? totalFareWithOutOldBal;
  String? totalwaitingTime;
  int? waitingCharge;
  int? waitingRate;
  String? waitingTime;
  int? walletdebt;

  Acsp({
    this.companyAllowance,
    this.tollFee,
    this.endMeter,
    this.packageId,
    this.packageName,
    this.baseTime,
    this.returnTime,
    this.returnKm,
    this.hillKm,
    this.hillFare,
    this.driverEarning,
    this.dayFare,
    this.noOfNights,
    this.noOfDays,
    this.dayRate,
    this.nightFare,
    this.nightRate,
    this.gatewayCharge,
    this.drivermanualdiscountAmt,
    this.drivermanualconvenyancefee,
    this.base,
    this.dist,
    this.distfare,
    this.time,
    this.timefare,
    this.comison,
    this.cost,
    this.startMeter,
    this.startTime,
    this.via,
    this.actualcost,
    this.bal,
    this.baseKm,
    this.booking,
    this.carddebt,
    this.chId,
    this.companyCommission,
    this.conveyance,
    this.costBeforeDiscount,
    this.detect,
    this.discountName,
    this.discountPercentage,
    this.distanceObj,
    this.endTime,
    this.extraKm,
    this.extraTime,
    this.fareAmtBeforeSurge,
    this.fareForExtraKm,
    this.fareForExtraTime,
    this.fareType,
    this.farewithoutTaxNBookingFee,
    this.googleCharge,
    this.hotelcommision,
    this.isNight,
    this.isPeak,
    this.minFare,
    this.minFareAdded,
    this.minwaitingTime,
    this.nightPer,
    this.oldBalance,
    this.outstanding,
    this.peakPer,
    this.perKmRate,
    this.pgcharge,
    this.promoamt,
    this.roundOff,
    this.surgeAmt,
    this.surgeReason,
    this.tax,
    this.taxPercentage,
    this.taxPercentagecgst,
    this.taxPercentagesgst,
    this.taxcgst,
    this.taxsgst,
    this.timeRate,
    this.totalFareWithOutOldBal,
    this.totalwaitingTime,
    this.waitingCharge,
    this.waitingRate,
    this.waitingTime,
    this.walletdebt,
  });

  factory Acsp.fromJson(Map<String, dynamic> json) => Acsp(
    companyAllowance: json["companyAllowance"],
    tollFee: json["tollFee"],
    endMeter: json["endMeter"],
    packageId: json["packageId"],
    packageName: json["packageName"],
    baseTime: json["baseTime"],
    returnTime: json["returnTime"],
    returnKm: json["returnKM"],
    hillKm: json["hillKm"],
    hillFare: json["hillFare"],
    driverEarning: json["driverEarning"],
    dayFare: json["dayFare"],
    noOfNights: json["noOfNights"],
    noOfDays: json["noOfDays"],
    dayRate: json["dayRate"],
    nightFare: json["nightFare"],
    nightRate: json["nightRate"],
    gatewayCharge: json["gatewayCharge"],
    drivermanualdiscountAmt: json["drivermanualdiscountAmt"],
    drivermanualconvenyancefee: json["drivermanualconvenyancefee"],
    base: json["base"],
    dist: json["dist"],
    distfare: json["distfare"],
    time: json["time"],
    timefare: json["timefare"],
    comison: json["comison"]?.toDouble(),
    cost: json["cost"],
    startMeter: json["startMeter"],
    startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
    via: json["via"],
    actualcost: json["actualcost"],
    bal: json["bal"]?.toDouble(),
    baseKm: json["baseKM"],
    booking: json["booking"],
    carddebt: json["carddebt"],
    chId: json["chId"],
    companyCommission: json["companyCommission"],
    conveyance: json["conveyance"],
    costBeforeDiscount: json["costBeforeDiscount"],
    detect: json["detect"],
    discountName: json["discountName"],
    discountPercentage: json["discountPercentage"],
    distanceObj: json["distanceObj"] == null ? [] : List<DistanceObj>.from(json["distanceObj"]!.map((x) => DistanceObj.fromJson(x))),
    endTime: json["endTime"] == null ? null : DateTime.parse(json["endTime"]),
    extraKm: json["extraKM"],
    extraTime: json["extraTime"],
    fareAmtBeforeSurge: json["fareAmtBeforeSurge"],
    fareForExtraKm: json["fareForExtraKM"],
    fareForExtraTime: json["fareForExtraTime"],
    fareType: json["fareType"],
    farewithoutTaxNBookingFee: json["farewithoutTaxNBookingFee"],
    googleCharge: json["googleCharge"],
    hotelcommision: json["hotelcommision"],
    isNight: json["isNight"],
    isPeak: json["isPeak"],
    minFare: json["minFare"],
    minFareAdded: json["minFareAdded"],
    minwaitingTime: json["minwaitingTime"],
    nightPer: json["nightPer"],
    oldBalance: json["oldBalance"],
    outstanding: json["outstanding"],
    peakPer: json["peakPer"],
    perKmRate: json["perKmRate"],
    pgcharge: json["pgcharge"],
    promoamt: json["promoamt"],
    roundOff: json["roundOff"]?.toDouble(),
    surgeAmt: json["surgeAmt"],
    surgeReason: json["surgeReason"],
    tax: json["tax"]?.toDouble(),
    taxPercentage: json["taxPercentage"],
    taxPercentagecgst: json["taxPercentagecgst"],
    taxPercentagesgst: json["taxPercentagesgst"],
    taxcgst: json["taxcgst"]?.toDouble(),
    taxsgst: json["taxsgst"]?.toDouble(),
    timeRate: json["timeRate"],
    totalFareWithOutOldBal: json["totalFareWithOutOldBal"],
    totalwaitingTime: json["totalwaitingTime"],
    waitingCharge: json["waitingCharge"],
    waitingRate: json["waitingRate"],
    waitingTime: json["waitingTime"],
    walletdebt: json["walletdebt"],
  );

  Map<String, dynamic> toJson() => {
    "companyAllowance": companyAllowance,
    "tollFee": tollFee,
    "endMeter": endMeter,
    "packageId": packageId,
    "packageName": packageName,
    "baseTime": baseTime,
    "returnTime": returnTime,
    "returnKM": returnKm,
    "hillKm": hillKm,
    "hillFare": hillFare,
    "driverEarning": driverEarning,
    "dayFare": dayFare,
    "noOfNights": noOfNights,
    "noOfDays": noOfDays,
    "dayRate": dayRate,
    "nightFare": nightFare,
    "nightRate": nightRate,
    "gatewayCharge": gatewayCharge,
    "drivermanualdiscountAmt": drivermanualdiscountAmt,
    "drivermanualconvenyancefee": drivermanualconvenyancefee,
    "base": base,
    "dist": dist,
    "distfare": distfare,
    "time": time,
    "timefare": timefare,
    "comison": comison,
    "cost": cost,
    "startMeter": startMeter,
    "startTime": startTime?.toIso8601String(),
    "via": via,
    "actualcost": actualcost,
    "bal": bal,
    "baseKM": baseKm,
    "booking": booking,
    "carddebt": carddebt,
    "chId": chId,
    "companyCommission": companyCommission,
    "conveyance": conveyance,
    "costBeforeDiscount": costBeforeDiscount,
    "detect": detect,
    "discountName": discountName,
    "discountPercentage": discountPercentage,
    "distanceObj": distanceObj == null ? [] : List<dynamic>.from(distanceObj!.map((x) => x.toJson())),
    "endTime": endTime?.toIso8601String(),
    "extraKM": extraKm,
    "extraTime": extraTime,
    "fareAmtBeforeSurge": fareAmtBeforeSurge,
    "fareForExtraKM": fareForExtraKm,
    "fareForExtraTime": fareForExtraTime,
    "fareType": fareType,
    "farewithoutTaxNBookingFee": farewithoutTaxNBookingFee,
    "googleCharge": googleCharge,
    "hotelcommision": hotelcommision,
    "isNight": isNight,
    "isPeak": isPeak,
    "minFare": minFare,
    "minFareAdded": minFareAdded,
    "minwaitingTime": minwaitingTime,
    "nightPer": nightPer,
    "oldBalance": oldBalance,
    "outstanding": outstanding,
    "peakPer": peakPer,
    "perKmRate": perKmRate,
    "pgcharge": pgcharge,
    "promoamt": promoamt,
    "roundOff": roundOff,
    "surgeAmt": surgeAmt,
    "surgeReason": surgeReason,
    "tax": tax,
    "taxPercentage": taxPercentage,
    "taxPercentagecgst": taxPercentagecgst,
    "taxPercentagesgst": taxPercentagesgst,
    "taxcgst": taxcgst,
    "taxsgst": taxsgst,
    "timeRate": timeRate,
    "totalFareWithOutOldBal": totalFareWithOutOldBal,
    "totalwaitingTime": totalwaitingTime,
    "waitingCharge": waitingCharge,
    "waitingRate": waitingRate,
    "waitingTime": waitingTime,
    "walletdebt": walletdebt,
  };
}

class DistanceObj {
  String? distanceFrom;
  String? distanceTo;
  String? distanceFareType;
  dynamic distanceFarePerKm;
  int? distanceFarePerFlatRate;
  bool? applyTax;
  bool? applyWaitingTime;
  bool? applyNightCharge;
  bool? applyPeakCharge;
  bool? applyCommission;
  bool? applyPickupCharge;
  int? totalmin;
  bool? cmpyAllowance;
  int? discount;
  int? offerPerDay;
  int? offerPerUser;
  int? additionalFarePerHrs;
  String? id;

  DistanceObj({
    this.distanceFrom,
    this.distanceTo,
    this.distanceFareType,
    this.distanceFarePerKm,
    this.distanceFarePerFlatRate,
    this.applyTax,
    this.applyWaitingTime,
    this.applyNightCharge,
    this.applyPeakCharge,
    this.applyCommission,
    this.applyPickupCharge,
    this.totalmin,
    this.cmpyAllowance,
    this.discount,
    this.offerPerDay,
    this.offerPerUser,
    this.additionalFarePerHrs,
    this.id,
  });

  factory DistanceObj.fromJson(Map<String, dynamic> json) => DistanceObj(
    distanceFrom: json["distanceFrom"],
    distanceTo: json["distanceTo"],
    distanceFareType: json["distanceFareType"],
    distanceFarePerKm: json["distanceFarePerKM"],
    distanceFarePerFlatRate: json["distanceFarePerFlatRate"],
    applyTax: json["applyTax"],
    applyWaitingTime: json["applyWaitingTime"],
    applyNightCharge: json["applyNightCharge"],
    applyPeakCharge: json["applyPeakCharge"],
    applyCommission: json["applyCommission"],
    applyPickupCharge: json["applyPickupCharge"],
    totalmin: json["totalmin"],
    cmpyAllowance: json["cmpyAllowance"],
    discount: json["discount"],
    offerPerDay: json["offerPerDay"],
    offerPerUser: json["offerPerUser"],
    additionalFarePerHrs: json["additionalFarePerHrs"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "distanceFrom": distanceFrom,
    "distanceTo": distanceTo,
    "distanceFareType": distanceFareType,
    "distanceFarePerKM": distanceFarePerKm,
    "distanceFarePerFlatRate": distanceFarePerFlatRate,
    "applyTax": applyTax,
    "applyWaitingTime": applyWaitingTime,
    "applyNightCharge": applyNightCharge,
    "applyPeakCharge": applyPeakCharge,
    "applyCommission": applyCommission,
    "applyPickupCharge": applyPickupCharge,
    "totalmin": totalmin,
    "cmpyAllowance": cmpyAllowance,
    "discount": discount,
    "offerPerDay": offerPerDay,
    "offerPerUser": offerPerUser,
    "additionalFarePerHrs": additionalFarePerHrs,
    "_id": id,
  };
}

class Adsp {
  String? start;
  String? end;
  String? from;
  String? to;
  double? pLat;
  double? pLng;
  double? dLat;
  double? dLng;
  String? distanceKm;
  String? estTime;
  String? map;

  Adsp({
    this.start,
    this.end,
    this.from,
    this.to,
    this.pLat,
    this.pLng,
    this.dLat,
    this.dLng,
    this.distanceKm,
    this.estTime,
    this.map,
  });

  factory Adsp.fromJson(Map<String, dynamic> json) => Adsp(
    start: json["start"],
    end: json["end"],
    from: json["from"],
    to: json["to"],
    pLat: json["pLat"]?.toDouble(),
    pLng: json["pLng"]?.toDouble(),
    dLat: json["dLat"]?.toDouble(),
    dLng: json["dLng"]?.toDouble(),
    distanceKm: json["distanceKM"],
    estTime: json["estTime"],
    map: json["map"],
  );

  Map<String, dynamic> toJson() => {
    "start": start,
    "end": end,
    "from": from,
    "to": to,
    "pLat": pLat,
    "pLng": pLng,
    "dLat": dLat,
    "dLng": dLng,
    "distanceKM": distanceKm,
    "estTime": estTime,
    "map": map,
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

class Csp {
  int? booking;
  int? base;
  String? dist;
  double? distfare;
  int? perKmRate;
  String? time;
  int? timefare;
  double? comison;
  int? hotelcommision;
  String? promo;
  int? promoamt;
  int? minFareAdded;
  int? minFare;
  int? travelRate;
  double? travelFare;
  double? cost;
  int? conveyance;
  double? tax;
  String? via;
  int? taxPercentage;
  int? driverCancelFee;
  int? riderCancelFee;
  bool? isNight;
  bool? isPeak;
  int? nightPer;
  int? peakPer;
  dynamic surgeAmt;
  int? baseKm;
  double? extraKm;
  double? fareForExtraKm;
  int? baseTime;
  int? extraTime;
  double? fareForExtraTime;
  int? oldBalance;
  int? googleCharge;
  int? pgcharge;
  dynamic distanceObj;
  int? companyAllowance;
  int? companyCommission;
  int? taxPercentagecgst;
  int? taxcgst;
  int? taxPercentagesgst;
  int? taxsgst;
  String? surgeReason;
  dynamic packageId;
  String? packageName;
  int? dayFare;


  Csp({
    this.booking,
    this.base,
    this.dist,
    this.distfare,
    this.perKmRate,
    this.time,
    this.timefare,
    this.comison,
    this.hotelcommision,
    this.promo,
    this.promoamt,
    this.minFareAdded,
    this.minFare,
    this.travelRate,
    this.travelFare,
    this.cost,
    this.conveyance,
    this.tax,
    this.via,
    this.taxPercentage,
    this.driverCancelFee,
    this.riderCancelFee,
    this.isNight,
    this.isPeak,
    this.nightPer,
    this.peakPer,
    this.surgeAmt,
    this.baseKm,
    this.extraKm,
    this.fareForExtraKm,
    this.baseTime,
    this.extraTime,
    this.fareForExtraTime,
    this.oldBalance,
    this.googleCharge,
    this.pgcharge,
    this.distanceObj,
    this.companyAllowance,
    this.companyCommission,
    this.taxPercentagecgst,
    this.taxcgst,
    this.taxPercentagesgst,
    this.taxsgst,
    this.surgeReason,
    this.packageId,
    this.packageName,
    this.dayFare,

  });

  factory Csp.fromJson(Map<String, dynamic> json) => Csp(
    booking: json["booking"],
    base: json["base"],
    dist: json["dist"],
    distfare: json["distfare"]?.toDouble(),
    perKmRate: json["perKmRate"],
    time: json["time"],
    timefare: json["timefare"],
    comison: json["comison"]?.toDouble(),
    hotelcommision: json["hotelcommision"],
    promo: json["promo"],
    promoamt: json["promoamt"],
    minFareAdded: json["minFareAdded"],
    minFare: json["minFare"],
    travelRate: json["travelRate"],
    travelFare: json["travelFare"]?.toDouble(),
    cost: json["cost"]?.toDouble(),
    conveyance: json["conveyance"],
    tax: json["tax"]?.toDouble(),
    via: json["via"],
    taxPercentage: json["taxPercentage"],
    driverCancelFee: json["driverCancelFee"],
    riderCancelFee: json["riderCancelFee"],
    isNight: json["isNight"],
    isPeak: json["isPeak"],
    peakPer: json["peakPer"],
    surgeAmt: json["surgeAmt"],
    baseKm: json["baseKM"],
    extraKm: json["extraKM"]?.toDouble(),
    fareForExtraKm: json["fareForExtraKM"]?.toDouble(),
    baseTime: json["baseTime"],
    extraTime: json["extraTime"],
    fareForExtraTime: json["fareForExtraTime"]?.toDouble(),
    oldBalance: json["oldBalance"],
    googleCharge: json["googleCharge"],
    pgcharge: json["pgcharge"],
    distanceObj: json["distanceObj"],
    companyAllowance: json["companyAllowance"],
    companyCommission: json["companyCommission"],
    taxPercentagecgst: json["taxPercentagecgst"],
    taxcgst: json["taxcgst"],
    taxPercentagesgst: json["taxPercentagesgst"],
    taxsgst: json["taxsgst"],
    surgeReason: json["surgeReason"],
    packageId: json["packageId"],
    packageName: json["packageName"],
    dayFare: json["dayFare"],

  );

  Map<String, dynamic> toJson() => {
    "booking": booking,
    "base": base,
    "dist": dist,
    "distfare": distfare,
    "perKmRate": perKmRate,
    "time": time,
    "timefare": timefare,
    "comison": comison,
    "hotelcommision": hotelcommision,
    "promo": promo,
    "promoamt": promoamt,
    "minFareAdded": minFareAdded,
    "minFare": minFare,
    "travelRate": travelRate,
    "travelFare": travelFare,
    "cost": cost,
    "conveyance": conveyance,
    "tax": tax,
    "via": via,
    "taxPercentage": taxPercentage,
    "driverCancelFee": driverCancelFee,
    "riderCancelFee": riderCancelFee,
    "isNight": isNight,
    "isPeak": isPeak,
    "nightPer": nightPer,
    "peakPer": peakPer,
    "surgeAmt": surgeAmt,
    "baseKM": baseKm,
    "extraKM": extraKm,
    "fareForExtraKM": fareForExtraKm,
    "baseTime": baseTime,
    "extraTime": extraTime,
    "fareForExtraTime": fareForExtraTime,
    "oldBalance": oldBalance,
    "googleCharge": googleCharge,
    "pgcharge": pgcharge,
    "distanceObj": distanceObj,
    "companyAllowance": companyAllowance,
    "companyCommission": companyCommission,
    "taxPercentagecgst": taxPercentagecgst,
    "taxcgst": taxcgst,
    "taxPercentagesgst": taxPercentagesgst,
    "taxsgst": taxsgst,
    "surgeReason": surgeReason,
    "packageId": packageId,
    "packageName": packageName,
    "dayFare": dayFare,
  };
}

class Driverfb {
  String? rating;
  String? cmts;

  Driverfb({
    this.rating,
    this.cmts,
  });

  factory Driverfb.fromJson(Map<String, dynamic> json) => Driverfb(
    rating: json["rating"],
    cmts: json["cmts"],
  );

  Map<String, dynamic> toJson() => {
    "rating": rating,
    "cmts": cmts,
  };
}

class Dsp {
  String? distanceKm;
  String? estTime;
  String? start;
  String? end;
  List<double>? startcoords;
  List<double>? endcoords;
  String? startDay;
  String? returnDay;
  String? outstationType;

  Dsp({
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

  factory Dsp.fromJson(Map<String, dynamic> json) => Dsp(
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

class Other {
  String? ph;
  String? phCode;
  String? name;
  dynamic email;

  Other({
    this.ph,
    this.phCode,
    this.name,
    this.email,
  });

  factory Other.fromJson(Map<String, dynamic> json) => Other(
    ph: json["ph"],
    phCode: json["phCode"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "ph": ph,
    "phCode": phCode,
    "name": name,
    "email": email,
  };
}

class ReqDvr {
  String? drvId;
  int? called;
  int? distVal;

  ReqDvr({
    this.drvId,
    this.called,
    this.distVal,
  });

  factory ReqDvr.fromJson(Map<String, dynamic> json) => ReqDvr(
    drvId: json["drvId"],
    called: json["called"],
    distVal: json["distVal"],
  );

  Map<String, dynamic> toJson() => {
    "drvId": drvId,
    "called": called,
    "distVal": distVal,
  };
}

class Scheduletripprocess {
  String? tripprocessstatus;
  List<dynamic>? tripintresteddrivers;
  dynamic userrequesteddriver;
  dynamic acceptriderid;
  dynamic acceptdriverid;
  List<dynamic>? tripdeclinedrivers;
  String? riderrequestwaitingtime;
  DateTime? acceptriderdate;

  Scheduletripprocess({
    this.tripprocessstatus,
    this.tripintresteddrivers,
    this.userrequesteddriver,
    this.acceptriderid,
    this.acceptdriverid,
    this.tripdeclinedrivers,
    this.riderrequestwaitingtime,
    this.acceptriderdate,
  });

  factory Scheduletripprocess.fromJson(Map<String, dynamic> json) => Scheduletripprocess(
    tripprocessstatus: json["tripprocessstatus"],
    tripintresteddrivers: json["tripintresteddrivers"] == null ? [] : List<dynamic>.from(json["tripintresteddrivers"]!.map((x) => x)),
    userrequesteddriver: json["userrequesteddriver"],
    acceptriderid: json["acceptriderid"],
    acceptdriverid: json["acceptdriverid"],
    tripdeclinedrivers: json["tripdeclinedrivers"] == null ? [] : List<dynamic>.from(json["tripdeclinedrivers"]!.map((x) => x)),
    riderrequestwaitingtime: json["riderrequestwaitingtime"],
    acceptriderdate: json["acceptriderdate"] == null ? null : DateTime.parse(json["acceptriderdate"]),
  );

  Map<String, dynamic> toJson() => {
    "tripprocessstatus": tripprocessstatus,
    "tripintresteddrivers": tripintresteddrivers == null ? [] : List<dynamic>.from(tripintresteddrivers!.map((x) => x)),
    "userrequesteddriver": userrequesteddriver,
    "acceptriderid": acceptriderid,
    "acceptdriverid": acceptdriverid,
    "tripdeclinedrivers": tripdeclinedrivers == null ? [] : List<dynamic>.from(tripdeclinedrivers!.map((x) => x)),
    "riderrequestwaitingtime": riderrequestwaitingtime,
    "acceptriderdate": acceptriderdate?.toIso8601String(),
  };
}

class Tripinvoicedriverdetails {
  String? driverbussinessname;
  String? driveraddress;
  String? drivergstNo;
  String? driverpancardNo;
  String? drivername;
  String? driverphone;
  String? drivervehicletype;
  String? drivervehicleNumber;

  Tripinvoicedriverdetails({
    this.driverbussinessname,
    this.driveraddress,
    this.drivergstNo,
    this.driverpancardNo,
    this.drivername,
    this.driverphone,
    this.drivervehicletype,
    this.drivervehicleNumber,
  });

  factory Tripinvoicedriverdetails.fromJson(Map<String, dynamic> json) => Tripinvoicedriverdetails(
    driverbussinessname: json["driverbussinessname"],
    driveraddress: json["driveraddress"],
    drivergstNo: json["drivergstNo"],
    driverpancardNo: json["driverpancardNo"],
    drivername: json["drivername"],
    driverphone: json["driverphone"],
    drivervehicletype: json["drivervehicletype"],
    drivervehicleNumber: json["drivervehicleNumber"],
  );

  Map<String, dynamic> toJson() => {
    "driverbussinessname": driverbussinessname,
    "driveraddress": driveraddress,
    "drivergstNo": drivergstNo,
    "driverpancardNo": driverpancardNo,
    "drivername": drivername,
    "driverphone": driverphone,
    "drivervehicletype": drivervehicletype,
    "drivervehicleNumber": drivervehicleNumber,
  };
}
