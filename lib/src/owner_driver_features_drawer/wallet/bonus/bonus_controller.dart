import 'dart:developer';
import '../../../../imports.dart';

class BonusProvider extends ChangeNotifier {
  BonusService bonusService = BonusService();

  List<WelcomeBonusModel> _welcomeBonusList = [];
  List<WelcomeBonusModel> get welcomeBonusList => _welcomeBonusList;

  List<ReferralBonusModel> _referralBonusList = [];
  List<ReferralBonusModel> get referralBonusList => _referralBonusList;

  List<CouponBonusModel> _couponBonusList = [];
  List<CouponBonusModel> get couponBonusList => _couponBonusList;

  List<SubscriptionBonusModel> _subscriptionBonusList = [];
  List<SubscriptionBonusModel> get subscriptionBonusList =>
      _subscriptionBonusList;

  List<WalletBounsModel> _walletBonusList = [];
  List<WalletBounsModel> get walletBonusList => _walletBonusList;

  List<PerformanceBonusModel> _performanceBonusList = [];
  List<PerformanceBonusModel> get performanceBonusList => _performanceBonusList;

  BonusProvider({int flag = -1}) {
    log('flag 11111: $flag');
    if (flag == 1) {
      fetchWelcomeBonus();
    } else if (flag == 2) {
      fetchReferralBonus();
    } else if (flag == 3) {
      fetchCouponBonus();
    } else if (flag == 4) {
      fetchSubscriptionBonus();
    } else if (flag == 5) {
      fetchWalletBonus();
    } else if (flag == 6) {
      fetchPerformanceBonus();
    }
  }

  Future<void> fetchWelcomeBonus() async {
    final result = await bonusService.fetchWelcomeBonus();
    if (result != null) {
      log('welcome bonus: ${result[0].description}');
      _welcomeBonusList = result;
      log('welcome bonus: ${welcomeBonusList.length}');
      notifyListeners();
    }
  }

  Future<void> fetchReferralBonus() async {
    final result = await bonusService.fetchRefarralBonus();
    if (result != null) {
      log('welcome bonus: ${result[0].bonusName}');
      _referralBonusList = result;
      log('welcome bonus: ${referralBonusList.length}');
      notifyListeners();
    }
  }

  Future<void> fetchCouponBonus() async {
    final result = await bonusService.fetchCouponBonus();
    if (result != null) {
      log('welcome bonus: ${result[0].bonusName}');
      _couponBonusList = result;
      log('welcome bonus: ${_couponBonusList.length}');
      notifyListeners();
    }
  }

  Future<void> fetchSubscriptionBonus() async {
    final result = await bonusService.fetchSubscriptionBonus();
    if (result != null) {
      log('welcome bonus: ${result[0].bonusName}');
      _subscriptionBonusList = result;
      log('welcome bonus: ${_subscriptionBonusList.length}');
      notifyListeners();
    }
  }

  Future<void> fetchWalletBonus() async {
    final result = await bonusService.fetchWalletBonus();
    if (result != null) {
      log('welcome bonus: ${result[0].bonusName}');
      _walletBonusList = result;
      log('welcome bonus: ${_walletBonusList.length}');
      notifyListeners();
    }
  }

  Future<void> fetchPerformanceBonus() async {
    final result = await bonusService.fetchPerformanceBonus();
    if (result != null) {
      log('welcome bonus: ${result[0].bonusName}');
      _performanceBonusList = result;
      log('welcome bonus: ${_performanceBonusList.length}');
      notifyListeners();
    }
  }
}
