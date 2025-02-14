import 'dart:developer';

import 'package:flutter/services.dart';

class FloatingIconService {
  static const platform = MethodChannel('com.example.android_floating_icon/floating_icon');

  Future<void> showFloatingIcon() async {
    try {
      await platform.invokeMethod('showFloatingIcon');
    } on PlatformException catch (e) {
      log("Failed to show floating icon: '${e.message}'.");
    }
  }

  Future<void> hideFloatingIcon() async {
    try {
      await platform.invokeMethod('hideFloatingIcon');
    } on PlatformException catch (e) {
      log("Failed to hide floating icon: '${e.message}'.");
    }
  }

  Future<void> startFloatingIconService() async {
    try {
      await platform.invokeMethod('startFloatingIconService');
    } on PlatformException catch (e) {
      log("Failed to start floating icon service: '${e.message}'.");
    }
  }

  Future<void> stopFloatingIconService() async {
    try {
      await platform.invokeMethod('stopFloatingIconService');
    } on PlatformException catch (e) {
      log("Failed to stop floating icon service: '${e.message}'.");
    }
  }
}