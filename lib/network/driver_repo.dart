
import 'package:townerapp/network/driver_endpoint.dart';

import '../main.dart';

class DriverRepo{

  static Future<dynamic> signupDriver(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.signup}";
    final response =  apiHelper.post(url, body);
    return response;
  }

  static Future<dynamic> verifyOtp(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.verifyOtp}";
    final response =  apiHelper.post(url, body);
    return response;
  }

  static Future<dynamic> getCountry(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.country}";
    final response =  apiHelper.get(url, body);
    return response;
  }


  static Future<dynamic> getStates(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.states}";
    final response =  apiHelper.get(url, body);
    return response;
  }

  static Future<dynamic> getCity(body) async {
    final url = "${DriverEndpoint.baseUrl}${DriverEndpoint.getCity}/$body";
    final response =  apiHelper.get(url, null);
    return response;
  }

  static Future<dynamic> login(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.login}";
    final response =  apiHelper.post(url, body);
    return response;
  }

  static Future<dynamic> forgotPassword(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.forgotPassword}";
    final response =  apiHelper.post(url, body);
    return response;
  }

  static Future<dynamic> resetPassword(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.resetPassword}";
    final response =  apiHelper.post(url, body);
    return response;
  }


  static Future<dynamic> getProfile(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.profile}";
    final response =  apiHelper.get(url, body);
    return response;
  }


  static Future<dynamic> carMake(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.carMake}";
    final response =  apiHelper.get(url, body);
    return response;
  }

  static Future<dynamic> carCommonData(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.commondata}";
    final response =  apiHelper.get(url, body);
    return response;
  }

  static Future<dynamic> createTaxi(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.createTaxi}";
    final response =  apiHelper.post(url, body);
    return response;
  }

  static Future<dynamic> getTaxi(String body) async {
    final url = "${DriverEndpoint.baseUrl}${DriverEndpoint.createTaxi}/$body";
    final response =  apiHelper.get(url, null);
    return response;
  }

  static Future<dynamic> setPrimaryTaxi(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.setPrimaryTaxi}";
    final response =  apiHelper.put(url, body);
    return response;
  }

  static Future<dynamic> deleteTaxi(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.createTaxi}";
    final response =  apiHelper.delete(url,param: body );
    return response;
  }

  static Future<dynamic> uploadDoc(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.driverDocs}";
    final response =  apiHelper.multipartPost(url, body );
    return response;
  }

  static Future<dynamic> getDocuments(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.documentsDriver}";
    final response =  apiHelper.get(url, body );
    return response;
  }
  static Future<dynamic> setOnlineStatus(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.setOnlineStatus}";
    final response =  apiHelper.put(url, body );
    return response;
  }

  static Future<dynamic> driverTripHistory(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.driverTripHistory}";
    final response =  apiHelper.post(url, body );
    return response;
  }

  static Future<dynamic> cancelTrip(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.cancelTrip}";
    final response =  apiHelper.put(url, body );
    return response;
  }

  static Future<dynamic> acceptRequest(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.acceptRequest}";
    final response =  apiHelper.put(url, body );
    return response;
  }

  static Future<dynamic> intimateAcceptedRequest(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.tripCurrentStatus}";
    final response =  apiHelper.put(url, body );
    return response;
  }

  static Future<dynamic> intimateArrive(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.tripCurrentStatus}";
    final response =  apiHelper.put(url, body );
    return response;
  }

  static Future<dynamic> startTrip(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.tripCurrentStatus}";
    final response =  apiHelper.put(url, body );
    return response;
  }

  static Future<dynamic> endTrip(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.tripCurrentStatus}";
    final response =  apiHelper.put(url, body );
    return response;
  }

  static Future<dynamic> driverFeedback(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.driverFeedback}";
    final response =  apiHelper.put(url, body );
    return response;
  }

  static Future<dynamic> driverLocation(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.driverLocation}";
    final response =  apiHelper.put(url, body );
    return response;
  }

  static Future<dynamic> scheduledTrips(body) async {
    const url = "${DriverEndpoint.baseUrl}${DriverEndpoint.scheduledTrips}";
    final response =  apiHelper.get(url, body );
    return response;
  }


}