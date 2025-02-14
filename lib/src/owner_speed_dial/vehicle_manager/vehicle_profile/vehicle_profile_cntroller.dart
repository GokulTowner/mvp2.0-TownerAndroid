import '../../../../imports.dart';

class VehicleProfileProvider extends ChangeNotifier {
  VehicleProfileProvider() {
    getVehicleList();
  }
  VehicleProfileService vehicleProfileService = VehicleProfileService();

  List<VehicleDetailsModel> _vehicleDetaisList = [];

  String? _selectedDriver;
  String? get selectedDriver => _selectedDriver;

  List<VehicleDetailsModel> get vehicleDetailsList => _vehicleDetaisList;

  setAssignedDriver(String? driverName) {
    if (driverName == null) return;
    _selectedDriver = driverName;
    notifyListeners();
  }

  Future<void> getVehicleList() async {
    final result = await vehicleProfileService.fetchVehicleList();

    if (result != null) {
      _vehicleDetaisList = result;
      notifyListeners();
    }
  }
}
