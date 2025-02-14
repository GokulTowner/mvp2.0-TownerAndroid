// ignore_for_file: deprecated_member_use
import 'dart:ui' as ui;
import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
// import 'package:geolocator/geolocator.dart';


import '../../../imports.dart';
import '../../../network/driver_repo.dart';
import '../../edit_profile/vehicle_profile_driver/model/vehicle_list_modal.dart';

class HomeMapProvider extends ChangeNotifier {
  LatLng? _latestLocation;
  LatLng? get latestLocation => _latestLocation;

  late Future<DatabaseEvent> vehicleDatabase;

  GoogleMapController? mapController;
  Uint8List? markerIcon;

  Timer? _timer;


  List<VehicleListModal>? _taxiList;

  List<VehicleListModal>? get taxiList => _taxiList;

  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child('driver_locations').child('trip_location').child(localStorageService.userDriver!.userId!);
  
   final DatabaseReference _databaseReferenceNative = FirebaseDatabase.instance.ref().child('drivers_location').child("trip_location");

  final String? driverId = localStorageService.userDriver!.userId;
  BuildContext? context;


  DatabaseReference getVehicleIdFromFirebase() => FirebaseDatabase.instance.ref().child('drivers_data').child(localStorageService.userDriver!.userId!).child('vehicle_id');


  HomeMapProvider({this.context}) {
    _databaseReference.onChildChanged.listen((event) {
      onLocationUpdated(event.snapshot);
    });
    setOnlineStatus(true);
    checkTripStatus(Get.context!);
    fetchTaxiList();
    vehicleDatabase = getVehicleIdFromFirebase().once();
  }

  DateTime? currentBackPressTime;

