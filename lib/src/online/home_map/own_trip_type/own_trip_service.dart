import 'dart:developer';
import '../../../../../imports.dart';

class DailyRideService {
  String dailyRideUrl = 'api/dailyRideUrl';

  Future<Map<String, dynamic>?> postPickupData(OwnTripModel data) async {
    try {
      // Response response = await dio.post(dailyRideUrl,data:data.toJson);
      int statuscode = 200;
      log('message ${data.toJson()}');
      if (statuscode == 200) {
        Map<String, dynamic> status = {
          'status': true,
          'message': 'Data submitted successfully',
        };

        return status;
      } else {
        throw Exception('Failed to post pickup data');
      }
    } catch (e) {
      log('Error in posting pickup data: $e');
      return null;
    }
  }
}
