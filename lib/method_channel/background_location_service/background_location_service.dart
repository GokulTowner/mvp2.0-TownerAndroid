import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:townerapp/imports.dart';

import '../../models/driver_login_modal.dart';

class BackgroundLocationService {
  static const MethodChannel _channel =
      MethodChannel('background_location_channel');

  static Future<bool> startLocationService() async {
    final rawJson = localStorageService.userDriver;

    String driverId = rawJson?.userId??'';

    print("UserData :- $driverId & $rawJson");
    // String? driverId = preferences.getString("driverId");

    if (driverId == null) {
      // await preferences.setString("driverId", "dr_$driverIdStored");
      // driverId = preferences.getString("driverId");
    }

    Map<String, dynamic> driverDetails = {
      "driverId": driverId,
      "driverName": rawJson?.name,
      // "vehId": "ffdf",
      // "vehModel": "Honda City"
    };

    try {
      final bool result = await _channel.invokeMethod('startLocationService', {
        'driverDetails': driverDetails,
      });
      log("Location service started successfully");
      return result;
    } on PlatformException catch (e) {
      log("Failed to start location service: '${e.message}'.");
      return false;
    }
  }

  static Future<bool> stopLocationService() async {
    try {
      final bool result = await _channel.invokeMethod('stopLocationService');
      log("Location service stopped successfully");
      return result;
    } on PlatformException catch (e) {
      log("Failed to stop location service: '${e.message}'.");
      return false;
    }
  }
}
