// To parse this JSON data, do
//
//     final vehicleCommonModal = vehicleCommonModalFromMap(jsonString);

import 'dart:convert';

List<VehicleCommonModal> vehicleCommonModalFromMap(String str) => List<VehicleCommonModal>.from(json.decode(str).map((x) => VehicleCommonModal.fromMap(x)));

String vehicleCommonModalToMap(List<VehicleCommonModal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class VehicleCommonModal {
  final String? id;
  final List<VehicleCommon>? datas;

  VehicleCommonModal({
    this.id,
    this.datas,
  });

  factory VehicleCommonModal.fromMap(Map<String, dynamic> json) => VehicleCommonModal(
    id: json["_id"],
    datas: json["datas"] == null ? [] : List<VehicleCommon>.from(json["datas"]!.map((x) => VehicleCommon.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "datas": datas == null ? [] : List<dynamic>.from(datas!.map((x) => x.toMap())),
  };
}

class VehicleCommon {
  final String? id;
  final String? dataId;
  final String? name;

  VehicleCommon({
    this.id,
    this.dataId,
    this.name,
  });

  factory VehicleCommon.fromMap(Map<String, dynamic> json) => VehicleCommon(
    id: json["_id"],
    dataId: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "id": dataId,
    "name": name,
  };
}
