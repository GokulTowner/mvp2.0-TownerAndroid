import 'dart:developer';
import '../../../../imports.dart';

class SubscriptionDriverProvider extends ChangeNotifier {
  SubscriptionDriverProvider() {
    fetchDriverSubDetails();
  }
  SubscriptionDriveService subscriptionDriveService =
      SubscriptionDriveService();
  double _percentage = 0;
  double get percentage => _percentage;
  SubscriptionDriverModel subscriptionDriverDetails = SubscriptionDriverModel(
      planId: '',
      vehId: '',
      planName: '',
      planAmount: '',
      vehModel: '',
      planValidity: 0,
      remainingDays: 0,
      validityType: '',
      startDate: '',
      endDate: '',
      expiredPlans: []);

  calculatePercentage() {
    int remainingDays = subscriptionDriverDetails.remainingDays;
    int planValidity = subscriptionDriverDetails.planValidity;
    _percentage = (remainingDays / planValidity * 100) / 100;
    notifyListeners();
  }

  double calculatePercentageExpiredPlans(int remainingDays, int planValidity) {
    double percentageExpired = (remainingDays / planValidity * 100) / 100;
    return percentageExpired;
  }

  Future<void> fetchDriverSubDetails() async {
    final result = await subscriptionDriveService.fetchDriverSubscription();

    if (result != null) {
      subscriptionDriverDetails = result;
      log("subscription : ${subscriptionDriverDetails.planAmount}");
      calculatePercentage();
    }
  }
}
