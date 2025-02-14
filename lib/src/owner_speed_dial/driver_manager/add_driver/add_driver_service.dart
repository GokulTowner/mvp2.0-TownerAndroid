import 'dart:developer';

import '../../../../imports.dart';

class AddDriverService {
  // "linkedVehicleName": "Swift",
  // "driverStatus": "Approved",
  // "linkedVehiceNumber": "KL-21-B_5689",
  // "driverRating": 4.3,
  // above this field later have to discuss

  Map<String, dynamic> driverDetailsJson = {
    "driverId": "001",
    "vehicleId": "00045",
    "ownerId": "0083",
    "driverName": "John Scaria",
    "driverPhoto":
        "https://www.habbaspilaw.com/wp-content/uploads/2015/11/bigstock-Portrait-Taxi-Driver-Smile-Car-71892247.jpg",
    "driverPhoneNumber": "+1234567890",
    "dlDetails": {
      "dlNumber": "DL123456789",
      "dlValidity": "31-12-2025",
      "badgeNumber": "BADGE123",
      "badgeValidity": "31-12-2025",
      "fatherName": "Michael Doe",
      "dateOfBirth": "31-12-1993",
      "selectedRTO": "RTO Kochi",
      "driverLicenseImageOrPdf":
          "https://acko-cms.s3.ap-south-1.amazonaws.com/commericial_driving_licence_6f3b64f67d.jpg",
    },
    "aadhar": {
      "nameInAadhar": "John Doe",
      "fatherName": "Michael Doe",
      "dateOfBirth": "31-12-1993",
      "adharNumber": "1234 5678 9012",
      "adharImageOrPdf":
          "https://images.hindustantimes.com/tech/img/2022/12/19/960x540/aadhaar-card-7579588_960_720_1671442149571_1671442199832_1671442199832.webp",
    },
    "pancard": {
      "nameInPancard": "John Doe",
      "fatherName": "Michael Doe",
      "dateOfBirth": "31-12-1993",
      "panNumber": "ABCDE1234F",
      "panCardImageOrPdf":
          "https://images.news18.com/ibnkhabar/uploads/2022/01/fake-PAN-card.jpg",
    },
    "voterId": {
      "nameInVoterId": "John Doe",
      "fatherName": "Michael Doe",
      "dateOfBirth": "31-12-1993",
      "voterIdNumber": "VOTER123",
      "voterIdImageOrPdf":
          "https://static.toiimg.com/photo/108910752/108910752.jpg",
    },
    "displayCard": {
      "displayCardNumber": "DISPLAY123",
      "displayCardImage":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgrTaMtYo77SNUUEOV1DoEJfQqt47XrYdo0QQg3U3rog&s",
    },
    "pVerification": {
      "pVerificationId": "PVERIFY123",
      "pVerificationImage":
          "https://imgv2-2-f.scribdassets.com/img/document/513472746/original/fe5ed6e0e4/1710002806?v=1",
    },
    "uniqueDriver": {
      "uniqueDriverId": "UNIQUE123",
      "uniqueDriverIdImage":
          "https://financialexpresswpcontent.s3.amazonaws.com/uploads/2018/09/driver-license-illustration_1284-5032.jpg"
    },
  };
  Dio dio = Dio();

  Future<DriverDetailsModel?> getDriverDetails() async {
    // String getDriverDetailsUrl = '';

    // Response response = await dio.get(getDriverDetailsUrl);

    try {
      int statusCode = 200;

      if (statusCode == 200) {
        dynamic driverDetails = DriverDetailsModel.fromJson(driverDetailsJson);
        return driverDetails;
      } else {
        return null;
      }
    } catch (e) {
      log('Error : $e');
      return null;
    }
  }
}
