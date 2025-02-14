import 'dart:developer';
import '../../../../imports.dart';

class DriverProfileService {
  List<Map<String, dynamic>> driverProfileList = [
    {
      "driverId": "001",
      "vehicleId": "00045",
      "ownerId": "0083",
      "driverName": "John Doe",
      "driverPhoto":
          "https://content.jdmagicbox.com/comp/navsari/f8/9999p2637.2637.190614164820.a1f8/catalogue/driver-service-khadsupa-boarding-navsari-cpe5uycftq-250.jpg",
      "driverPhoneNumber": "+1234567890",
      "linkedVehicleName": "Swift",
      "driverStatus": "Approved",
      "linkedVehiceNumber": "KL-21-B_5689",
      "driverRating": 4.3,
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
    },
    {
      "driverId": "002",
      "vehicleId": "00048",
      "ownerId": "0084",
      "driverName": "George Thomas",
      "driverPhoto":
          "https://img.freepik.com/free-photo/man-car-driving_23-2148889981.jpg",
      "driverPhoneNumber": "+1234567890",
      "linkedVehicleName": "Swift",
      "driverStatus": "Approved",
      "linkedVehiceNumber": "KL-21-B_5689",
      "driverRating": 4.3,
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
        "nameInAadhar": "George Thomas",
        "fatherName": "Thomas Edison",
        "dateOfBirth": "31-12-1993",
        "adharNumber": "1234 5678 9012",
        "adharImageOrPdf":
            "https://images.hindustantimes.com/tech/img/2022/12/19/960x540/aadhaar-card-7579588_960_720_1671442149571_1671442199832_1671442199832.webp",
      },
      "pancard": {
        "nameInPancard": "George Thomas",
        "fatherName": "Thomas Edison",
        "dateOfBirth": "31-12-1993",
        "panNumber": "ABCDE1234F",
        "panCardImageOrPdf":
            "https://images.news18.com/ibnkhabar/uploads/2022/01/fake-PAN-card.jpg",
      },
      "voterId": {
        "nameInVoterId": "George Thomas",
        "fatherName": "Thomas Edison",
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
    },
    {
      "driverId": "003",
      "vehicleId": "00047",
      "ownerId": "0088",
      "driverName": "John Doe",
      "driverPhoto":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAN80JersZnQ1jsUJdF-MEkF5eg9-ZhJopFw&s",
      "driverPhoneNumber": "+1234567890",
      "linkedVehicleName": "Swift",
      "driverStatus": "Approved",
      "linkedVehiceNumber": "KL-21-B_5689",
      "driverRating": 4.3,
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
    },
  ];

  Future<List<DriverProfileModel>?> getDriverDetails() async {
    // Dio dio = Dio();
    // String getDriverDetailUrl = '';

    try {
      // Response response = await dio.get(getDriverDetailUrl);

      int statusCode = 200;

      if (statusCode == 200) {
        List<DriverProfileModel> driverDetailList = driverProfileList.map(
          (driverMap) {
            return DriverProfileModel.fromJson(driverMap);
          },
        ).toList();
        return driverDetailList;
      }
    } catch (e) {
      log('message: $e');
      return null;
    }
    return null;
  }
}
