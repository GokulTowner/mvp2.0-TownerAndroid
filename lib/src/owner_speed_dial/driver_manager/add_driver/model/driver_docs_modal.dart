// To parse this JSON data, do
//
//     final driverDocsModal = driverDocsModalFromMap(jsonString);

import 'dart:convert';

DriverDocsModal driverDocsModalFromMap(String str) => DriverDocsModal.fromMap(json.decode(str));

String driverDocsModalToMap(DriverDocsModal data) => json.encode(data.toMap());

class DriverDocsModal {
  final bool? success;
  final String? message;
  final List<DriverDocument>? document;

  DriverDocsModal({
    this.success,
    this.message,
    this.document,
  });

  factory DriverDocsModal.fromMap(Map<String, dynamic> json) => DriverDocsModal(
    success: json["success"],
    message: json["message"],
    document: json["document"] == null ? [] : List<DriverDocument>.from(json["document"]!.map((x) => DriverDocument.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "document": document == null ? [] : List<dynamic>.from(document!.map((x) => x.toMap())),
  };
}

class DriverDocument {
  final String? name;
  final String? slug;
  final bool? mandatory;
  final List<Field>? field;
  final bool? documentUploaded;

  DriverDocument({
    this.name,
    this.slug,
    this.mandatory,
    this.field,
    this.documentUploaded,
  });

  factory DriverDocument.fromMap(Map<String, dynamic> json) => DriverDocument(
    name: json["name"],
    slug: json["slug"],
    mandatory: json["mandatory"],
    field: json["field"] == null ? [] : List<Field>.from(json["field"]!.map((x) => Field.fromMap(x))),
    documentUploaded: json["documentUploaded"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "slug": slug,
    "mandatory": mandatory,
    "field": field == null ? [] : List<dynamic>.from(field!.map((x) => x.toMap())),
    "documentUploaded": documentUploaded,
  };
}

class Field {
  final Name? name;
  final Slug? slug;
  final Type? type;
  final String? value;

  Field({
    this.name,
    this.slug,
    this.type,
    this.value,
  });

  factory Field.fromMap(Map<String, dynamic> json) => Field(
    name: nameValues.map[json["name"]]!,
    slug: slugValues.map[json["slug"]]!,
    type: typeValues.map[json["type"]]!,
    value: json["value"],
  );

  Map<String, dynamic> toMap() => {
    "name": nameValues.reverse[name],
    "slug": slugValues.reverse[slug],
    "type": typeValues.reverse[type],
    "value": value,
  };
}

enum Name {
  BACK_IMAGE,
  EXP_DATE,
  FRONT_IMAGE
}

final nameValues = EnumValues({
  "Back Image": Name.BACK_IMAGE,
  "Exp Date": Name.EXP_DATE,
  "Front Image": Name.FRONT_IMAGE
});

enum Slug {
  BACK_IMAGE,
  EXP_DATE,
  FRONT_IMAGE
}

final slugValues = EnumValues({
  "backImage": Slug.BACK_IMAGE,
  "expDate": Slug.EXP_DATE,
  "frontImage": Slug.FRONT_IMAGE
});

enum Type {
  DATE,
  IMAGE
}

final typeValues = EnumValues({
  "date": Type.DATE,
  "image": Type.IMAGE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
