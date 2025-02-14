import 'dart:developer';

import 'package:get/get.dart';
import 'package:townerapp/src/edit_profile/vehicle_profile_driver/model/vehicle_list_modal.dart';

import '../../../imports.dart';
import '../../../network/driver_repo.dart';

class VehicleProfileDriverProvider extends ChangeNotifier {
  VehicleProfileDriverService vehicleProfileDriverService =
      VehicleProfileDriverService();

  VehicleProfileDriverProvider() {
    fetchVehicleDetails();
  }

  List<VehicleListModal>? _taxiList;

  List<VehicleListModal>? get taxiList => _taxiList;


  Future<void> fetchVehicleDetails() async {

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
        fetchVehicleDetails();
        notifyListeners();
      }else{

      }
    } on Exception catch (e) {
      e.printError();
    }
  }

  Future<void> deleteTaxi(String taxiId) async {

    try {


      var map = {
        "driverid":localStorageService.userDriver?.userId??'-',
        "taxiId":taxiId,
      };
      final result =  await DriverRepo.deleteTaxi(map);

      if (result != null) {
        fetchVehicleDetails();
        notifyListeners();
      }else{

      }
    } on Exception catch (e) {
      e.printError();
    }
  }


}
