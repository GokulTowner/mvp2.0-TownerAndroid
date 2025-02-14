class DriverDetailsModel {
  String driverId;
  String vehicleId;
  String ownerId;
  String driverName;
  String driverPhoto;
  String driverPhoneNumber;
  DlDetailsDriver dlDetails;
  AadharDriver aadhar;
  PancardDriver pancard;
  VoterIdDriver voterId;
  DisplayCardDriver displayCard;
  PVerificationDriver pVerification;
  UniqueDriverId uniqueDriver;

  DriverDetailsModel({
    required this.driverId,
    required this.vehicleId,
    required this.ownerId,
    required this.driverName,
    required this.driverPhoto,
    required this.driverPhoneNumber,
    required this.dlDetails,
    required this.aadhar,
    required this.pancard,
    required this.voterId,
    required this.displayCard,
    required this.pVerification,
    required this.uniqueDriver,
  });

  factory DriverDetailsModel.fromJson(Map<String, dynamic> json) {
    return DriverDetailsModel(
      driverId: json['driverId'],
      vehicleId: json['vehicleId'],
      ownerId: json['ownerId'],
      driverName: json['driverName'],
      driverPhoto: json['driverPhoto'],
      driverPhoneNumber: json['driverPhoneNumber'],
      dlDetails: DlDetailsDriver.fromJson(json['dlDetails']),
      aadhar: AadharDriver.fromJson(json['aadhar']),
      pancard: PancardDriver.fromJson(json['pancard']),
      voterId: VoterIdDriver.fromJson(json['voterId']),
      displayCard: DisplayCardDriver.fromJson(json['displayCard']),
      pVerification: PVerificationDriver.fromJson(json['pVerification']),
      uniqueDriver: UniqueDriverId.fromJson(json['uniqueDriver']),
    );
  }
}

class DlDetailsDriver {
  String dlNumber;
  String dlValidity;
  String badgeNumber;
  String badgeValidity;
  String fatherName;
  String dateOfBirth;
  String selectedRTO;
  String driverLicenseImageOrPdf;

  DlDetailsDriver({
    required this.dlNumber,
    required this.dlValidity,
    required this.badgeNumber,
    required this.badgeValidity,
    required this.fatherName,
    required this.dateOfBirth,
    required this.selectedRTO,
    required this.driverLicenseImageOrPdf,
  });

  factory DlDetailsDriver.fromJson(Map<String, dynamic> json) {
    return DlDetailsDriver(
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

class AadharDriver {
  String nameInAadhar;
  String fatherName;
  String dateOfBirth;
  String adharNumber;
  String adharImageOrPdf;

  AadharDriver({
    required this.nameInAadhar,
    required this.fatherName,
    required this.dateOfBirth,
    required this.adharNumber,
    required this.adharImageOrPdf,
  });

  factory AadharDriver.fromJson(Map<String, dynamic> json) {
    return AadharDriver(
      nameInAadhar: json['nameInAadhar'],
      fatherName: json['fatherName'],
      dateOfBirth: json['dateOfBirth'],
      adharNumber: json['adharNumber'],
      adharImageOrPdf: json['adharImageOrPdf'],
    );
  }
}

class PancardDriver {
  String nameInPancard;
  String fatherName;
  String dateOfBirth;
  String panNumber;
  String panCardImageOrPdf;

  PancardDriver({
    required this.nameInPancard,
    required this.fatherName,
    required this.dateOfBirth,
    required this.panNumber,
    required this.panCardImageOrPdf,
  });

  factory PancardDriver.fromJson(Map<String, dynamic> json) {
    return PancardDriver(
      nameInPancard: json['nameInPancard'],
      fatherName: json['fatherName'],
      dateOfBirth: json['dateOfBirth'],
      panNumber: json['panNumber'],
      panCardImageOrPdf: json['panCardImageOrPdf'],
    );
  }
}

class VoterIdDriver {
  String nameInVoterId;
  String fatherName;
  String dateOfBirth;
  String voterIdNumber;
  String voterIdImageOrPdf;

  VoterIdDriver({
    required this.nameInVoterId,
    required this.fatherName,
    required this.dateOfBirth,
    required this.voterIdNumber,
    required this.voterIdImageOrPdf,
  });

  factory VoterIdDriver.fromJson(Map<String, dynamic> json) {
    return VoterIdDriver(
      nameInVoterId: json['nameInVoterId'],
      fatherName: json['fatherName'],
      dateOfBirth: json['dateOfBirth'],
      voterIdNumber: json['voterIdNumber'],
      voterIdImageOrPdf: json['voterIdImageOrPdf'],
    );
  }
}

class DisplayCardDriver {
  String displayCardNumber;
  String displayCardImage;

  DisplayCardDriver({
    required this.displayCardNumber,
    required this.displayCardImage,
  });

  factory DisplayCardDriver.fromJson(Map<String, dynamic> json) {
    return DisplayCardDriver(
      displayCardNumber: json['displayCardNumber'],
      displayCardImage: json['displayCardImage'],
    );
  }
}

class PVerificationDriver {
  String pVerificationId;
  String pVerificationImage;

  PVerificationDriver({
    required this.pVerificationId,
    required this.pVerificationImage,
  });

  factory PVerificationDriver.fromJson(Map<String, dynamic> json) {
    return PVerificationDriver(
      pVerificationId: json['pVerificationId'],
      pVerificationImage: json['pVerificationImage'],
    );
  }
}

class UniqueDriverId {
  String uniqueDriverId;
  String uniqueDriverIdImage;

  UniqueDriverId({
    required this.uniqueDriverId,
    required this.uniqueDriverIdImage,
  });

  factory UniqueDriverId.fromJson(Map<String, dynamic> json) {
    return UniqueDriverId(
      uniqueDriverId: json['uniqueDriverId'],
      uniqueDriverIdImage: json['uniqueDriverIdImage'],
    );
  }
}
