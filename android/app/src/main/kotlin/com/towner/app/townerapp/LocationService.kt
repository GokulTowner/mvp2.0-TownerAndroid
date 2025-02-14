package com.towner.taxi

import android.app.*
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.os.IBinder
import android.os.Looper
import androidx.core.app.ActivityCompat
import androidx.core.app.NotificationCompat
import com.google.android.gms.location.*
import com.google.firebase.database.FirebaseDatabase
import android.util.Log
import com.google.firebase.database.ServerValue

class LocationService : Service() {
    private lateinit var fusedLocationClient: FusedLocationProviderClient
    private lateinit var locationCallback: LocationCallback
    private lateinit var driverDetails: Map<String, String?>

    override fun onCreate() {
        super.onCreate()
        fusedLocationClient = LocationServices.getFusedLocationProviderClient(this)
        loadDriverDetails()
        createLocationCallback()
    }

    private fun loadDriverDetails() {
        val sharedPreferences = getSharedPreferences("DriverPrefs", Context.MODE_PRIVATE)
        android.util.Log.i("LocationService", "loadDriverDetails: Driver Id :- "+sharedPreferences.getString("driverId", null))
        driverDetails = mapOf(
            "driverId" to sharedPreferences.getString("driverId", null),
            "driverName" to sharedPreferences.getString("driverName", null),
            "vehId" to sharedPreferences.getString("vehId", null),
            "vehModel" to sharedPreferences.getString("vehModel", null)
        )
    }

    private fun createLocationCallback() {
        locationCallback = object : LocationCallback() {
            override fun onLocationResult(locationResult: LocationResult) {
                locationResult.lastLocation?.let { location ->
                    Log.d("LocationService", "Location received: ${location.latitude}, ${location.longitude}")
                    // Update location in Firebase Realtime Database
                    val database = FirebaseDatabase.getInstance()
                    val driverId = driverDetails["driverId"] ?: return
                    android.util.Log.i("LocationService", "onLocationResult: Driver id found :- $driverId")
                    val ref = database.getReference("drivers_location").child("trip_location").child(driverId)

                    val locationData = hashMapOf(
                        "latitude" to location.latitude,
                        "longitude" to location.longitude,
                        "timestamp" to ServerValue.TIMESTAMP
                    )

                    // Update the driver's details with the new location data
                    val driverData = driverDetails.toMutableMap()
                    driverData["latitude"] = location.latitude.toString()
                    driverData["longitude"] = location.longitude.toString()
                    driverData["timestamp"] = ServerValue.TIMESTAMP.toString()

                    ref.setValue(driverData)
                        .addOnSuccessListener {
                            Log.d("LocationService", "Location and driver details updated successfully")
                        }
                        .addOnFailureListener { e ->
                            Log.e("LocationService", "_Failed to update location and driver details", e)
                        }
                }
            }
        }
    }


    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        startForeground(NOTIFICATION_ID, createNotification())
        requestLocationUpdates()
        return START_STICKY
    }

    private fun requestLocationUpdates() {
        val locationRequest = LocationRequest.Builder(Priority.PRIORITY_HIGH_ACCURACY, 10000)
            .setMinUpdateIntervalMillis(5000)
            .build()

        if (ActivityCompat.checkSelfPermission(
                this,
                android.Manifest.permission.ACCESS_FINE_LOCATION
            ) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(
                this,
                android.Manifest.permission.ACCESS_COARSE_LOCATION
            ) != PackageManager.PERMISSION_GRANTED
        ) {
            Log.e("LocationService", "Location permission not granted")
            return
        }

        fusedLocationClient.requestLocationUpdates(
            locationRequest,
            locationCallback,
            Looper.getMainLooper()
        )
    }

    private fun createNotification(): Notification {
        val channelId = "location_service_channel"
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                channelId,
                "Location Service Channel",
                NotificationManager.IMPORTANCE_DEFAULT
            )
            val manager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            manager.createNotificationChannel(channel)
        }

        return NotificationCompat.Builder(this, channelId)
            .setContentTitle("Location Service")
            .setContentText("Tracking location")
            .setSmallIcon(R.mipmap.ic_launcher)
            .build()
    }

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onDestroy() {
        super.onDestroy()
        fusedLocationClient.removeLocationUpdates(locationCallback)
    }

    companion object {
        private const val NOTIFICATION_ID = 12345
    }



    
}