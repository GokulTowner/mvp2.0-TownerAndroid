import 'dart:developer';
import '../../../../../../imports.dart';

class TripComptetedProvider extends ChangeNotifier {
  TripComptetedModel? _tripCompletedData;
  TripComptetedModel? get tripCompletedData => _tripCompletedData;


  final TextEditingController _discount = TextEditingController();
  TextEditingController get discount => _discount;

  final TextEditingController _extra = TextEditingController();
  TextEditingController get extra => _extra;

  TripComptetedProvider() {
    fetchDriverOnTheWayDetails();
  }

  Future<void> fetchDriverOnTheWayDetails() async {
    TripCompletedService tripCompletedService = TripCompletedService();

    final result = await tripCompletedService.fetchTripCompleted();

    if (result != null) {
      _tripCompletedData = result;
      log(_tripCompletedData!.baseFare.toString());
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

  Future<void> launchGoogleMapsNavigation(
      double sourceLat,
      double sourceLng,
      double destLat,
      double destLng,
      ) async {
    final url = 'https://www.google.com/maps/dir/?api=1'
        '&origin=${sourceLat},${sourceLng}'
        '&destination=${destLat},${destLng}'
        '&travelmode=driving'
        '&dir_action=navigate';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url),mode: LaunchMode.externalNonBrowserApplication);
    } else {
      throw 'Could not launch Google Maps';
    }
  }
}
