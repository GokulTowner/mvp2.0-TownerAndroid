import 'dart:developer';
import '../../../../../imports.dart';

class ScheduledInterestedService {
  List<Map<String, dynamic>> interestedDetails = [
    {
      "tripId": "OIOT00143",
      "serviceType": "Daily Ride",
      "vehicleType": "Sedan",
      "driverPhoto":
          "https://media.newyorker.com/photos/5b203f425ee2c7040773fedc/4:3/w_2251,h_1688,c_limit/760209_ra523.jpg",
      "driverName": "John",
      "vehicleNumber": "KA87465",
      "vehicleModel": "VW Vento",
      "tripAmount": "₹250.00",
      "tripDate": "10 Aug 2023",
      "tripTime": "12.00 PM",
      "tripStatus": "Cash Received",
      "tripCancelledReason": "",
      "pickUpLocation": "Jp Nagar, 2nd phase",
      "dropLocation": "Satellite Bus stand",
      "convenientCharges": "₹200",
      "discount": "₹50",
      "gst": "₹10",
      "sgst": "₹10",
      "riderName": "Shruthi",
      "riderPic":
          "https://static.vecteezy.com/system/resources/thumbnails/030/798/360/small_2x/beautiful-asian-girl-wearing-over-size-hoodie-in-casual-style-ai-generative-photo.jpg",
      "riderRating": "4.5 - Since 2022",
      "channelpartner": "OIOT",
      "bookingStyle": "Online Booking",
      "remainingKms": "5 km",
      "remainingTime": "10 mins",
      "tripDistance": "20 km",
      "tripDuration": "30 mins",
      "extraKms": "2 km",
      "extraMinutes": "5 mins",
      "baseFare": "3 KM - ₹ 60   | 15 Mint"
    },
    {
      "tripId": "OIOT007845",
      "serviceType": "Outstation",
      "vehicleType": "SUV",
      "driverPhoto":
          "https://prod.betootaadvocate.com/wp-content/uploads/2014/12/Indian-cab-driver.jpg",
      "driverName": "David",
      "vehicleNumber": "TN4589",
      "vehicleModel": "Toyota Fortuner",
      "tripAmount": "₹500.00",
      "tripDate": "11 Mar 2023",
      "tripTime": "10.00 AM",
      "tripStatus": "Trip Cancelled",
      "tripCancelledReason": "Driver unavailable",
      "pickUpLocation": "Jay Nagar",
      "dropLocation": "Nandihills",
      "convenientCharges": "₹400",
      "discount": "₹100",
      "gst": "₹10",
      "sgst": "₹10",
      "riderName": "Aishwarya",
      "riderPic":
          "https://media.istockphoto.com/id/1353379172/photo/cute-little-african-american-girl-looking-at-camera.jpg?s=612x612&w=0&k=20&c=RCOYytwS2nMGfEb80oyeiCcIiqMQu6wnTluAaxMBye4=",
      "riderRating": "4.1 - Since 2021",
      "channelpartner": "Red Bus",
      "bookingStyle": "Online Booking",
      "remainingKms": "10 km",
      "remainingTime": "20 mins",
      "tripDistance": "40 km",
      "tripDuration": "60 mins",
      "extraKms": "5 km",
      "extraMinutes": "10 mins",
      "baseFare": "3 KM - ₹ 60   | 15 Mint"
    },
    {
      "tripId": "OIOT001451",
      "serviceType": "Rental",
      "vehicleType": "Hatchback",
      "driverPhoto":
          "https://images.livemint.com/rf/Image-621x414/LiveMint/Period2/2016/11/04/Photos/Processed/cabs2-kPyD--621x414@LiveMint.JPG",
      "driverName": "Hameed",
      "vehicleNumber": "KA46598",
      "vehicleModel": "Toyota Etios Liva",
      "tripAmount": "₹350.00",
      "tripDate": "30 Aug 2023",
      "tripTime": "08.00 AM",
      "tripStatus": "Trip Cancelled",
      "tripCancelledReason": "Due to rain",
      "pickUpLocation": "MG Road",
      "dropLocation": "Madiwala",
      "convenientCharges": "₹300",
      "discount": "₹50",
      "gst": "₹10",
      "sgst": "₹10",
      "riderName": "Shilpa",
      "riderPic":
          "https://t4.ftcdn.net/jpg/06/12/99/75/360_F_612997518_8xmQvzuoXSCT5SKvARumeQ6X26S5U0vB.jpg",
      "riderRating": "4.5 - Since 2018",
      "channelpartner": "OIOT",
      "bookingStyle": "Online Booking",
      "remainingKms": "8 km",
      "remainingTime": "15 mins",
      "tripDistance": "25 km",
      "tripDuration": "35 mins",
      "extraKms": "3 km",
      "extraMinutes": "7 mins",
      "baseFare": "3 KM - ₹60   | 15 Mint"
    }
  ];

  String interestedTripDetailsUrl = 'api/interestedTripDetailsUrl';

  Dio dio = Dio();

  Future<List<ScheduledInterestedModel>?> fetchInterestedDetails() async {
    try {
      // Response response = await dio.get(pastTripDetailsUrl);

      int statuscode = 200;
      if (statuscode == 200) {
        dynamic result = interestedDetails;

        log('message r :${result.toString()}');
        List<ScheduledInterestedModel> interestedData = interestedDetails
            .map((pasttrip) => ScheduledInterestedModel.fromJson(pasttrip))
            .toList();
        return interestedData;
      } else {
        throw Exception('Failed to fetch interested trip data');
      }
    } catch (e) {
      log('Error fetching interested trip data: $e');
      return null;
    }
  }
}
