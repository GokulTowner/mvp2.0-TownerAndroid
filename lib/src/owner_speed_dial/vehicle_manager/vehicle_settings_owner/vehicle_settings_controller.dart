import 'dart:developer';
import '../../../../imports.dart';

class VehicleSettingsProvider extends ChangeNotifier {
  VehicleSettingsService vehicleSettingsService = VehicleSettingsService();
  VehicleSettingsProvider() {
    fetchVehicleSetting();
  }

//************************************************************************** */
  VehicleSettingsModel vehicleSettingsModel =
      VehicleSettingsModel.defaultSettings();

  String _vehId = '';
  String get vehId => _vehId;

//Promotional Discount

  final TextEditingController _myDiscAmount = TextEditingController();
  TextEditingController get myDiscAmount => _myDiscAmount;

  final TextEditingController _myDiscPercentage = TextEditingController();
  TextEditingController get myDiscPercentage => _myDiscPercentage;

  setOnChangedMyDiscAmt(String value) {
    if (value.isEmpty) {
      vehicleSettingsModel.myDiscountStatus.amount = 0;
      return;
    }
    vehicleSettingsModel.myDiscountStatus.amount =
        int.parse(_myDiscAmount.text);
    notifyListeners();
  }

  setOnChangedMyDiscPerc(String value) {
    if (value.isEmpty) {
      vehicleSettingsModel.myDiscountStatus.percentage = 0;
      return;
    }
    vehicleSettingsModel.myDiscountStatus.percentage =
        int.parse(_myDiscPercentage.text);
    notifyListeners();
  }

  setVehId(String value) {
    _vehId = value;
    notifyListeners();
  }

  void setMyDiscountStatus(bool value) {
    if (!vehicleSettingsModel.myDiscountStatus.mandatory!) {
      vehicleSettingsModel.myDiscountStatus.status = value;
      notifyListeners();
    }
    notifyListeners();
  }

  void setConvenienceChargeStatus(bool value) {
    if (!vehicleSettingsModel.convenienceCharge.mandatory!) {
      vehicleSettingsModel.convenienceCharge.status = value;
      notifyListeners();
    }
  }

  void setNightFareStatus(value) {
    if (!vehicleSettingsModel.nightFare.mandatory!) {
      vehicleSettingsModel.nightFare.status = value;
      notifyListeners();
    }
  }

  void setWalletActiveStatus(value) {
    if (!vehicleSettingsModel.walletActive.mandatory!) {
      vehicleSettingsModel.walletActive.status = value;
      notifyListeners();
    }
  }

  void setSubscriptionsStatus(value) {
    if (!vehicleSettingsModel.subscription.mandatory!) {
      vehicleSettingsModel.subscription.status = value;
      notifyListeners();
    }
  }

  Future<void> fetchVehicleSetting() async {
    final result = await vehicleSettingsService.fetchVehicleSettings(_vehId);
    if (result != null) {
      vehicleSettingsModel = result;
      _myDiscPercentage.text =
          vehicleSettingsModel.myDiscountStatus.percentage.toString();
      _myDiscAmount.text =
          vehicleSettingsModel.myDiscountStatus.amount.toString();
      log('Owner data : ${vehicleSettingsModel.governmentRateStatus.status.toString()}');
      notifyListeners();
    }
  }

  Future<void> updateVehicleSetting() async {
    VehicleSettingsModel data = vehicleSettingsModel;
    final result =
        await vehicleSettingsService.updateVehicleSetting(data, _vehId);
    if (result != null) {
      flutterToastSuccessShort(result['message'], 14);
    }
  }
}
