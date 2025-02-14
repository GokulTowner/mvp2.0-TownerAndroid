import 'dart:developer';

import '../../../../imports.dart';

class SubscriptionOwnerService {
  final List<Map<String, dynamic>> vehicleSubscriptionList = [
    {
      'vehicleId': '01',
      'vehicleNo': 'KA-29-T-3255',
      'vehicleType': 'Sedan',
      'vehicleModel': 'Honda City',
      'isProfileAccepted': false,
      'planName': 'FREE : 30 days',
      'planValidity': 30,
      'planAmount': 4500,
      'remainingDays': 29,
      'validityType': 'Monthly',
      'startDate': '10/Feb/2024 | 10:AM',
      'endDate': '10/Mar/2024 | 10:AM',
      'invoiceData': {
        'invoiceId': 'MTC00011',
        'startDate': '10/Feb/2024 | 10:AM',
        'endDate': '10/Mar/2024 | 10:AM',
        'businessName': 'Jain Travel',
        'businessPrfId': 'TWN34257865',
        'driverName': 'Jithin John',
        'vehicleRegNo': 'KA-29-T-3255',
        'vehicleType': 'Sedan',
        'panNumber': 'APBV8025C',
        'gstNumber': 'AVBA1234656',
        'subGrossAmount': 4380.00,
        'cgstValue': 10.00,
        'sgstValue': 10.00,
        'discount': 100.00,
        'convCharges': 200.00,
      }
    },
    {
      'vehicleId': '02',
      'vehicleNo': 'KA-29-T-3255',
      'vehicleType': 'Sedan',
      'vehicleModel': 'Honda City',
      'isProfileAccepted': true,
      'planName': 'FREE : 30 days',
      'planValidity': 30,
      'planAmount': 4600,
      'remainingDays': 2,
      'validityType': 'Monthly',
      'startDate': '10/Feb/2024 | 10:AM',
      'endDate': '10/Mar/2024 | 10:AM',
      'invoiceData': {
        'invoiceId': 'MTC00011',
        'startDate': '10/Feb/2024 | 10:AM',
        'endDate': '10/Mar/2024 | 10:AM',
        'businessName': 'Jain Travel',
        'businessPrfId': 'TWN34257865',
        'driverName': 'Jithin John',
        'vehicleRegNo': 'KA-29-T-3255',
        'vehicleType': 'Sedan',
        'panNumber': 'APBV8025C',
        'gstNumber': 'AVBA1234656',
        'subGrossAmount': 4380.00,
        'cgstValue': 10.00,
        'sgstValue': 10.00,
        'discount': 100.00,
        'convCharges': 200.00,
      }
    },
    {
      'vehicleId': '03',
      'vehicleNo': 'KA-29-T-3255',
      'vehicleType': 'Sedan',
      'vehicleModel': 'Honda City',
      'isProfileAccepted': true,
      'planName': 'DAILY : 1 days',
      'planValidity': 30,
      'planAmount': 4900,
      'remainingDays': 0,
      'validityType': 'Monthly',
      'startDate': '10/Mar/2024 | 10:AM',
      'endDate': '11/Mar/2024 | 10:AM',
      'invoiceData': {
        'invoiceId': 'MTC00011',
        'startDate': '10/Mar/2024 | 10:AM',
        'endDate': '11/Mar/2024 | 10:AM',
        'businessName': 'Jain Travel',
        'businessPrfId': 'TWN34257865',
        'driverName': 'Naveen Raj',
        'vehicleRegNo': 'KA-29-T-3255',
        'vehicleType': 'Sedan',
        'panNumber': 'APBV8025C',
        'gstNumber': 'AVBA1234656',
        'subGrossAmount': 4380.00,
        'cgstValue': 10.00,
        'sgstValue': 10.00,
        'discount': 100.00,
        'convCharges': 200.00,
      }
    },
    {
      'vehicleId': '04',
      'vehicleNo': 'KA-29-T-3255',
      'vehicleType': 'Sedan',
      'vehicleModel': 'Maruthi Ertiga',
      'isProfileAccepted': true,
      'planName': 'WEAKLY : 7 days',
      'planValidity': 7,
      'planAmount': 1200,
      'remainingDays': 3,
      'validityType': 'Weakly',
      'startDate': '1/Mar/2024 | 10:AM',
      'endDate': '8/Mar/2024 | 10:AM',
      'invoiceData': {
        'invoiceId': 'MTC00011',
        'startDate': '1/Mar/2024 | 10:AM',
        'endDate': '8/Mar/2024 | 10:AM',
        'businessName': 'Jain Travel',
        'businessPrfId': 'TWN34257865',
        'driverName': 'Jobin Reddy',
        'vehicleRegNo': 'KA-29-T-3255',
        'vehicleType': 'Sedan',
        'panNumber': 'APBV8025C',
        'gstNumber': 'AVBA1234656',
        'subGrossAmount': 4380.00,
        'cgstValue': 10.00,
        'sgstValue': 10.00,
        'discount': 100.00,
        'convCharges': 200.00,
      }
    },
    {
      'vehicleId': '05',
      'vehicleNo': 'KA-29-T-3255',
      'vehicleType': 'Sedan',
      'vehicleModel': 'Honda City',
      'isProfileAccepted': false,
      'planName': 'FREE : 30 days',
      'planValidity': 30,
      'planAmount': 4500,
      'remainingDays': 0,
      'validityType': 'Free',
      'startDate': '16/Feb/2024 | 10:AM',
      'endDate': '16/Mar/2024 | 10:AM',
      'invoiceData': {
        'invoiceId': 'MTC00011',
        'startDate': '16/Feb/2024 | 10:AM',
        'endDate': '16/Mar/2024 | 10:AM',
        'businessName': 'Jain Travel',
        'businessPrfId': 'TWN34257865',
        'driverName': 'Ramesh Kumar',
        'vehicleRegNo': 'KA-29-T-3255',
        'vehicleType': 'Sedan',
        'panNumber': 'APBV8025C',
        'gstNumber': 'AVBA1234656',
        'subGrossAmount': 4380.00,
        'cgstValue': 10.00,
        'sgstValue': 10.00,
        'discount': 100.00,
        'convCharges': 200.00,
      }
    }
  ];

  Dio dio = Dio();
  String subsDetailsUrl = '';

  Future<List<VehicleSubscriptionModel>?>
      fetchVehicleSubscriptionDetails() async {
    try {
      // Response response = await dio.get(subsDetailsUrl);
      int statusCode = 200;

      if (statusCode == 200) {
        List<dynamic> vehSubDetails = vehicleSubscriptionList;
        List<VehicleSubscriptionModel> vehicleDetails =
            vehSubDetails.map((data) {
          return VehicleSubscriptionModel.fromJson(data);
        }).toList();

        log('to json format : ${vehicleDetails[0].invoiceData}}');

        return vehicleDetails;
      } else {
        return null;
      }
    } catch (e) {
      log('Error : $e');
      return null;
    }
  }
}
