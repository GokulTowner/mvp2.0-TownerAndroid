import 'dart:developer';
import '../../../../imports.dart';

class BuySubscriptionProvider extends ChangeNotifier {
  LocalStorageService localStorageService = LocalStorageService();
  BuySubscriptionService buySubscriptionService = BuySubscriptionService();
  BuySubscriptionProvider() {
    fetchVehicleSubscriptionDetails();
    fetchSubscriptionDetails();
  }

  List<VehicleDetailsSubscriptionModel> _vehicleDetailsSubscriptionList = [];
  List<VehicleDetailsSubscriptionModel> get vehicleDetailsSubscriptionList =>
      _vehicleDetailsSubscriptionList;

  List<SubscriptionPlan> _subscriptionPlan = [];
  List<SubscriptionPlan> get subscriptionPlan => _subscriptionPlan;

  final List<SubscriptionDetail> _subscriptionDetails = [];
  List<SubscriptionDetail> get subscriptionDetails => _subscriptionDetails;

  int get totalAmount {
    double total = 0;

    for (int i = 0; i < vehicleDetailsSubscriptionList.length; i++) {
      if (vehicleDetailsSubscriptionList[i].isChecked) {
        double? subscriptionPrice =
            vehicleDetailsSubscriptionList[i].selectedSubscription.price;
        log('message: $subscriptionPrice');
        // vehicleDetailsSubscriptionList[i].selectedSubscription.amount;
        total += subscriptionPrice;
      }
    }

    log('Total Amount: $total');
    return total.toInt();
  }

  bool _toSubscribe = false;
  bool get toSubscribe => _toSubscribe;

  void setTosubscribe() {
    _toSubscribe = !_toSubscribe;
    notifyListeners();
  }

  /// Updates the selected subscription for a vehicle at the given index with a new subscription ID.
  /// It then updates the subscription details with the new plan ID and price.
  /// If the subscription is checked, it updates or adds the subscription detail for the vehicle.
  ///
  /// this is onChanged function that given in the dropdown property name onChanged

  void setSelectedSubscription(int index, String newValue) {
    vehicleDetailsSubscriptionList[index].selectedSubscription.id = newValue;

    SubscriptionPlan? matchingSubscription =
        _subscriptionPlan.firstWhere((subscription) {
      return subscription.id == newValue;
    });

    // Set the price in selectedSubscription based on the matching subscription
    vehicleDetailsSubscriptionList[index].selectedSubscription.price =
        matchingSubscription.price;

    if (vehicleDetailsSubscriptionList[index].isChecked) {
      // Check if a subscription for this vehicle already exists
      int existingIndex = _subscriptionDetails.indexWhere((detail) =>
          detail.vehId == vehicleDetailsSubscriptionList[index].vehicleId);

      if (existingIndex != -1) {
        // Update the existing subscription detail
        _subscriptionDetails[existingIndex] = SubscriptionDetail(
            vehId: vehicleDetailsSubscriptionList[index].vehicleId,
            planId: matchingSubscription.id,
            planAmount: matchingSubscription.price.toInt());
      } else {
        // Add a new subscription detail
        _subscriptionDetails.add(SubscriptionDetail(
            vehId: vehicleDetailsSubscriptionList[index].vehicleId,
            planId: matchingSubscription.id,
            planAmount: matchingSubscription.price.toInt()));
      }
    } else {
      // Check if a subscription for this vehicle already exists
      int existingIndex = _subscriptionDetails.indexWhere((detail) =>
          detail.vehId == vehicleDetailsSubscriptionList[index].vehicleId);

      if (existingIndex != -1) {
        // Remove the existing subscription detail
        _subscriptionDetails.removeAt(existingIndex);
      }
    }
    notifyListeners();
  }

  void setIsChecked(int index, bool newValue) {
    if (vehicleDetailsSubscriptionList.isNotEmpty) {
      vehicleDetailsSubscriptionList[index].isChecked = newValue;
      log('Checkbox changed: $newValue');

      // Trigger subscription update to handle add/update/remove
      setSelectedSubscription(
          index, vehicleDetailsSubscriptionList[index].selectedSubscription.id);

      notifyListeners();
    }
  }

  Future<void> fetchVehicleSubscriptionDetails() async {
    log(totalAmount.toString());
    final result =
        await buySubscriptionService.fetchSubscriptionListVehicleDetails();
    if (result != null) {
      _vehicleDetailsSubscriptionList = result;
      notifyListeners();
    }
  }

  Future<void> fetchSubscriptionDetails() async {
    final result = await buySubscriptionService.fetchSubscriptionDetails();
    if (result != null) {
      _subscriptionPlan = result;
      log(_subscriptionPlan.length.toString());

      log("Subsccription plans: ${_subscriptionPlan.toList().toString()}");

      notifyListeners();
    }
  }

  Future<void> addSubscriptionRequest() async {
    String trAgId = localStorageService.userOwner!.ownerId;

    SubscriptionRequestModel data = SubscriptionRequestModel(
        traAgId: trAgId,
        totalAmount: totalAmount,
        subscriptions: _subscriptionDetails);
    final result = await buySubscriptionService.addSubscription(data);

    log('Subscription Request : ${result.toString()}');
  }
}
