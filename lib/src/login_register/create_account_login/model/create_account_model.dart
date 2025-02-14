import 'package:townerapp/models/city_list_modal.dart';
import 'package:townerapp/models/country_modal.dart';
import 'package:townerapp/models/states_modal.dart';

class CreateAccountModel {
  String businessName;
  String ownerName;
  String ownerMobile;
  String firstName;
  String lastName;
  // String vehicleNumber;
  String ownerPassword;
  String driverMobile;
  String createPassword;
  String confirmPassword;
  String appSignature;
  String? referralCode;
  String emailAddress;
  String? ownerCode;
  String? channelPartnerCode;
  String? mobileNumber;
  CountryModal? countryModal;
  StateListModal? stateListModal;
  CityListModal? cityListModal;

  CreateAccountModel({
    required this.businessName,
    required this.ownerName,
    required this.firstName,
    required this.lastName,
    required this.ownerMobile,
    // required this.vehicleNumber,
    required this.ownerPassword,
    required this.driverMobile,
    required this.createPassword,
    required this.confirmPassword,
    required this.appSignature,
    required this.emailAddress,
    this.referralCode,
    this.ownerCode,
    this.countryModal,
    this.stateListModal,
    this.cityListModal,
    this.channelPartnerCode, required  mobileNumber,
  });

  factory CreateAccountModel.fromJson(Map<String, dynamic> json) {
    return CreateAccountModel(
      businessName: json['businessName'],
      ownerName: json['ownerName'],
      firstName: json['fname'],
      lastName: json['lname'],
      ownerMobile: json['ownerMobile'],
      // vehicleNumber: json['vehicleNumber'],
      ownerPassword: json['ownerPassword'],
      driverMobile: json['driverMobile'],
      createPassword: json['createPassword'],
      confirmPassword: json['confirmPassword'],
      appSignature: json['appSignature'],
      referralCode: json['referralCode'],
      ownerCode: json['ownerCode'],
      channelPartnerCode: json['channelPartnerCode'],
      emailAddress: json['emailAddress'],
      countryModal: json['country'],
      stateListModal: json['states'],
      cityListModal: json['city'],
      mobileNumber: json['mobileNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'businessName': businessName,
      'ownerName': ownerName,
      'fname': firstName,
      'lname': lastName,
      'ownerMobile': ownerMobile,
      // 'vehicleNumber': vehicleNumber,
      'ownerPassword': ownerPassword,
      'driverMobile': driverMobile,
      'createPassword': createPassword,
      'confirmPassword': confirmPassword,
      'appSignature': appSignature,
      'referralCode': referralCode,
      'ownerCode': ownerCode,
      'channelPartnerCode': channelPartnerCode,
      'emailAddress' :emailAddress,
      'country' :countryModal,
      'states' :stateListModal,
      'city' :cityListModal,
      'mobileNumber' :mobileNumber
    };
  }
}
