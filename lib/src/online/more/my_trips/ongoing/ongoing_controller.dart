import 'dart:developer';
import '../../../../../imports.dart';

class OngoingDriverProvider extends ChangeNotifier {
  DriverOnGoingModel? _driverOnGoingModel;
  DriverOnGoingModel? get driverOnGoingModel => _driverOnGoingModel;

  OngoingDriverProvider() {
    fetchDriverOnTheWayDetails();
  }

  Future<void> fetchDriverOnTheWayDetails() async {
    DirverOnGoingService dirverOnGoingService = DirverOnGoingService();

    final result = await dirverOnGoingService.fetchDriverOnTheWay();

    if (result != null) {
      _driverOnGoingModel = result;
      log(_driverOnGoingModel!.driverName.toString());
      notifyListeners();
    }
  }

  Future<void> shareFunction() async {
    await FlutterShare.share(
      title: 'Share via',
      text: 'Thank you for sharing oiot',
      chooserTitle: 'Share via',
    );
  }
}
