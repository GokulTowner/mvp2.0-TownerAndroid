// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';
import 'package:townerapp/src/online/trip_request_flow/estimation_ride/model/driver_accept_modal.dart';
import 'package:townerapp/utils/trip_flow_update.dart';

import '../../../../../imports.dart';
import '../../../../network/driver_repo.dart';

class EstimationRideProvider extends ChangeNotifier {
  EstimationRideModel? _estimationRideData;

  EstimationRideModel? get estimationRideData => _estimationRideData;

  DriverAcceptModal? acceptModal;

  Map? requestedData;
  int? tripId;

  final TextEditingController otpController = TextEditingController();

  EstimationRideProvider() {
    fetchDriverOnTheWayDetails();
  }

  Future<void> fetchDriverOnTheWayDetails() async {
    EstimationRideService estimationRideService = EstimationRideService();

    final result = await estimationRideService.fetchEstimationRide();

    if (result != null) {
      _estimationRideData = result;
      log(_estimationRideData!.baseFare.toString());
      notifyListeners();
    }
  }

  Future<void> shareFunction() async {
    await FlutterShare.share(
      title: 'Share via',
      text: 'Thank you for sharing oiot',
      chooserTitle: 'Share via',
    );
  }

  Future<void> callFunction(String mobileNumber) async {
    final String call = 'tel:$mobileNumber';

    if (await canLaunch(call)) {
      await launch(call);
    }
  }

  Future<void> rejectTrip(
    context,
  ) async {
    // todo : add trip id and reason
    var map = {"tripId": tripId, "reason": ''};
    final result = await DriverRepo.cancelTrip(map);

    if (result != null) {
      // todo :- handle data on success
      Navigator.pop(context);
      notifyListeners();
    } else {
      if (result["message"] != null) {
        Fluttertoast.showToast(msg: '${result['message']}');
      }
    }
  }

  // accept ride from flag
  void acceptRide(BuildContext context, int flag, ) async{


    var map = {
      "requestId": requestedData?['request_id'],
    };
    final result = await DriverRepo.acceptRequest(map);

    if (result != null) {

      if(result['success']==true){
        tripId = result['tripId'];


        createFirebaseTripData(tripId.toString(), context, "1");
      }

    } else {
      if (result["message"] != null) {
        Fluttertoast.showToast(msg: '${result['message']}');
      }
    }
  }


  void intimateAcceptedRequest(BuildContext context, ) async{

    var map = {
      "newUpdate": false,
      "distance": "",
      "waitingTime": "",
      "tripId": tripId,
      "duration": "",
      "dropLng": "",
      "pickupLat": "",
      "dropLat": "",
      "pickupLng": "",
      "startTime": "",
      "fromAddress": "",
      "endTime": "",
      "endAddress": "",
      "status": 1
    };

    FirebaseTripService.updateFirebaseTripStatus(tripId.toString(), "1");

    final result = await DriverRepo.intimateAcceptedRequest(map);

    if (result != null) {


      acceptModal = driverAcceptModalFromJson(jsonEncode(result));


     /* Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OTPWaiting(),
        ),
      );*/

      notifyListeners();
    } else {
      if (result["message"] != null) {
        Fluttertoast.showToast(msg: '${result['message']}');
      }
    }
  }

  void intiMateArrive(BuildContext context, ) async{


    var map = {
    'newUpdate' : true,
    "distance":"",
    "waitingTime":'',
    "tripId":tripId,
    "duration":'',
    "startMeter":"",
    "dropLng":'',
    "pickupLat":0.0,
    "dropLat":'',
    "pickupLng":0.0,
    "startTime":"",
    "fromAddress":"",
    "endTime":'',
    "allowanceDistance":'',
    "endAddress":'',
    "status":2
    };

    FirebaseTripService.updateFirebaseTripStatus(tripId.toString(), "2");
    final result = await DriverRepo.intimateArrive(map);

    if (result != null) {
      notifyListeners();
    } else {
      if (result["message"] != null) {
        Fluttertoast.showToast(msg: '${result['message']}');
      }
    }
  }

  void startTrip(BuildContext context, ) async{

    FirebaseTripService.updateFirebaseTripStatus(tripId.toString(), "3");

    var map = {
    'newUpdate' : false,
    "distance":"",
    "waitingTime":'',
    "tripId":tripId,
    "duration":'',
    "startMeter":"",
    "dropLng":'',
    "pickupLat":0.0,
    "dropLat":'',
    "pickupLng":0.0,
    "startTime":"",
    "fromAddress":"",
    "endTime":'',
    "allowanceDistance":'',
    "endAddress":'',
    "status":3
    };


    final result = await DriverRepo.startTrip(map);

    if (result != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OTPWaiting(),
        ),
      );
      notifyListeners();
    } else {
      if (result["message"] != null) {
        Fluttertoast.showToast(msg: '${result['message']}');
      }
    }
  }

  void providerSubmitOtp(BuildContext context) {

    print('OTP 1 := ${otpController.text} OTP 2 = ${acceptModal?.startOtp}');
    if(otpController.text == acceptModal?.startOtp){
      context.read<IntripProvider>().setIsIntrip(true);
      Navigator.pushNamedAndRemoveUntil(
          context,
          RouteClass.intripMapScreen,
              (route) => false);
    }else{
      Fluttertoast.showToast(msg: 'OTP invalid');
    }
  }

  createFirebaseTripData(String tripId, BuildContext context, String status) async {
    // Get a reference to the "trips_data" node in Firebase Realtime Database
    DatabaseReference tripsDataRef = FirebaseDatabase.instance.ref().child("trips_data").child(tripId);

    // Create a HashMap (Map in Dart) to store trip data
    Map<String, dynamic> createTrip = {
      "Drop_address": "0",
      "Drop_latlng": "0",
      "convance_fare": "0",
      "cancel_fare": "0",
      "distance": "0",
      "time": "0",
      "isNight": "0",
      "distance_fare": "0",
      "cancelby": "0",
      "driver_rating": "0",
      "duration": "0",
      "pickup_address": "0",
      "rider_rating": "0",
      "status": status,
      "time_fare": "0",
      "datetime": "0",
      "trip_type": "0",
      "total_fare": "0",
      "discount": "0",
      "driver_alavance_dis": "0",
      "ispay": "0",
      "pay_type": "0",
      "tax": "0",
      "isTax": "0",
      "isWaiting": "0",
      "isPickup": "0",
      "driver_token": "", // Replace with actual device token
    };

    // Update the trip data in Firebase
    try {
      await tripsDataRef.update(createTrip);
      print("Trip data created successfully!");
      intimateAcceptedRequest(context);
      Navigator.pop(context, true);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
          const EstimationRideContainer(),
        ),
      );
      notifyListeners();
    } catch (e) {
      print("Failed to create trip data: $e");
    }
  }
}
