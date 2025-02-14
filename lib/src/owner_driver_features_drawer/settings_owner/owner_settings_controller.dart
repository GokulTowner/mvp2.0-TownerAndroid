import 'dart:developer';
import '../../../imports.dart';

class OwnerSettingsProvider extends ChangeNotifier {
  OwnerSettingService ownerSettingService = OwnerSettingService();
  OwnerSettingsProvider() {
    fetchOwnerSetting();
  }

  OwnerSettingModel ownerSettingModel = OwnerSettingModel.defaultSettings();

//************************************************************************** */

  //GST
  final TextEditingController _gstPercentage = TextEditingController();
  TextEditingController get gstPercentage => _gstPercentage;

//***************************************************************/

  bool _gstReadOnly = true;
  bool get gstReadOnly => _gstReadOnly;

  setGstReadOnly(bool value) {
    _gstReadOnly = value;
    notifyListeners();
  }

  void setPromotionalDiscountStatus(bool value) {
    if (!ownerSettingModel.promotionalDiscount.mandatory) {
      ownerSettingModel.promotionalDiscount.status = value;
      notifyListeners();
    }
  }

  void setGstStatus(value) {
    if (!ownerSettingModel.gst.mandatory) {
      ownerSettingModel.gst.status = value;
      notifyListeners();
    }
  }

  void onlineAndLeadBookingStatus(value) {
    if (!ownerSettingModel.onlineBooking.mandatory ||
        !ownerSettingModel.leadCharge.mandatory) {
      ownerSettingModel.onlineBooking.status = value;
      ownerSettingModel.leadCharge.status = value;
      notifyListeners();
    }
  }

  void setSelfBookingStatus(value) {
    if (!ownerSettingModel.selfBooking.mandatory) {
      ownerSettingModel.selfBooking.status = value;
      notifyListeners();
    }
  }

  void setBillShareStatus(value) {
    if (!ownerSettingModel.billShare.mandatory) {
      ownerSettingModel.billShare.status = value;
      notifyListeners();
    }
  }

  void setItrFilingStatus(value) {
    if (!ownerSettingModel.itrFiling.mandatory) {
      ownerSettingModel.itrFiling.status = value;
      notifyListeners();
    }
  }

  void setGstRegFilingStatus(value) {
    if (!ownerSettingModel.gstRegFiling.mandatory) {
      ownerSettingModel.gstRegFiling.status = value;
      notifyListeners();
    }
  }

  void setPlFillingStatus(value) {
    if (!ownerSettingModel.plFilling.mandatory) {
      ownerSettingModel.plFilling.status = value;
      notifyListeners();
    }
  }

  void setInviteCustomersStatus(value) {
    if (!ownerSettingModel.inviteCustomers.mandatory) {
      ownerSettingModel.inviteCustomers.status = value;
      notifyListeners();
    }
  }

  void setTripsHistoryStatus(value) {
    if (!ownerSettingModel.tripsHistory.mandatory) {
      ownerSettingModel.tripsHistory.status = value;
      notifyListeners();
    }
  }

  void setInviteDriversStatus(value) {
    if (!ownerSettingModel.inviteDrivers.mandatory) {
      ownerSettingModel.inviteDrivers.status = value;
      notifyListeners();
    }
  }

  void setReferralBonusStatus(value) {
    if (!ownerSettingModel.referralBonus.mandatory) {
      ownerSettingModel.referralBonus.status = value;
      notifyListeners();
    }
  }

  void setWalletActiveStatus(value) {
    if (!ownerSettingModel.walletActive.mandatory) {
      ownerSettingModel.walletActive.status = value;
      notifyListeners();
    }
  }

  Future<void> fetchOwnerSetting() async {
    final result = await ownerSettingService.fetchOwnerSettings();
    if (result != null) {
      ownerSettingModel = result;
      log('Owner data : ${ownerSettingModel.govRate.status.toString()}');
      notifyListeners();
    }
  }

  Future<void> updateOwnerSetting() async {
    OwnerSettingModel data = ownerSettingModel;
    final result = await ownerSettingService.updateOwnerSetting(data);
    if (result != null) {
      flutterToastSuccessShort(result['message'], 14);
    }
  }
}
