class OwnerDataModel {
  String ownerId;
  String name;
  String phoneNumber;
  double docPercentage;
  int totalVeh;
  int totalDriver;
  String? agencyName;
  String? businessLogo;
  String? image;

  OwnerDataModel({
    required this.ownerId,
    required this.name,
    required this.phoneNumber,
    required this.docPercentage,
    required this.totalVeh,
    required this.totalDriver,
    this.agencyName,
    this.businessLogo,
    this.image,
  });

  factory OwnerDataModel.fromJson(Map<String, dynamic> json) {
    return OwnerDataModel(
      ownerId: json['ownerId'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      docPercentage: json['docPercentage'],
      totalVeh: json['totalVeh'],
      totalDriver: json['totalDriver'],
      agencyName: json['agencyName'],
      businessLogo: json['businessLogo'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ownerId': ownerId,
      'name': name,
      'phoneNumber': phoneNumber,
      'docPercentage': docPercentage,
      'totalVeh': totalVeh,
      'totalDriver': totalDriver,
      'agencyName': agencyName,
      'businessLogo': businessLogo,
      'image': image,
    };
  }
}
