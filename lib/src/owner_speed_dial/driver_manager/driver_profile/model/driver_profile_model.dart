// import '../../../../../imports.dart';

// class DriverProfileModel {
//   String driverId;
//   String driverName;
//   String driverStatus;
//   String linkedVehicleName;
//   String? linkedVehiceNumber;
//   String driverPhoneNumber;
//   double driverRating;
//   String dlNumber;
//   String dlValidity;
//   String badgeNumber;
//   String badgeValidity;
//   String fatherName;
//   String dateOfBirth;
//   String selectedRTO;
//   String driverLicenseImageOrPdf;
//   String driverPhoto;
//   String panCardImageOrPdf;
//   String panNumber;
//   String voterIdNumber;
//   String voterIdImageOrPdf;
//   String adharNumber;
//   String adharImageOrPdf;
//   String displayCardNumber;
//   String displayCardImage;
//   String pVerificationId;
//   String pVerificationImage;
//   String uniqueDriverId;
//   String uniqueDriverIdImage;

//   DriverProfileModel({
//     required this.driverId,
//     required this.driverName,
//     required this.driverStatus,
//     required this.linkedVehicleName,
//     this.linkedVehiceNumber,
//     required this.driverPhoneNumber,
//     required this.driverRating,
//     required this.dlNumber,
//     required this.dlValidity,
//     required this.badgeNumber,
//     required this.badgeValidity,
//     required this.fatherName,
//     required this.dateOfBirth,
//     required this.selectedRTO,
//     required this.driverLicenseImageOrPdf,
//     required this.driverPhoto,
//     required this.panCardImageOrPdf,
//     required this.panNumber,
//     required this.displayCardNumber,
//     required this.displayCardImage,
//     required this.pVerificationId,
//     required this.pVerificationImage,
//     required this.uniqueDriverId,
//     required this.uniqueDriverIdImage,
//     this.voterIdNumber = '',
//     this.voterIdImageOrPdf = '',
//     this.adharNumber = '',
//     this.adharImageOrPdf = '',
//   });

//   factory DriverProfileModel.fromJson(Map<String, dynamic> json) =>
//       DriverProfileModel(
//         driverId: json['driverId'],
//         driverName: json['driverName'],
//         driverStatus: json['driverStatus'],
//         linkedVehicleName: json['linkedVehicleName'],
//         linkedVehiceNumber: json['linkedVehiceNumber'],
//         driverPhoneNumber: json['driverPhoneNumber'],
//         driverRating: json['driverRating'],
//         dlNumber: json['dlNumber'],
//         dlValidity: json['dlValidity'],
//         badgeNumber: json['badgeNumber'],
//         badgeValidity: json['badgeValidity'],
//         fatherName: json['fatherName'],
//         dateOfBirth: json['dateOfBirth'],
//         selectedRTO: json['selectedRTO'],
//         driverLicenseImageOrPdf: json['driverLicenseImageOrPdf'],
//         driverPhoto: json['driverPhoto'],
//         panCardImageOrPdf: json['panCardImageOrPdf'],
//         panNumber: json['panNumber'],
//         voterIdNumber: json['voterIdNumber'],
//         voterIdImageOrPdf: json['voterIdImageOrPdf'],
//         adharNumber: json['adharNumber'],
//         adharImageOrPdf: json['adharImageOrPdf'],
//         displayCardNumber: json['displayCardNumber'],
//         displayCardImage: json['displayCardImage'],
//         pVerificationId: json['pVerificationId'],
//         pVerificationImage: json['pVerificationImage'],
//         uniqueDriverId: json['uniqueDriverId'],
//         uniqueDriverIdImage: json['uniqueDriverIdImage'],
//       );

