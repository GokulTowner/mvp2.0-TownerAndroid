import 'dart:developer';

import '../../../../imports.dart';

class BonusService {
  List<Map<String, dynamic>> welcomeBonus = [
    {
      "bonusId": "001",
      "bounsName": "Welcome Bonus",
      "bonusAmount": 100,
      "discription": "You have earned Rs.50 as welcome bonus",
      "status": "valid",
      "dateTime": "30 May 22 | 12:30",
    }
  ];

  List<Map<String, dynamic>> referralBonus = [
    {
      "bonusId": "002",
      "bounsName": "Referral Bonus",
      "bonusAmount": 100,
      "discription": "You have earned Rs.50 as Referral bonus",
      "status": "valid",
      "dateTime": "10 June 24 | 01:30",
    },
    {
      "bonusId": "003",
      "bounsName": "Referral Bonus",
      "bonusAmount": 100,
      "discription": "You have earned Rs.70 as Referral bonus",
      "status": "expired",
      "dateTime": "23 July 24 | 12:00",
    },
    {
      "bonusId": "004",
      "bounsName": "Referral Bonus",
      "bonusAmount": 100,
      "discription": "You have earned Rs.40 as Referral bonus",
      "status": "valid",
      "dateTime": "3 june 24 | 12:30",
    }
  ];
  List<Map<String, dynamic>> couponBonus = [
    {
      "bonusId": "004",
      "bounsName": "Coupon Bonus",
      "bonusAmount": 100,
      "discription": "You have earned Rs.100 as Coupon bonus",
      "status": "valid",
      "dateTime": "3 june 24 | 12:30",
    },
    {
      "bonusId": "004",
      "bounsName": "Coupon Bonus",
      "bonusAmount": 100,
      "discription": "You have earned Rs.100 as Coupon bonus",
      "status": "valid",
      "dateTime": "3 june 24 | 12:30",
    },
  ];
  List<Map<String, dynamic>> subscriptionBonus = [
    {
      "bonusId": "004",
      "bounsName": "Subscription Bonus",
      "bonusAmount": 100,
      "discription": "You have earned Rs.100 as Subscription bonus",
      "status": "valid",
      "dateTime": "3 june 24 | 12:30",
    },
    {
      "bonusId": "004",
      "bounsName": "Subscription Bonus",
      "bonusAmount": 100,
      "discription": "You have earned Rs.100 as Subscription bonus",
      "status": "valid",
      "dateTime": "3 june 24 | 12:30",
    },
  ];
  List<Map<String, dynamic>> walletBonus = [
    {
      "bonusId": "004",
      "bounsName": "Wallet Bonus",
      "bonusAmount": 100,
      "discription": "You have earned Rs.100 as Wallet bonus",
      "status": "valid",
      "dateTime": "3 june 24 | 12:30",
    },
    {
      "bonusId": "004",
      "bounsName": "Wallet Bonus",
      "bonusAmount": 100,
      "discription": "You have earned Rs.100 as Wallet bonus",
      "status": "valid",
      "dateTime": "3 june 24 | 12:30",
    },
  ];
  List<Map<String, dynamic>> performanceBonus = [
    {
      "bonusId": "004",
      "bounsName": "Performance Bonus",
      "bonusAmount": 100,
      "discription": "You have earned Rs.100 as Performance bonus",
      "status": "valid",
      "dateTime": "3 june 24 | 12:30",
    },
    {
      "bonusId": "004",
      "bounsName": "Performance Bonus",
      "bonusAmount": 100,
      "discription": "You have earned Rs.100 as Performance bonus",
      "status": "valid",
      "dateTime": "3 june 24 | 12:30",
    }
  ];
  // Map<String, dynamic> bonusDetails = {
  //   "performanceBonus": [
  //     {
  //       "bonusId": "004",
  //       "bounsName": "Performance Bonus",
  //       "discription": "You have earned Rs.100 as Performance bonus",
  //       "status": "valid",
  //       "dateTime": "3 june 24 | 12:30",
  //     },
  //     {
  //       "bonusId": "004",
  //       "bounsName": "Performance Bonus",
  //       "discription": "You have earned Rs.100 as Performance bonus",
  //       "status": "valid",
  //       "dateTime": "3 june 24 | 12:30",
  //     }
  //   ],
  // };

