import 'package:get/get.dart';

import '../../../../../imports.dart';
import '../../../../../network/driver_repo.dart';
import '../../my_trips/past/model/my_trips_modal.dart';

class ScheduledInterestedProvider extends ChangeNotifier {

  List<MyTripsModal?> _trip = [];
  List<MyTripsModal?> get trip => _trip;

  ScheduledInterestedProvider() {
    getInterestedRide();
  }

  Future<void> getInterestedRide() async {
    try {
      var map = {"_page": 1, "_limit": 1};

      final result = await DriverRepo.driverTripHistory(map);

      if (result is Exception) {
        Fluttertoast.showToast(msg: "Something went wrong");
      } else {
        if (result != null) {
          _trip = myTripsModalFromJson(jsonEncode(result));
          notifyListeners();
        } else {
          Fluttertoast.showToast(msg: 'Something went wrong');
        }
      }
    } on Exception catch (e) {
      e.printError();
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
  }
}