//   Map<String, dynamic> toJson() => {
//         'driverId': driverId,
//         'driverName': driverName,
//         'driverStatus': driverStatus,
//         'linkedVehicleName': linkedVehicleName,
//         'linkedVehiceNumber': linkedVehiceNumber,
//         'driverPhoneNumber': driverPhoneNumber,
//         'driverRating': driverRating,
//         'dlNumber': dlNumber,
//         'dlValidity': dlValidity,
//         'badgeNumber': badgeNumber,
//         'badgeValidity': badgeValidity,
//         'fatherName': fatherName,
//         'dateOfBirth': dateOfBirth,
//         'selectedRTO': selectedRTO,
//         'driverLicenseImageOrPdf': driverLicenseImageOrPdf,
//         'driverPhoto': driverPhoto,
//         'panCardImageOrPdf': panCardImageOrPdf,
//         'panNumber': panNumber,
//         'voterIdNumber': voterIdNumber,
//         'voterIdImageOrPdf': voterIdImageOrPdf,
//         'adharNumber': adharNumber,
//         'adharImageOrPdf': adharImageOrPdf,
//         'displayCardNumber': displayCardNumber,
//         'displayCardImage': displayCardImage,
//         'pVerificationId': pVerificationId,
//         'pVerificationImage': pVerificationImage,
//         'uniqueDriverId': uniqueDriverId,
//         'uniqueDriverIdImage': uniqueDriverIdImage,
//       };

//   String toJsonString() => jsonEncode(toJson());

//   factory DriverProfileModel.fromJsonString(String jsonString) =>
//       DriverProfileModel.fromJson(jsonDecode(jsonString));
// }

class DriverProfileModel {
  String driverId;
  String vehicleId;
  String ownerId;
  String driverName;
  String driverPhoto;
  String driverPhoneNumber;
  String linkedVehicleName;
  String driverStatus;
  String linkedVehicleNumber;
  double driverRating;
  DlDetails dlDetails;
  Aadhar aadhar;
  Pancard pancard;
  VoterId voterId;
  DisplayCard displayCard;
  PVerification pVerification;
  UniqueDriver uniqueDriver;

  DriverProfileModel({
    required this.driverId,
    required this.ownerId,
    required this.vehicleId,
    required this.driverName,
    required this.driverPhoto,
    required this.driverPhoneNumber,
    required this.linkedVehicleName,
    required this.driverStatus,
    required this.linkedVehicleNumber,
    required this.driverRating,
    required this.dlDetails,
    required this.aadhar,
    required this.pancard,
    required this.voterId,
    required this.displayCard,
    required this.pVerification,
    required this.uniqueDriver,
  });

  factory DriverProfileModel.fromJson(Map<String, dynamic> json) {
    return DriverProfileModel(
      driverId: json['driverId'],
      ownerId: json['ownerId'],
      vehicleId: json['vehicleId'],
      driverName: json['driverName'],
      driverPhoto: json['driverPhoto'],
      driverPhoneNumber: json['driverPhoneNumber'],
      linkedVehicleName: json['linkedVehicleName'],
      driverStatus: json['driverStatus'],
      linkedVehicleNumber: json['linkedVehiceNumber'],
      driverRating: json['driverRating'],
      dlDetails: DlDetails.fromJson(json['dlDetails']),
      aadhar: Aadhar.fromJson(json['aadhar']),
      pancard: Pancard.fromJson(json['pancard']),
      voterId: VoterId.fromJson(json['voterId']),
      displayCard: DisplayCard.fromJson(json['displayCard']),
      pVerification: PVerification.fromJson(json['pVerification']),
      uniqueDriver: UniqueDriver.fromJson(json['uniqueDriver']),
    );
  }
}

class DlDetails {
  String dlNumber;
  String dlValidity;
  String badgeNumber;
  String badgeValidity;
  String fatherName;
  String dateOfBirth;
  String selectedRTO;
  String driverLicenseImageOrPdf;

  DlDetails({
    required this.dlNumber,
    required this.dlValidity,
    required this.badgeNumber,
    required this.badgeValidity,
    required this.fatherName,
    required this.dateOfBirth,
    required this.selectedRTO,
    required this.driverLicenseImageOrPdf,
  });

