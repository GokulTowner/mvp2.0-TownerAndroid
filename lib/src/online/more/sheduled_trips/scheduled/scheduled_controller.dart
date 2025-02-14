import 'package:get/get.dart';
import 'package:townerapp/network/driver_repo.dart';

import '../../../../../../imports.dart';
import '../../my_trips/past/model/my_trips_modal.dart';

class SheduledProvider extends ChangeNotifier {


  List<MyTripsModal>? _trips;
  List<MyTripsModal>? get trips => _trips;

  SheduledProvider() {
    getScheduledRide();
  }


  Future<void> getScheduledRide() async{

    try {
      var map = {
        "scId":localStorageService.userDriverProfile?.scId??''
      };



      final result = await DriverRepo.scheduledTrips(map);

      if(result is Exception){
        Fluttertoast.showToast(msg: "Something went wrong");

      }else{
        if(result !=null){
          _trips = myTripsModalFromJson(jsonEncode(result));
          notifyListeners();
        }else{
          Fluttertoast.showToast(msg: 'Something went wrong');
        }
      }
    } on Exception catch (e) {
      e.printError();
      Fluttertoast.showToast(msg: 'Something went wrong');
    }

  }
}
