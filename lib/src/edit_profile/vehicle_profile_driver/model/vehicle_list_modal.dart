// To parse this JSON data, do
//
//     final vehicleListModal = vehicleListModalFromMap(jsonString);

import 'dart:convert';

List<VehicleListModal> vehicleListModalFromMap(String str) => List<VehicleListModal>.from(json.decode(str).map((x) => VehicleListModal.fromMap(x)));

String vehicleListModalToMap(List<VehicleListModal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class VehicleListModal {
  final String? ownername;
  final String? handicap;
  final List<Type>? type;
  final String? insurance;
  final dynamic insuranceexpdate;
  final String? insurancenumber;
  final String? permit;
  final dynamic permitexpdate;
  final String? registration;
  final String? registrationBack;
  final dynamic registrationexpdate;
  final String? registrationnumber;
  final String? chaisis;
  final String? vinNumber;
  final String? others1;
  final String? vehicletype;
  final bool? share;
  final int? noofshare;
  final String? taxistatus;
  final String? image;
  final String? imageBack;
  final List<dynamic>? lowCategoryOptions;
  final bool? isDaily;
  final bool? isRental;
  final bool? isOutstation;
  final bool? isMini;
  final String? id;
  final String? makename;
  final String? model;
  final String? year;
  final String? licence;
  final String? cpy;
  final String? driver;
  final String? color;
  final List<Document>? document;

  VehicleListModal({
    this.ownername,
    this.handicap,
    this.type,
    this.insurance,
    this.insuranceexpdate,
    this.insurancenumber,
    this.permit,
    this.permitexpdate,
    this.registration,
    this.registrationBack,
    this.registrationexpdate,
    this.registrationnumber,
    this.chaisis,
    this.vinNumber,
    this.others1,
    this.vehicletype,
    this.share,
    this.noofshare,
    this.taxistatus,
    this.image,
    this.imageBack,
    this.lowCategoryOptions,
    this.isDaily,
    this.isRental,
    this.isOutstation,
    this.isMini,
    this.id,
    this.makename,
    this.model,
    this.year,
    this.licence,
    this.cpy,
    this.driver,
    this.color,
    this.document,
  });

  factory VehicleListModal.fromMap(Map<String, dynamic> json) => VehicleListModal(
    ownername: json["ownername"],
    handicap: json["handicap"],
    type: json["type"] == null ? [] : List<Type>.from(json["type"]!.map((x) => Type.fromMap(x))),
    insurance: json["insurance"],
    insuranceexpdate: json["insuranceexpdate"],
    insurancenumber: json["insurancenumber"],
    permit: json["permit"],
    permitexpdate: json["permitexpdate"],
    registration: json["registration"],
    registrationBack: json["registrationBack"],
    registrationexpdate: json["registrationexpdate"],
    registrationnumber: json["registrationnumber"],
    chaisis: json["chaisis"],
    vinNumber: json["vin_number"],
    others1: json["others1"],
    vehicletype: json["vehicletype"],
    share: json["share"],
    noofshare: json["noofshare"],
    taxistatus: json["taxistatus"],
    image: json["image"],
    imageBack: json["imageBack"],
    lowCategoryOptions: json["lowCategoryOptions"] == null ? [] : List<dynamic>.from(json["lowCategoryOptions"]!.map((x) => x)),
    isDaily: json["isDaily"],
    isRental: json["isRental"],
    isOutstation: json["isOutstation"],
    isMini: json["isMini"],
    id: json["_id"],
    makename: json["makename"],
    model: json["model"],
    year: json["year"],
    licence: json["licence"],
    cpy: json["cpy"],
    driver: json["driver"],
    color: json["color"],
    document: json["document"] == null ? [] : List<Document>.from(json["document"]!.map((x) => Document.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "ownername": ownername,
    "handicap": handicap,
    "type": type == null ? [] : List<dynamic>.from(type!.map((x) => x.toMap())),
    "insurance": insurance,
    "insuranceexpdate": insuranceexpdate,
    "insurancenumber": insurancenumber,
    "permit": permit,
    "permitexpdate": permitexpdate,
    "registration": registration,
    "registrationBack": registrationBack,
    "registrationexpdate": registrationexpdate,
    "registrationnumber": registrationnumber,
    "chaisis": chaisis,
    "vin_number": vinNumber,
    "others1": others1,
    "vehicletype": vehicletype,
    "share": share,
    "noofshare": noofshare,
    "taxistatus": taxistatus,
    "image": image,
    "imageBack": imageBack,
    "lowCategoryOptions": lowCategoryOptions == null ? [] : List<dynamic>.from(lowCategoryOptions!.map((x) => x)),
    "isDaily": isDaily,
    "isRental": isRental,
    "isOutstation": isOutstation,
    "isMini": isMini,
    "_id": id,
    "makename": makename,
    "model": model,
    "year": year,
    "licence": licence,
    "cpy": cpy,
    "driver": driver,
    "color": color,
    "document": document == null ? [] : List<dynamic>.from(document!.map((x) => x.toMap())),
  };
}

class Document {
  final String? id;
  final String? name;
  final List<Field>? field;

  Document({
    this.id,
    this.name,
    this.field,
  });

  factory Document.fromMap(Map<String, dynamic> json) => Document(
    id: json["_id"],
    name: json["name"],
    field: json["field"] == null ? [] : List<Field>.from(json["field"]!.map((x) => Field.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "name": name,
    "field": field == null ? [] : List<dynamic>.from(field!.map((x) => x.toMap())),
  };
}

class Field {
  final String? id;
  final Name? name;
  final String? value;

  Field({
    this.id,
    this.name,
    this.value,
  });

  factory Field.fromMap(Map<String, dynamic> json) => Field(
    id: json["_id"],
    name: nameValues.map[json["name"]]!,
    value: json["value"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "name": nameValues.reverse[name],
    "value": value,
  };
}

enum Name {
  BACK_IMAGE,
  EXP_DATE,
  FRONT_IMAGE
}

final nameValues = EnumValues({
  "backImage": Name.BACK_IMAGE,
  "expDate": Name.EXP_DATE,
  "frontImage": Name.FRONT_IMAGE
});

class Type {
  Type();

  factory Type.fromMap(Map<String, dynamic> json) => Type(
  );

  Map<String, dynamic> toMap() => {
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
