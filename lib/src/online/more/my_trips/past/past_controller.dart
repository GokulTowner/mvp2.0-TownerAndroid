import 'package:get/get.dart';
import 'package:townerapp/network/driver_repo.dart';
import 'package:townerapp/src/online/more/my_trips/past/model/my_trips_modal.dart';

import '../../../../../imports.dart';

class PastRideProvider extends ChangeNotifier {
  List<MyTripsModal?> _pastTrip = [];
  List<MyTripsModal?> get pastTrip => _pastTrip;

  PastRideProvider() {
    // fetchPastTripDatas();
    getPastRids();
  }

  Future<void> getPastRids() async{

    try {
      var map = {
        "_page":1,
        "_limit":1
      };



      final result = await DriverRepo.driverTripHistory(map);

      if(result is Exception){
        Fluttertoast.showToast(msg: "Something went wrong");

      }else{
        if(result !=null){
          _pastTrip = myTripsModalFromJson(jsonEncode(result));
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

  Future<void> fetchPastTripDatas() async {
    PastTripServices pastTripServices = PastTripServices();

    final List<PastTripModel>? result =
        await pastTripServices.fetchPastTripDetails();

 /*   if (result != null) {
      _pastTrip = result;
      notifyListeners();
    }*/
  }
}
