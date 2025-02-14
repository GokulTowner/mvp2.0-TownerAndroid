class DriverDataModel {
  String ownerId;
  String driverId;
  String name;
  String rating;
  String phoneNumber;
  double docPercentage;
  String? vehNumber;
  String? vehType;
  String? image;

  DriverDataModel({
    required this.ownerId,
    required this.driverId,
    required this.name,
    required this.phoneNumber,
    required this.rating,
    required this.docPercentage,
    this.image,
    this.vehNumber,
    this.vehType,
  });

  factory DriverDataModel.fromJson(Map<String, dynamic> json) {
    return DriverDataModel(
      ownerId: json['ownerId'],
      driverId: json['driverId'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      docPercentage: json['docPercentage'],
      image: json['image'],
      rating: json['rating'],
      vehNumber: json['vehNumber'],
      vehType: json['vehType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ownerId': ownerId,
      'driverId': driverId,
      'name': name,
      'phoneNumber': phoneNumber,
      'docPercentage': docPercentage,
      'image': image,
      'rating': rating,
      'vehNumber': vehNumber,
      'vehType': vehType
    };
  }
}
