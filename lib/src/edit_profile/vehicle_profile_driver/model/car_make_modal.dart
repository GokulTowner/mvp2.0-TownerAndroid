// To parse this JSON data, do
//
//     final carMakeModal = carMakeModalFromMap(jsonString);

import 'dart:convert';

List<CarMakeModal> carMakeModalFromMap(String str) => List<CarMakeModal>.from(json.decode(str).map((x) => CarMakeModal.fromMap(x)));

String carMakeModalToMap(List<CarMakeModal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class CarMakeModal {
  final String? carmake;
  final List<CarData>? datas;

  CarMakeModal({
    this.carmake,
    this.datas,
  });

  factory CarMakeModal.fromMap(Map<String, dynamic> json) => CarMakeModal(
    carmake: json["carmake"],
    datas: json["datas"] == null ? [] : List<CarData>.from(json["datas"]!.map((x) => CarData.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "carmake": carmake,
    "datas": datas == null ? [] : List<dynamic>.from(datas!.map((x) => x.toMap())),
  };
}

class CarData {
  final String? make;
  final String? id;
  final List<String>? model;

  CarData({
    this.make,
    this.id,
    this.model,
  });

  factory CarData.fromMap(Map<String, dynamic> json) => CarData(
    make: json["make"],
    id: json["_id"],
    model: json["model"] == null ? [] : List<String>.from(json["model"]!.map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "make": make,
    "_id": id,
    "model": model == null ? [] : List<dynamic>.from(model!.map((x) => x)),
  };
}
