import 'dart:developer';
import '../../../../imports.dart';

class SubscriptionProvider extends ChangeNotifier {
  SubscriptionOwnerService subscriptionOwnerService =
      SubscriptionOwnerService();
  SubscriptionProvider() {
    // subscriptionModelList;
    fetchVehicleSubscription();
    // filterValidSubscriptions();
    // filterNotValidSubscriptions();
  }
  // final List<Map<String, dynamic>> _subscriptionList = [
  //   {
  //     'vehicleId': '01',
  //     'vehicleNo': 'KA-29-T-3255',
  //     'vehicleType': 'Sedan',
  //     'vehicleModel': 'Honda City',
  //     'isProfileAccepted': false,
  //     'planName': 'FREE : 30 days',
  //     'planValidity': 30,
  //     'planAmount': 4500,
  //     'remainingDays': 29,
  //     'validityType': 'Monthly',
  //     'startDate': '10/Feb/2024 | 10:AM',
  //     'endDate': '10/Mar/2024 | 10:AM',
  //     'invoiceData': {
  //       'invoiceId': 'MTC00011',
  //       'startDate': '10/Feb/2024 | 10:AM',
  //       'endDate': '10/Mar/2024 | 10:AM',
  //       'businessName': 'Jain Travel',
  //       'businessPrfId': 'TWN34257865',
  //       'driverName': 'Jithin John',
  //       'vehicleRegNo': 'KA-29-T-3255',
  //       'vehicleType': 'Sedan',
  //       'panNumber': 'APBV8025C',
  //       'gstNumber': 'AVBA1234656',
  //       'gstValue': 10.00,
  //       'sgstValue': 10.00,
  //       'discount': 100.00,
  //       'convCharges': 200.00,
  //     }
  //   },
  //   {
  //     'vehicleId': '02',
  //     'vehicleNo': 'KA-29-T-3255',
  //     'vehicleType': 'Sedan',
  //     'vehicleModel': 'Honda City',
  //     'isProfileAccepted': true,
  //     'planName': 'FREE : 30 days',
  //     'planValidity': 30,
  //     'planAmount': 4600,
  //     'remainingDays': 2,
  //     'validityType': 'Monthly',
  //     'startDate': '10/Feb/2024 | 10:AM',
  //     'endDate': '10/Mar/2024 | 10:AM',
  //     'invoiceData': {
  //       'invoiceId': 'MTC00011',
  //       'startDate': '10/Feb/2024 | 10:AM',
  //       'endDate': '10/Mar/2024 | 10:AM',
  //       'businessName': 'Jain Travel',
  //       'businessPrfId': 'TWN34257865',
  //       'driverName': 'Jithin John',
  //       'vehicleRegNo': 'KA-29-T-3255',
  //       'vehicleType': 'Sedan',
  //       'panNumber': 'APBV8025C',
  //       'gstNumber': 'AVBA1234656',
  //       'gstValue': 10.00,
  //       'sgstValue': 10.00,
  //       'discount': 100.00,
  //       'convCharges': 200.00,
  //     }
  //   },
  //   {
  //     'vehicleId': '03',
  //     'vehicleNo': 'KA-29-T-3255',
  //     'vehicleType': 'Sedan',
  //     'vehicleModel': 'Honda City',
  //     'isProfileAccepted': true,
  //     'planName': 'DAILY : 1 days',
  //     'planValidity': 30,
  //     'planAmount': 4900,
  //     'remainingDays': 0,
  //     'validityType': 'Monthly',
  //     'startDate': '10/Mar/2024 | 10:AM',
  //     'endDate': '11/Mar/2024 | 10:AM',
  //     'invoiceData': {
  //       'invoiceId': 'MTC00011',
  //       'startDate': '10/Mar/2024 | 10:AM',
  //       'endDate': '11/Mar/2024 | 10:AM',
  //       'businessName': 'Jain Travel',
  //       'businessPrfId': 'TWN34257865',
  //       'driverName': 'Naveen Raj',
  //       'vehicleRegNo': 'KA-29-T-3255',
  //       'vehicleType': 'Sedan',
  //       'panNumber': 'APBV8025C',
  //       'gstNumber': 'AVBA1234656',
  //       'gstValue': 10.00,
  //       'sgstValue': 10.00,
  //       'discount': 100.00,
  //       'convCharges': 200.00,
  //     }
  //   },
  //   {
  //     'vehicleId': '04',
  //     'vehicleNo': 'KA-29-T-3255',
  //     'vehicleType': 'Sedan',
  //     'vehicleModel': 'Maruthi Ertiga',
  //     'isProfileAccepted': true,
  //     'planName': 'WEAKLY : 7 days',
  //     'planValidity': 7,
  //     'planAmount': 1200,
  //     'remainingDays': 3,
  //     'validityType': 'Weakly',
  //     'startDate': '1/Mar/2024 | 10:AM',
  //     'endDate': '8/Mar/2024 | 10:AM',
  //     'invoiceData': {
  //       'invoiceId': 'MTC00011',
  //       'startDate': '1/Mar/2024 | 10:AM',
  //       'endDate': '8/Mar/2024 | 10:AM',
  //       'businessName': 'Jain Travel',
  //       'businessPrfId': 'TWN34257865',
  //       'driverName': 'Jobin Reddy',
  //       'vehicleRegNo': 'KA-29-T-3255',
  //       'vehicleType': 'Sedan',
  //       'panNumber': 'APBV8025C',
  //       'gstNumber': 'AVBA1234656',
  //       'gstValue': 10.00,
  //       'sgstValue': 10.00,
  //       'discount': 100.00,
  //       'convCharges': 200.00,
  //     }
  //   },
  //   {
  //     'vehicleId': '05',
  //     'vehicleNo': 'KA-29-T-3255',
  //     'vehicleType': 'Sedan',
  //     'vehicleModel': 'Honda City',
  //     'isProfileAccepted': false,
  //     'planName': 'FREE : 30 days',
  //     'planValidity': 30,
  //     'planAmount': 4500,
  //     'remainingDays': 0,
  //     'validityType': 'Free',
  //     'startDate': '16/Feb/2024 | 10:AM',
  //     'endDate': '16/Mar/2024 | 10:AM',
  //     'invoiceData': {
  //       'invoiceId': 'MTC00011',
  //       'startDate': '16/Feb/2024 | 10:AM',
  //       'endDate': '16/Mar/2024 | 10:AM',
  //       'businessName': 'Jain Travel',
  //       'businessPrfId': 'TWN34257865',
  //       'driverName': 'Ramesh Kumar',
  //       'vehicleRegNo': 'KA-29-T-3255',
  //       'vehicleType': 'Sedan',
  //       'panNumber': 'APBV8025C',
  //       'gstNumber': 'AVBA1234656',
  //       'gstValue': 10.00,
  //       'sgstValue': 10.00,
  //       'discount': 100.00,
  //       'convCharges': 200.00,
  //     }
  //   }
  // ];
  // List<VehicleSubscriptionModel> get subscriptionModelList => _subscriptionList
  //     .map((json) => VehicleSubscriptionModel.fromJson(json))
  //     .toList();

