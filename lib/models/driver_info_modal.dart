// To parse this JSON data, do
//
//     final driverInfoModal = driverInfoModalFromMap(jsonString);

import 'dart:convert';

List<DriverInfoModal> driverInfoModalFromMap(String str) => List<DriverInfoModal>.from(json.decode(str).map((x) => DriverInfoModal.fromMap(x)));

String driverInfoModalToMap(List<DriverInfoModal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class DriverInfoModal {
  final Rating? rating;
  final TodayAmt? todayAmt;
  final DriverLocation? driverLocation;
  final String? nic;
  final String? phcode;
  final dynamic dob;
  final String? address;
  final String? bussinessname;
  final String? gstNo;
  final String? pancardNo;
  final dynamic cmpy;
  final String? cmpyname;
  final bool? isIndividual;
  final bool? isHail;
  final String? cur;
  final bool? actstatus;
  final String? profile;
  final String? baseurl;
  final String? nationIdback;
  final String? licenceBackImg;
  final String? licence;
  final String? licenceNo;
  final dynamic licenceexp;
  final String? insurance;
  final String? insuranceBackImg;
  final dynamic insuranceexp;
  final String? passing;
  final String? passingBackImg;
  final dynamic passingexp;
  final String? revenue;
  final dynamic revenueexp;
  final String? currentTaxi;
  final String? serviceStatus;
  final String? curService;
  final String? curStatus;
  final String? curVehicleNo;
  final String? others1;
  final String? vinNumber;
  final bool? share;
  final int? noofshare;
  final int? sharebooked;
  final bool? online;
  final int? wallet;
  final int? canceledCount;
  final String? lastCanceledDate;
  final String? curTrip;
  final bool? isConnected;
  final String? fcmId;
  final String? lastIn;
  final dynamic lastOut;
  final dynamic lastUpdate;
  final dynamic lastCron;
  final String? scId;
  final String? scity;
  final String? softdel;
  final String? verificationCode;
  final String? loginType;
  final String? loginId;
  final String? callmask;
  final String? blockuptoDate;
  final dynamic subcriptionEndDate;
  final bool? isSubcriptionActive;
  final String? referenceCode;
  final bool? isDaily;
  final bool? isRental;
  final bool? isOutstation;
  final String? referal;
  final String? walletType;
  final bool? isMini;
  final int? referalwalletcredits;
  final int? totaldriverdocumnetcount;
  final int? driveruploaddocumentlength;
  final int? totaltaxiscount;
  final int? totaltaxisdocumnetcount;
  final int? driveruploadtaxidocumentlength;
  final String? id;
  final String? code;
  final String? fname;
  final String? email;
  final String? phone;
  final String? gender;
  final String? cnty;
  final String? state;
  final String? statename;
  final String? city;
  final String? cityname;
  final String? lang;
  final List<Status>? status;
  final String? createdAt;
  final List<dynamic>? emgContact;
  final List<dynamic>? taxis;
  final List<dynamic>? document;
  final int? v;
  final String? profileurl;
  final dynamic currentActiveTaxi;
  final bool? isDriverCreditModuleEnabledForUseAfterLogin;
  final int? walletCredit;
  final String? googleApiKey;
  final String? iosgoogleApi;
  final int? walletLimit;
  final String? limitAlert;

  DriverInfoModal({
    this.rating,
    this.todayAmt,
    this.driverLocation,
    this.nic,
    this.phcode,
    this.dob,
    this.address,
    this.bussinessname,
    this.gstNo,
    this.pancardNo,
    this.cmpy,
    this.cmpyname,
    this.isIndividual,
    this.isHail,
    this.cur,
    this.actstatus,
    this.profile,
    this.baseurl,
    this.nationIdback,
    this.licenceBackImg,
    this.licence,
    this.licenceNo,
    this.licenceexp,
    this.insurance,
    this.insuranceBackImg,
    this.insuranceexp,
    this.passing,
    this.passingBackImg,
    this.passingexp,
    this.revenue,
    this.revenueexp,
    this.currentTaxi,
    this.serviceStatus,
    this.curService,
    this.curStatus,
    this.curVehicleNo,
    this.others1,
    this.vinNumber,
    this.share,
    this.noofshare,
    this.sharebooked,
    this.online,
    this.wallet,
    this.canceledCount,
    this.lastCanceledDate,
    this.curTrip,
    this.isConnected,
    this.fcmId,
    this.lastIn,
    this.lastOut,
    this.lastUpdate,
    this.lastCron,
    this.scId,
    this.scity,
    this.softdel,
    this.verificationCode,
    this.loginType,
    this.loginId,
    this.callmask,
    this.blockuptoDate,
    this.subcriptionEndDate,
    this.isSubcriptionActive,
    this.referenceCode,
    this.isDaily,
    this.isRental,
    this.isOutstation,
    this.referal,
    this.walletType,
    this.isMini,
    this.referalwalletcredits,
    this.totaldriverdocumnetcount,
    this.driveruploaddocumentlength,
    this.totaltaxiscount,
    this.totaltaxisdocumnetcount,
    this.driveruploadtaxidocumentlength,
    this.id,
    this.code,
    this.fname,
    this.email,
    this.phone,
    this.gender,
    this.cnty,
    this.state,
    this.statename,
    this.city,
    this.cityname,
    this.lang,
    this.status,
    this.createdAt,
    this.emgContact,
    this.taxis,
    this.document,
    this.v,
    this.profileurl,
    this.currentActiveTaxi,
    this.isDriverCreditModuleEnabledForUseAfterLogin,
    this.walletCredit,
    this.googleApiKey,
    this.iosgoogleApi,
    this.walletLimit,
    this.limitAlert,
  });

  factory DriverInfoModal.fromMap(Map<String, dynamic> json) => DriverInfoModal(
    rating: json["rating"] == null ? null : Rating.fromMap(json["rating"]),
    todayAmt: json["todayAmt"] == null ? null : TodayAmt.fromMap(json["todayAmt"]),
    driverLocation: json["driverLocation"] == null ? null : DriverLocation.fromMap(json["driverLocation"]),
    nic: json["nic"],
    phcode: json["phcode"],
    dob: json["DOB"],
    address: json["address"],
    bussinessname: json["bussinessname"],
    gstNo: json["gstNo"],
    pancardNo: json["pancardNo"],
    cmpy: json["cmpy"],
    cmpyname: json["cmpyname"],
    isIndividual: json["isIndividual"],
    isHail: json["isHail"],
    cur: json["cur"],
    actstatus: json["actstatus"],
    profile: json["profile"],
    baseurl: json["baseurl"],
    nationIdback: json["nationIdback"],
    licenceBackImg: json["licenceBackImg"],
    licence: json["licence"],
    licenceNo: json["licenceNo"],
    licenceexp: json["licenceexp"],
    insurance: json["insurance"],
    insuranceBackImg: json["insuranceBackImg"],
    insuranceexp: json["insuranceexp"],
    passing: json["passing"],
    passingBackImg: json["passingBackImg"],
    passingexp: json["passingexp"],
    revenue: json["revenue"],
    revenueexp: json["revenueexp"],
    currentTaxi: json["currentTaxi"],
    serviceStatus: json["serviceStatus"],
    curService: json["curService"],
    curStatus: json["curStatus"],
    curVehicleNo: json["curVehicleNo"],
    others1: json["others1"],
    vinNumber: json["vin_number"],
    share: json["share"],
    noofshare: json["noofshare"],
    sharebooked: json["sharebooked"],
    online: json["online"],
    wallet: json["wallet"],
    canceledCount: json["canceledCount"],
    lastCanceledDate: json["lastCanceledDate"],
    curTrip: json["curTrip"],
    isConnected: json["isConnected"],
    fcmId: json["fcmId"],
    lastIn: json["last_in"],
    lastOut: json["last_out"],
    lastUpdate: json["lastUpdate"],
    lastCron: json["lastCron"],
    scId: json["scId"],
    scity: json["scity"],
    softdel: json["softdel"],
    verificationCode: json["verificationCode"],
    loginType: json["loginType"],
    loginId: json["loginId"],
    callmask: json["callmask"],
    blockuptoDate: json["blockuptoDate"],
    subcriptionEndDate: json["subcriptionEndDate"],
    isSubcriptionActive: json["isSubcriptionActive"],
    referenceCode: json["referenceCode"],
    isDaily: json["isDaily"],
    isRental: json["isRental"],
    isOutstation: json["isOutstation"],
    referal: json["referal"],
    walletType: json["walletType"],
    isMini: json["isMini"],
    referalwalletcredits: json["referalwalletcredits"],
    totaldriverdocumnetcount: json["totaldriverdocumnetcount"],
    driveruploaddocumentlength: json["driveruploaddocumentlength"],
    totaltaxiscount: json["totaltaxiscount"],
    totaltaxisdocumnetcount: json["totaltaxisdocumnetcount"],
    driveruploadtaxidocumentlength: json["driveruploadtaxidocumentlength"],
    id: json["_id"],
    code: json["code"],
    fname: json["fname"],
    email: json["email"],
    phone: json["phone"],
    gender: json["gender"],
    cnty: json["cnty"],
    state: json["state"],
    statename: json["statename"],
    city: json["city"],
    cityname: json["cityname"],
    lang: json["lang"],
    status: json["status"] == null ? [] : List<Status>.from(json["status"]!.map((x) => Status.fromMap(x))),
    createdAt: json["createdAt"],
    emgContact: json["EmgContact"] == null ? [] : List<dynamic>.from(json["EmgContact"]!.map((x) => x)),
    taxis: json["taxis"] == null ? [] : List<dynamic>.from(json["taxis"]!.map((x) => x)),
    document: json["document"] == null ? [] : List<dynamic>.from(json["document"]!.map((x) => x)),
    v: json["__v"],
    profileurl: json["profileurl"],
    currentActiveTaxi: json["currentActiveTaxi"],
    isDriverCreditModuleEnabledForUseAfterLogin: json["isDriverCreditModuleEnabledForUseAfterLogin"],
    walletCredit: json["walletCredit"],
    googleApiKey: json["GoogleApiKey"],
    iosgoogleApi: json["iosgoogleApi"],
    walletLimit: json["walletLimit"],
    limitAlert: json["LimitAlert"],
  );

  Map<String, dynamic> toMap() => {
    "rating": rating?.toMap(),
    "todayAmt": todayAmt?.toMap(),
    "driverLocation": driverLocation?.toMap(),
    "nic": nic,
    "phcode": phcode,
    "DOB": dob,
    "address": address,
    "bussinessname": bussinessname,
    "gstNo": gstNo,
    "pancardNo": pancardNo,
    "cmpy": cmpy,
    "cmpyname": cmpyname,
    "isIndividual": isIndividual,
    "isHail": isHail,
    "cur": cur,
    "actstatus": actstatus,
    "profile": profile,
    "baseurl": baseurl,
    "nationIdback": nationIdback,
    "licenceBackImg": licenceBackImg,
    "licence": licence,
    "licenceNo": licenceNo,
    "licenceexp": licenceexp,
    "insurance": insurance,
    "insuranceBackImg": insuranceBackImg,
    "insuranceexp": insuranceexp,
    "passing": passing,
    "passingBackImg": passingBackImg,
    "passingexp": passingexp,
    "revenue": revenue,
    "revenueexp": revenueexp,
    "currentTaxi": currentTaxi,
    "serviceStatus": serviceStatus,
    "curService": curService,
    "curStatus": curStatus,
    "curVehicleNo": curVehicleNo,
    "others1": others1,
    "vin_number": vinNumber,
    "share": share,
    "noofshare": noofshare,
    "sharebooked": sharebooked,
    "online": online,
    "wallet": wallet,
    "canceledCount": canceledCount,
    "lastCanceledDate": lastCanceledDate,
    "curTrip": curTrip,
    "isConnected": isConnected,
    "fcmId": fcmId,
    "last_in": lastIn,
    "last_out": lastOut,
    "lastUpdate": lastUpdate,
    "lastCron": lastCron,
    "scId": scId,
    "scity": scity,
    "softdel": softdel,
    "verificationCode": verificationCode,
    "loginType": loginType,
    "loginId": loginId,
    "callmask": callmask,
    "blockuptoDate": blockuptoDate,
    "subcriptionEndDate": subcriptionEndDate,
    "isSubcriptionActive": isSubcriptionActive,
    "referenceCode": referenceCode,
    "isDaily": isDaily,
    "isRental": isRental,
    "isOutstation": isOutstation,
    "referal": referal,
    "walletType": walletType,
    "isMini": isMini,
    "referalwalletcredits": referalwalletcredits,
    "totaldriverdocumnetcount": totaldriverdocumnetcount,
    "driveruploaddocumentlength": driveruploaddocumentlength,
    "totaltaxiscount": totaltaxiscount,
    "totaltaxisdocumnetcount": totaltaxisdocumnetcount,
    "driveruploadtaxidocumentlength": driveruploadtaxidocumentlength,
    "_id": id,
    "code": code,
    "fname": fname,
    "email": email,
    "phone": phone,
    "gender": gender,
    "cnty": cnty,
    "state": state,
    "statename": statename,
    "city": city,
    "cityname": cityname,
    "lang": lang,
    "status": status == null ? [] : List<dynamic>.from(status!.map((x) => x.toMap())),
    "createdAt": createdAt,
    "EmgContact": emgContact == null ? [] : List<dynamic>.from(emgContact!.map((x) => x)),
    "taxis": taxis == null ? [] : List<dynamic>.from(taxis!.map((x) => x)),
    "document": document == null ? [] : List<dynamic>.from(document!.map((x) => x)),
    "__v": v,
    "profileurl": profileurl,
    "currentActiveTaxi": currentActiveTaxi,
    "isDriverCreditModuleEnabledForUseAfterLogin": isDriverCreditModuleEnabledForUseAfterLogin,
    "walletCredit": walletCredit,
    "GoogleApiKey": googleApiKey,
    "iosgoogleApi": iosgoogleApi,
    "walletLimit": walletLimit,
    "LimitAlert": limitAlert,
  };
}

class DriverLocation {
  final String? type;

  DriverLocation({
    this.type,
  });

  factory DriverLocation.fromMap(Map<String, dynamic> json) => DriverLocation(
    type: json["type"],
  );

  Map<String, dynamic> toMap() => {
    "type": type,
  };
}

class Rating {
  final String? rating;
  final int? nos;
  final int? tottrip;
  final int? star;
  final String? cmts;

  Rating({
    this.rating,
    this.nos,
    this.tottrip,
    this.star,
    this.cmts,
  });

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
    rating: json["rating"],
    nos: json["nos"],
    tottrip: json["tottrip"],
    star: json["star"],
    cmts: json["cmts"],
  );

  Map<String, dynamic> toMap() => {
    "rating": rating,
    "nos": nos,
    "tottrip": tottrip,
    "star": star,
    "cmts": cmts,
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

class TodayAmt {
  final dynamic lastdate;
  final int? trips;
  final int? amt;

  TodayAmt({
    this.lastdate,
    this.trips,
    this.amt,
  });

  factory TodayAmt.fromMap(Map<String, dynamic> json) => TodayAmt(
    lastdate: json["lastdate"],
    trips: json["trips"],
    amt: json["amt"],
  );

  Map<String, dynamic> toMap() => {
    "lastdate": lastdate,
    "trips": trips,
    "amt": amt,
  };
}