  String welcomeBonusUrl = '';
  String referralBonusUrl = '';
  String couponBonusUrl = '';
  String subscriptionBonusUrl = '';
  String walletBonusUrl = '';
  String performanceBonusUrl = '';
  Dio dio = Dio();

  Future<List<WelcomeBonusModel>?> fetchWelcomeBonus() async {
    try {
      // Response response = await dio.get(welcomeBonusUrl);

      int statusCode = 200;

      if (statusCode == 200) {
        List<dynamic> data = welcomeBonus;
        List<WelcomeBonusModel> welcomebonusList = data.map((data) {
          return WelcomeBonusModel.fromJson(data);
        }).toList();

        return welcomebonusList;
      } else {
        return null;
      }
    } catch (e) {
      log('Error : $e');
      return null;
    }
  }

  Future<List<ReferralBonusModel>?> fetchRefarralBonus() async {
    try {
      // Response response = await dio.get(welcomeBonusUrl);

      int statusCode = 200;

      if (statusCode == 200) {
        List<dynamic> data = referralBonus;
        List<ReferralBonusModel> referralBonusList = data.map((data) {
          return ReferralBonusModel.fromJson(data);
        }).toList();

        return referralBonusList;
      } else {
        return null;
      }
    } catch (e) {
      log('Error : $e');
      return null;
    }
  }

  Future<List<CouponBonusModel>?> fetchCouponBonus() async {
    try {
      // Response response = await dio.get(welcomeBonusUrl);

      int statusCode = 200;

      if (statusCode == 200) {
        List<dynamic> data = couponBonus;
        List<CouponBonusModel> couponBonusList = data.map((data) {
          return CouponBonusModel.fromJson(data);
        }).toList();

        return couponBonusList;
      } else {
        return null;
      }
    } catch (e) {
      log('Error : $e');
      return null;
    }
  }

  Future<List<SubscriptionBonusModel>?> fetchSubscriptionBonus() async {
    try {
      // Response response = await dio.get(welcomeBonusUrl);

      int statusCode = 200;

      if (statusCode == 200) {
        List<dynamic> data = subscriptionBonus;
        List<SubscriptionBonusModel> subscriptionBonusList = data.map((data) {
          return SubscriptionBonusModel.fromJson(data);
        }).toList();

        return subscriptionBonusList;
      } else {
        return null;
      }
    } catch (e) {
      log('Error : $e');
      return null;
    }
  }

  Future<List<WalletBounsModel>?> fetchWalletBonus() async {
    try {
      // Response response = await dio.get(welcomeBonusUrl);

      int statusCode = 200;

      if (statusCode == 200) {
        List<dynamic> data = walletBonus;
        List<WalletBounsModel> walletBonusList = data.map((data) {
          return WalletBounsModel.fromJson(data);
        }).toList();

        return walletBonusList;
      } else {
        return null;
      }
    } catch (e) {
      log('Error : $e');
      return null;
    }
  }

  Future<List<PerformanceBonusModel>?> fetchPerformanceBonus() async {
    try {
      // Response response = await dio.get(welcomeBonusUrl);

      int statusCode = 200;

      if (statusCode == 200) {
        List<dynamic> data = performanceBonus;
        List<PerformanceBonusModel> performanceBonusList = data.map((data) {
          return PerformanceBonusModel.fromJson(data);
        }).toList();

        return performanceBonusList;
      } else {
        return null;
      }
    } catch (e) {
      log('Error : $e');
      return null;
    }
  }
}
