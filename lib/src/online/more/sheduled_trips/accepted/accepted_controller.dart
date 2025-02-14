import 'dart:developer';
import '../../../../../imports.dart';

class AcceptedRidePovider extends ChangeNotifier {
  AcceptedRideModel? _acceptedRideDetails;
  AcceptedRideModel? get acceptedRideDetails => _acceptedRideDetails;

  AcceptedRidePovider() {
    fetchDriverOnTheWayDetails();
  }

  Future<void> fetchDriverOnTheWayDetails() async {
    AcceptedRideServices acceptedRideServices = AcceptedRideServices();

    final result = await acceptedRideServices.fetchAcceptedRideData();

    if (result != null) {
      _acceptedRideDetails = result;
      log(_acceptedRideDetails!.driverName.toString());
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
