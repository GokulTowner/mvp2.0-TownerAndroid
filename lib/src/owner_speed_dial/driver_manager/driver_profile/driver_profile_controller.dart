import 'dart:developer';

import '../../../../imports.dart';

class DriverProfileProvider extends ChangeNotifier {
  DriverProfileProvider() {
    fetchDriverProfileList();
  }
  List<DriverProfileModel> _driverProfileLise = [];
  List<DriverProfileModel> get driverProfileList => _driverProfileLise;

  Map<String, String> drivers = {};

  fetchDriverProfileList() async {
    DriverProfileService driverProfileService = DriverProfileService();
    final result = await driverProfileService.getDriverDetails();
    if (result != null) {
      _driverProfileLise = result;
      notifyListeners();
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong');
    }
  }

  getDrivers() {
    for (var element in _driverProfileLise) {
      drivers.addAll({element.driverId: element.driverName});
      log('Drivers : ${element.driverName}');
    }
    notifyListeners();
    log('drivers : ${drivers.toString()}');
  }
}