  factory DlDetails.fromJson(Map<String, dynamic> json) {
    return DlDetails(
      dlNumber: json['dlNumber'],
      dlValidity: json['dlValidity'],
      badgeNumber: json['badgeNumber'],
      badgeValidity: json['badgeValidity'],
      fatherName: json['fatherName'],
      dateOfBirth: json['dateOfBirth'],
      selectedRTO: json['selectedRTO'],
      driverLicenseImageOrPdf: json['driverLicenseImageOrPdf'],
    );
  }
}

class Aadhar {
  String nameInAadhar;
  String fatherName;
  String dateOfBirth;
  String adharNumber;
  String adharImageOrPdf;

  Aadhar({
    required this.nameInAadhar,
    required this.fatherName,
    required this.dateOfBirth,
    required this.adharNumber,
    required this.adharImageOrPdf,
  });

  factory Aadhar.fromJson(Map<String, dynamic> json) {
    return Aadhar(
      nameInAadhar: json['nameInAadhar'],
      fatherName: json['fatherName'],
      dateOfBirth: json['dateOfBirth'],
      adharNumber: json['adharNumber'],
      adharImageOrPdf: json['adharImageOrPdf'],
    );
  }
}

class Pancard {
  String nameInPancard;
  String fatherName;
  String dateOfBirth;
  String panNumber;
  String panCardImageOrPdf;

  Pancard({
    required this.nameInPancard,
    required this.fatherName,
    required this.dateOfBirth,
    required this.panNumber,
    required this.panCardImageOrPdf,
  });

  factory Pancard.fromJson(Map<String, dynamic> json) {
    return Pancard(
      nameInPancard: json['nameInPancard'],
      fatherName: json['fatherName'],
      dateOfBirth: json['dateOfBirth'],
      panNumber: json['panNumber'],
      panCardImageOrPdf: json['panCardImageOrPdf'],
    );
  }
}

class VoterId {
  String nameInVoterId;
  String fatherName;
  String dateOfBirth;
  String voterIdNumber;
  String voterIdImageOrPdf;

  VoterId({
    required this.nameInVoterId,
    required this.fatherName,
    required this.dateOfBirth,
    required this.voterIdNumber,
    required this.voterIdImageOrPdf,
  });

  factory VoterId.fromJson(Map<String, dynamic> json) {
    return VoterId(
      nameInVoterId: json['nameInVoterId'],
      fatherName: json['fatherName'],
      dateOfBirth: json['dateOfBirth'],
      voterIdNumber: json['voterIdNumber'],
      voterIdImageOrPdf: json['voterIdImageOrPdf'],
    );
  }
}

class DisplayCard {
  String displayCardNumber;
  String displayCardImage;

  DisplayCard({
    required this.displayCardNumber,
    required this.displayCardImage,
  });

  factory DisplayCard.fromJson(Map<String, dynamic> json) {
    return DisplayCard(
      displayCardNumber: json['displayCardNumber'],
      displayCardImage: json['displayCardImage'],
    );
  }
}

class PVerification {
  String pVerificationId;
  String pVerificationImage;

  PVerification({
    required this.pVerificationId,
    required this.pVerificationImage,
  });

  factory PVerification.fromJson(Map<String, dynamic> json) {
    return PVerification(
      pVerificationId: json['pVerificationId'],
      pVerificationImage: json['pVerificationImage'],
    );
  }
}

class UniqueDriver {
  String uniqueDriverId;
  String uniqueDriverIdImage;

  UniqueDriver({
    required this.uniqueDriverId,
    required this.uniqueDriverIdImage,
  });

  factory UniqueDriver.fromJson(Map<String, dynamic> json) {
    return UniqueDriver(
      uniqueDriverId: json['uniqueDriverId'],
      uniqueDriverIdImage: json['uniqueDriverIdImage'],
    );
  }
}