  final Map<String, dynamic> _subscriptionInvoice = {
    'startDate': '10 Sep, 2022 | 10:30 AM',
    'endDate': '10 Sep, 2022 | 11:30 AM',
    'businessName': 'Jain Travel',
    'driverName': 'Ramesh Kumar',
    'vehicleRegNo': 'KL-20-J-8899',
    'vehicleType': 'Sedan',
    'panNumber': 'APBV8025C',
    'gstNumber': 'AVBA1234656',
    'gstValue': 10.00,
    'sgstValue': 10.00,
    'discount': 100.00,
    'convCharges': 200.00,
  };
  Map<String, dynamic> get subscriptionInvoice => _subscriptionInvoice;

  List<VehicleSubscriptionModel> _allVehSubList = [];

  List<VehicleSubscriptionModel> _validSubscription = [];
  List<VehicleSubscriptionModel> get validSubscription => _validSubscription;

  List<VehicleSubscriptionModel> _noValidSubscription = [];
  List<VehicleSubscriptionModel> get noValidSubscription =>
      _noValidSubscription;

  Color myPlanColor = cMainGreen;
  Color viewHistory = cDarkBlack;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  TabController? _tabController;
  TabController? get tabController => _tabController;

  void setTabIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void filterValidSubscriptions() {
    _validSubscription = _allVehSubList
        .where((subscription) => subscription.remainingDays >= 1)
        .toList();

    notifyListeners();
  }

  void filterNotValidSubscriptions() {
    _noValidSubscription = _allVehSubList
        .where((subscription) => subscription.remainingDays < 1)
        .toList();

    notifyListeners();
  }

  double calculatePercentage(int remainingDays, int totalDays) {
    double percentage = (remainingDays / totalDays * 100) / 100;
    return percentage;
  }

  Future<void> fetchVehicleSubscription() async {
    final result =
        await subscriptionOwnerService.fetchVehicleSubscriptionDetails();

    if (result != null) {
      _allVehSubList = result;
      log('vehi list ${_allVehSubList[0].planName}');
      filterValidSubscriptions();
      filterNotValidSubscriptions();
      notifyListeners();
    }
  }
}
