//package com.towner.app.townerapp
//
//import android.content.Context
//import android.content.Intent
//import androidx.annotation.NonNull
//import io.flutter.embedding.android.FlutterActivity
//import io.flutter.embedding.engine.FlutterEngine
//import io.flutter.plugin.common.MethodChannel
//import com.google.firebase.FirebaseApp
//
//class MainActivity : FlutterActivity() {
//    private val CHANNEL = "background_location_channel"
//
//    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
//        super.configureFlutterEngine(flutterEngine)
//
//        // Initialize Firebase
//        FirebaseApp.initializeApp(this)
//
//        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
//            when (call.method) {
//                "startLocationService" -> {
//                    val driverDetails = call.argument<Map<String, Any>>("driverDetails")
//                    if (driverDetails != null) {
//                        saveDriverDetails(driverDetails)
//                        startLocationService()
//                        result.success(true)
//                    } else {
//                        result.error("INVALID_ARGUMENT", "Driver details are required", null)
//                    }
//                }
//                "stopLocationService" -> {
//                    stopLocationService()
//                    result.success(true)
//                }
//                else -> result.notImplemented()
//            }
//        }
//    }
//
//    private fun saveDriverDetails(driverDetails: Map<String, Any>) {
//        val sharedPreferences = getSharedPreferences("DriverPrefs", Context.MODE_PRIVATE)
//        with(sharedPreferences.edit()) {
//            putString("driverId", driverDetails["driverId"] as? String)
//            putString("driverName", driverDetails["driverName"] as? String)
//            putString("vehId", driverDetails["vehId"] as? String)
//            putString("vehModel", driverDetails["vehModel"] as? String)
//            apply()
//        }
//    }
//
//    private fun startLocationService() {
//        Intent(this, LocationService::class.java).also { intent ->
//            startService(intent)
//        }
//    }
//
//    private fun stopLocationService() {
//        Intent(this, LocationService::class.java).also { intent ->
//            stopService(intent)
//        }
//    }
//
//
//
//
//}


package com.towner.taxi

import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.provider.Settings
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.google.firebase.FirebaseApp

class MainActivity : FlutterActivity() {
    private val BACKGROUND_LOCATION_CHANNEL = "background_location_channel"
    private val FLOATING_ICON_CHANNEL = "com.example.android_floating_icon/floating_icon"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Initialize Firebase
        FirebaseApp.initializeApp(this)

        // Set up background location channel
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, BACKGROUND_LOCATION_CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "startLocationService" -> {
                    val driverDetails = call.argument<Map<String, Any>>("driverDetails")
                    if (driverDetails != null) {
                        saveDriverDetails(driverDetails)
                        startLocationService()
                        result.success(true)
                    } else {
                        result.error("INVALID_ARGUMENT", "Driver details are required", null)
                    }
                }
                "stopLocationService" -> {
                    stopLocationService()
                    result.success(true)
                }
                else -> result.notImplemented()
            }
        }

        // Set up floating icon channel
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, FLOATING_ICON_CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "showFloatingIcon" -> {
                    showFloatingIcon()
                    result.success(null)
                }
                "hideFloatingIcon" -> {
                    hideFloatingIcon()
                    result.success(null)
                }
                "stopFloatingIconService" -> {
                    stopFloatingIconService()
                    result.success(null)
                }
                "startFloatingIconService" -> {
                    startFloatingIconService()
                    result.success(null)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun saveDriverDetails(driverDetails: Map<String, Any>) {
        val sharedPreferences = getSharedPreferences("DriverPrefs", Context.MODE_PRIVATE)
        with(sharedPreferences.edit()) {
            putString("driverId", driverDetails["driverId"] as? String)
            putString("driverName", driverDetails["driverName"] as? String)
            putString("vehId", driverDetails["vehId"] as? String)
            putString("vehModel", driverDetails["vehModel"] as? String)
            apply()
        }
    }

    private fun startLocationService() {
        Intent(this, LocationService::class.java).also { intent ->
            startService(intent)
        }
    }

    private fun stopLocationService() {
        Intent(this, LocationService::class.java).also { intent ->
            stopService(intent)
        }
    }

    private fun startFloatingIconService() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && !Settings.canDrawOverlays(this)) {
            val intent = Intent(
                Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                Uri.parse("package:$packageName")
            )
            startActivityForResult(intent, 0)
        } else {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                startForegroundService(Intent(this, FloatingIconService::class.java),)
            } else {
                startService(Intent(this, FloatingIconService::class.java))
            }
        }
    }

    private fun showFloatingIcon() {
        sendBroadcast(Intent(FloatingIconService.ACTION_SHOW_FLOATING_ICON))
    }

    private fun hideFloatingIcon() {
        sendBroadcast(Intent(FloatingIconService.ACTION_HIDE_FLOATING_ICON))
    }

    private fun stopFloatingIconService() {
        stopService(Intent(this, FloatingIconService::class.java))
    }

    override fun onResume() {
        super.onResume()
        hideFloatingIcon()
    }

    override fun onPause() {
        super.onPause()
        showFloatingIcon()
    }
}
