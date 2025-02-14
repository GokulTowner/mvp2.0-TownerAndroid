import 'dart:developer';
import '../../../../../../imports.dart';

class TripCompletedService {
  Map<String, dynamic> tripCompletedData = {
    "serviceType": "Daily Ride",
    "tripAmount": "₹250.00",
    "pickUpLocation": "Jp Nagar, 2nd phase",
    "dropLocation": "Satellite Bus stand",
    "tripTime": "60 mins",
    "tripDistance": "30 km",
    "riderName": "Shruthi",
    "riderPic":
        "https://static.vecteezy.com/system/resources/thumbnails/030/798/360/small_2x/beautiful-asian-girl-wearing-over-size-hoodie-in-casual-style-ai-generative-photo.jpg",
    "riderRating": "4.5 since 2022",
    "extraKm": "₹25 | Extra Minute - ₹1",
    "baseFare": "3 KM - ₹60 | 15 Minutes",
    "dayBata": "6 am to 9 pm - 1 x 500 = 500",
    "nightBata": "9 pm to 6 am - 2 x 500 = 1000",
    "remainingTime": "30 minutes",
    "bookingId": "OIOT451324",
    "tripStartTime": "10.00AM",
    "tripEndTime": "11.00AM",
    "vehicleModel": "Sedan",
    "vehicleNumber": "KL71 5620",
  };

  String tripCompletedUrl = "api/tripCompleted";
  Dio dio = Dio();

  Future<TripComptetedModel?> fetchTripCompleted() async {
    try {
      // Response response = await dio.get(tripCompletedUrl);
      int statuscode = 200;
      if (statuscode == 200) {
        dynamic result = TripComptetedModel.fromJson(tripCompletedData);
        return result;
      } else {
        throw Exception('Failed to fetch trip completed data');
      }
    } catch (e) {
      log('Error fetching trip completed data: $e');
      return null;
    }
  }
}
