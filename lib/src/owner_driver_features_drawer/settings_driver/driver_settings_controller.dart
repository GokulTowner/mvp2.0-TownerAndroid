import 'dart:developer';
import '../../../imports.dart';

class DriverSettingsProvider extends ChangeNotifier {
  DriverSettingsProvider() {
    fetchDriverSetting();
  }
  DriverSettingService driverSettingService = DriverSettingService();

  DriverSettingModel driverSettingModel = DriverSettingModel.defaultSettings();

//************************************************************************** */
//Promotional Discount

  final TextEditingController _myDiscAmount = TextEditingController();
  TextEditingController get myDiscAmount => _myDiscAmount;

  final TextEditingController _myDiscPercentage = TextEditingController();
  TextEditingController get myDiscPercentage => _myDiscPercentage;

  void setInvitDriverStatus(value) {
    if (!driverSettingModel.inviteDrivers.mandatory!) {
      driverSettingModel.inviteDrivers.status = value;
      notifyListeners();
    }
  }

  void setReferralBonusStatus(value) {
    if (!driverSettingModel.referralBonus.mandatory!) {
      driverSettingModel.referralBonus.status = value;
      notifyListeners();
    }
  }

  Future<void> fetchDriverSetting() async {
    final result = await driverSettingService.fetchDriverSettings();
    if (result != null) {
      driverSettingModel = result;
      _myDiscPercentage.text =
          driverSettingModel.myDiscountStatus.percentage.toString();
      _myDiscAmount.text =
          driverSettingModel.myDiscountStatus.amount.toString();
      log('Owner data : ${driverSettingModel.governmentRateStatus.status.toString()}');
      notifyListeners();
    }
  }

  Future<void> updateOwnerSetting() async {
    DriverSettingModel data = driverSettingModel;
    final result = await driverSettingService.updateDriverSetting(data);
    if (result != null) {
      flutterToastSuccessShort(result['message'], 14);
    }
  }
}
