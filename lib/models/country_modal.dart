// To parse this JSON data, do
//
//     final countryModal = countryModalFromMap(jsonString);

import 'dart:convert';

List<CountryModal> countryModalFromMap(String str) => List<CountryModal>.from(json.decode(str).map((x) => CountryModal.fromMap(x)));

String countryModalToMap(List<CountryModal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CountryModal {
  final bool? status;
  final bool? softDelete;
  final int? createdBy;
  final int? modifiedBy;
  final String? id;
  final String? sortname;
  final String? name;
  final String? phoneCode;
  final String? createdAt;
  final String? modifiedAt;
  final int? v;
  final String? currencyCode;
  final String? currencyName;
  final String? flag;

  CountryModal({
    this.status,
    this.softDelete,
    this.createdBy,
    this.modifiedBy,
    this.id,
    this.sortname,
    this.name,
    this.phoneCode,
    this.createdAt,
    this.modifiedAt,
    this.v,
    this.currencyCode,
    this.currencyName,
    this.flag,
  });

  factory CountryModal.fromMap(Map<String, dynamic> json) => CountryModal(
    status: json["status"],
    softDelete: json["softDelete"],
    createdBy: json["createdBy"],
    modifiedBy: json["modifiedBy"],
    id: json["id"],
    sortname: json["sortname"],
    name: json["name"],
    phoneCode: json["phoneCode"],
    createdAt: json["createdAt"],
    modifiedAt: json["modifiedAt"],
    v: json["__v"],
    currencyCode: json["currencyCode"],
    currencyName: json["currencyName"],
    flag: json["flag"],
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "softDelete": softDelete,
    "createdBy": createdBy,
    "modifiedBy": modifiedBy,
    "id": id,
    "sortname": sortname,
    "name": name,
    "phoneCode": phoneCode,
    "createdAt": createdAt,
    "modifiedAt": modifiedAt,
    "__v": v,
    "currencyCode": currencyCode,
    "currencyName": currencyName,
    "flag": flag,
  };
}
