class OwnTripModel {
  String pickUpLocation;
  LocationLatLng pickUpLatLng;
  String dropLocation;
  LocationLatLng dropLatLng;
  String userId;
  String serviceType;
  String? coupon;

  OwnTripModel({
    required this.pickUpLocation,
    required this.pickUpLatLng,
    required this.dropLocation,
    required this.dropLatLng,
    required this.userId,
    required this.serviceType,
    this.coupon,
  });

  factory OwnTripModel.fromJson(Map<String, dynamic> json) {
    return OwnTripModel(
      pickUpLocation: json['pickUpLocation'],
      pickUpLatLng: json['pickUpLatLng'],
      dropLocation: json['dropLocation'],
      dropLatLng: json['dropLatLng'],
      userId: json['userId'],
      serviceType: json['serviceType'],
      coupon: json['coupon'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['pickUpLocation'] = pickUpLocation;
    data['pickUpLatLng'] = pickUpLatLng.toJson();
    data['dropLocation'] = dropLocation;
    data['dropLatLng'] = dropLatLng.toJson();
    data['userId'] = userId;
    data['serviceType'] = serviceType;
    data['coupon'] = coupon;
    return data;
  }
}

class LocationLatLng {
  String latitude;
  String longitude;

  LocationLatLng({required this.latitude, required this.longitude});

  factory LocationLatLng.fromJson(Map<String, dynamic> json) {
    return LocationLatLng(
      latitude: json['Latitude'],
      longitude: json['Longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Latitude'] = latitude;
    data['Longitude'] = longitude;
    return data;
  }
}