  bool onBackPressed() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 3)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press again to exit',
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return false;
    }
    return true;
  }

  void startLocationUpdates() {
    _timer = Timer.periodic(
        const Duration(seconds: 5), (Timer t) => getCurrentLocationFromFirebase());
  }

  void stopLocationUpdates() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }

  // Future<void> updateLocation() async {
  //   await Geolocator.checkPermission();
  //   await Geolocator.requestPermission();
  //   var position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   final latitude = position.latitude.toString();
  //   final longitude = position.longitude.toString();

  //   _latestLocation =  LatLng(position.latitude, position.longitude);

  //   // Update the location in Firebase Realtime Database
  //   await _databaseReference.child(driverId).set({
  //     'driverId': 'dr242853',
  //     'vehId': 'veh5377892',
  //     'vehType': 'sedan',
  //     'latitude': latitude,
  //     'longitude': longitude,
  //     'timestamp': DateTime.now().toIso8601String(),
  //   });

  //   notifyListeners();
  // }


  Future<void> getCurrentLocationFromFirebase() async {
      String? driverId =  localStorageService.userDriver?.userId??'';
      print(" location driver id :- $driverId");
      if(driverId == null){
        return;
      }
    try {

      DatabaseEvent event = await _databaseReferenceNative.child(driverId).once();

      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> driverData = event.snapshot.value as Map<dynamic, dynamic>;
        
        double latitude = double.parse(driverData['latitude'] as String);
        double longitude = double.parse(driverData['longitude'] as String);

          print("Location found :- $latitude $longitude");
        _latestLocation =  LatLng(latitude, longitude);
        sendDriverLocation();

        notifyListeners();

        // return {
        //   'latitude': latitude,
        //   'longitude': longitude,
        // };
      } else {
        log('No data found for driver: $driverId');
        return;
      }
    } catch (e) {
      log('Error fetching location data: $e');
      return;
    }
  }



  void onLocationUpdated(DataSnapshot snapshot) {
    if (snapshot.key == driverId) {
      final data = snapshot.value as Map<dynamic, dynamic>;
      final latitude = double.parse(data['latitude']);
      final longitude = double.parse(data['longitude']);
      log("Location update :- $longitude $latitude");
      _latestLocation = LatLng(latitude, longitude);
      sendDriverLocation();
      notifyListeners();

      // Update the camera position on the map
    }
  }

  Future<void> loadMarkerIcon() async {
    markerIcon =
        await getBytesFromAsset('assets/images/towner_map_car.png', 150);
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void getInitialCurrentLocation() {
    if (mapController != null && latestLocation != null) {
      mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(
          latestLocation!,
          16.0, // You can adjust the zoom level as needed
        ),
      );
    } else {
      Fluttertoast.showToast(
        msg: "Current location not available",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  @override
  void dispose() {
    _databaseReference.onChildAdded.drain();
    super.dispose();
  }

  Future<void> setOnlineStatus(bool status) async {
    try {
      var map = {
        "driverId": localStorageService.userDriver?.userId ?? '-',
        "status": status
      };
      final result = await DriverRepo.setOnlineStatus(map);

      if (result != null) {

      } else {
        flutterToastFailShort('Something went Wrong', 14);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

  }

  checkTripStatus(BuildContext context){
    var driverId = localStorageService.userDriver?.userId;
    print("driver id :- $driverId");
    var database = FirebaseDatabase.instance.ref().child('drivers_data').child(driverId!).child('request');

    database.onValue.listen((event) async {
      if (event.snapshot.value != null) {


        Map<dynamic, dynamic> requestData = event.snapshot.value as Map;
        print('Request Data: $requestData');

        // Example: Check if the request status has changed
        if (requestData['status'] == '1') {

         final providerA = Provider.of<EstimationRideProvider>(context, listen: false);

         DatabaseEvent tripIdEvent = await FirebaseDatabase.instance.ref().child('drivers_data').child(driverId).child('accept').child('trip_id').once();

         // Check if data exists
         if (tripIdEvent.snapshot.value != null) {

           providerA.requestedData = requestData;

           print("trip id  - ${tripIdEvent.snapshot.value}");

           var tripId = tripIdEvent.snapshot.value!;


           // driver not accepted ride yet
           if(tripId is String){
             providerA.tripId = 0;
             localStorageService.setTripId(0);
           }else if(tripId is int){
             if(tripId!=0){
               providerA.tripId = tripIdEvent.snapshot.value as int?;
               localStorageService.setTripId(tripId as int?);

               checkTripDataStatus(driverId, tripId);

             }

           }



            Navigator.push(
             context,
             MaterialPageRoute(
               builder: (context) => const IncomingRideContainer(),
             ),
           );

         } else {
          print("Null data found on  - ${tripIdEvent.snapshot.value}");

         }


        } else if(requestData['status'] == '0'){
          print('Initial Status of Driver: $requestData');
        }
        else if(requestData['status'] == '2'){
          // Get.to(()=>const IncomingRideContainer());

        }
      } else {
        print('Request data is null');
      }
    });
  }

  void checkTripDataStatus(driverId, tripId) async{

    DatabaseEvent tripIdEvent = await FirebaseDatabase.instance.ref().child('drivers_data').child(driverId).child('trips_data').child(tripId.toString()).once();

    if (tripIdEvent.snapshot.value != null) {
      Map<dynamic, dynamic> requestData = tripIdEvent.snapshot.value as Map;

      var tripStatus = requestData['status'];

      print("Trip Status :- $tripStatus");

      switch(tripStatus){

        case "1":
          break;
        case "2":
          break;
        case "3":
          break;
        case "4":
          break;

      }



    }
  }

  Future<void> fetchTaxiList() async {

    try {


      final result =  await DriverRepo.getTaxi(localStorageService.userDriver?.userId??'');

      if (result != null) {

        _taxiList = vehicleListModalFromMap(jsonEncode(result));
        notifyListeners();


      }else{

      }
    } on Exception catch (e) {
      e.printError();
    }
  }

  Future<void> setPrimary(String makeId) async {

    try {


      var map = {
        "makeid":makeId
      };
      final result =  await DriverRepo.setPrimaryTaxi(map);

      if (result != null) {
        Fluttertoast.showToast(msg: 'Taxi Changed Successfully');
        FirebaseDatabase.instance
            .ref()
            .child('drivers_data')
            .child(localStorageService.userDriver?.userId.toString()??'')
            .child('vehicle_id')
            .set(makeId);

        vehicleDatabase = getVehicleIdFromFirebase().once();
      }else{
        Fluttertoast.showToast(msg: 'OOps!,Taxi Update failed');
      }
    } on Exception catch (e) {
      e.printError();
    }
  }

  Future<void> sendDriverLocation() async {

    try {

      var map = {
        "lat":_latestLocation?.latitude,
        "lon":_latestLocation?.longitude,
        "status":1
      };
      final result =  await DriverRepo.driverLocation(map);

      if (result != null) {
        // Fluttertoast.showToast(msg: 'Taxi Changed Successfully');

      }else{
        // Fluttertoast.showToast(msg: 'OOps!,Taxi Update failed');
      }
    } on Exception catch (e) {
      e.printError();
    }
  }

  Future<bool?> isProfStatusAccepted() async {
    DatabaseEvent event = await FirebaseDatabase.instance.ref().child('drivers_data').child(localStorageService.userDriver!.userId!).child('proof_status').once();
    String?  result = event.snapshot.value.toString();
    return result.toLowerCase()=='accepted';
    }

    Future<String?> isProfStatusCheck() async {
    DatabaseEvent event = await FirebaseDatabase.instance.ref().child('drivers_data').child(localStorageService.userDriver!.userId!).child('proof_status').once();
    return  event.snapshot.value.toString();
    }
}
