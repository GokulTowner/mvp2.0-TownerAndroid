import 'dart:developer';
import '../../../../../imports.dart';

class EstimationRideService {
  Map<String, dynamic> estimationRideData = {
    "serviceType": "Daily Ride",
    "tripAmount": "250.00",
    "discountAmt": '230.00',
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
    "remainingTime": "1 hr 15 min",
    "bookingId": "OIOT451324",
    "riderNumber": "+918907444333",
    "vehicleType": "Sedan",
  };

  String estimationRideUrl = "api/estimationRide";
  Dio dio = Dio();

  Future<EstimationRideModel?> fetchEstimationRide() async {
    try {
      // Response response = await dio.get(estimationRideUrl);
      int statuscode = 200;
      if (statuscode == 200) {
        dynamic result = EstimationRideModel.fromJson(estimationRideData);
        return result;
      } else {
        throw Exception('Failed to fetch estimation ride data');
      }
    } catch (e) {
      log('Error fetching estimation ride data: $e');
      return null;
    }
  }
}
