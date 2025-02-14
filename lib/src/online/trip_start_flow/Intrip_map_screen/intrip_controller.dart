import 'package:intl/intl.dart';
import 'package:townerapp/imports.dart';

import '../../../../network/driver_repo.dart';
import '../../../../utils/trip_flow_update.dart';

class IntripProvider extends ChangeNotifier {
  bool _intrip = false;
  bool get intrip => _intrip;

  setIsIntrip(bool isIntrip) {
    _intrip = isIntrip;
    notifyListeners();
  }

  void validateOtp(BuildContext context, ) async{

    final providerA = Provider.of<EstimationRideProvider>(context, listen: false);

    FirebaseTripService.updateFirebaseTripStatus(providerA.tripId.toString(), "3");

    var map = {
      'newUpdate' : false,
      "distance":"",
      "waitingTime":'',
      "tripId":providerA.tripId,
      "duration":'',
      "startMeter":"",
      "dropLng":'',
      "pickupLat":12.908646666666668,
      "dropLat":'',
      "pickupLng":77.57255333333333,
      "startTime":"",
      "fromAddress":"",
      "endTime":'',
      "allowanceDistance":'',
      "endAddress":'',
      "status":3
    };


    final result = await DriverRepo.verifyOtp(map);

    if (result != null) {
      // todo :- handle data on success

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


  void endTrip(BuildContext context, ) async{

    final providerA = Provider.of<EstimationRideProvider>(context, listen: false);


    FirebaseTripService.updateFirebaseTripStatus(providerA.tripId.toString(), "4");
    // todo : add updated data here
    var map = {
      "newUpdate": true,
      "waitingSecond": 120,
      "distance": 0.0,
      "waitingTime": 120,
      "tripId": providerA.tripId,
      "duration": 1,
      "dropLng": 0.0,
      "pickupLat": "",
      "dropLat": 0.0,
      "pickupLng": "",
      "startTime": "",
      "fromAddress": "",
      "endTime": DateFormat('HH:mm').format(DateTime.now()),
      "endMeter": "",
      "endAddress": '',
      "status": 4
    };



    final result = await DriverRepo.endTrip(map);

    if (result != null) {
      // todo :- handle data on success

      if(result['success']){
        FirebaseTripService.clearFirebaseData(localStorageService.userDriver!.userId!);
        Fluttertoast.showToast(msg: '${result['status']}');
        notifyListeners();
      }

    } else {
      if (result["message"] != null) {
        Fluttertoast.showToast(msg: '${result['message']}');
      }
    }
  }

  void addSupport(BuildContext context, String comment, double rating) async{

    // todo : add updated data here
    var map = {
      "comments": comment,
      "rating": rating,
      "tripId": 58354
    };



    final result = await DriverRepo.driverFeedback(map);

    if (result != null) {
      // todo :- handle data on success

      if(result['success']){
        showDialog(
          context: context,
          barrierDismissible: false, // Prevent dialog dismissal by tapping outside
          builder: (BuildContext context) {
            return const ReviewSuccess();
          },
        );

        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pop(); // Close the dialog
          Navigator.pushNamed(context, RouteClass.homeScreen);
        });
      }


    } else {
      if (result["message"] != null) {
        Fluttertoast.showToast(msg: '${result['message']}');
      }
    }
  }
}
