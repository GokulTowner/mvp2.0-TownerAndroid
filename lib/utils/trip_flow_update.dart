import 'package:firebase_database/firebase_database.dart';

class FirebaseTripService {

  static void updateFirebaseTripStatus(String tripId, String tripStatus) async {
    // Get a reference to the specific trip in Firebase Realtime Database
    DatabaseReference tripRef = FirebaseDatabase.instance.ref().child("trips_data").child(tripId);

    // Create a Map to update the status
    Map<String, dynamic> updateStatus = {
      "status": tripStatus,
    };

    // Update the trip status in Firebase
    try {
      await tripRef.update(updateStatus);
      print("Trip status updated successfully!");
    } catch (e) {
      print("Failed to update trip status: $e");
    }
  }

  // Method to clear Firebase data
  static void clearFirebaseData(String userId) async {
    // Get references to the "accept" and "request" nodes in Firebase Realtime Database
    DatabaseReference acceptRef = FirebaseDatabase.instance
        .ref()
        .child("drivers_data")
        .child(userId)
        .child("accept");

    DatabaseReference requestRef = FirebaseDatabase.instance
        .ref()
        .child("drivers_data")
        .child(userId)
        .child("request");

    // Create Maps to update the fields
    Map<String, dynamic> acceptMap = {
      "trip_id": "0",
      "others": "0",
    };

    Map<String, dynamic> requestMap = {
      "drop_address": "0",
      "etd": "0",
      "picku_address": "0",
      "request_id": "0",
      "status": "0",
    };

    // Update the data in Firebase
    try {
      await acceptRef.update(acceptMap);
      await requestRef.update(requestMap);
      print("Firebase data cleared successfully!");
    } catch (e) {
      print("Failed to clear Firebase data: $e");
    }
  }

}

