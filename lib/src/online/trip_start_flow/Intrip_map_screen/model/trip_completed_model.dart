class TripComptetedModel {
  final String serviceType;
  final String tripAmount;
  final String pickUpLocation;
  final String dropLocation;
  final String tripTime;
  final String tripDistance;
  final String riderName;
  final String riderPic;
  final String riderRating;
  final String extraKm;
  final String baseFare;
  final String dayBata;
  final String nightBata;
  final String remainingTime;
  final String bookingId;
  final String tripStartTime;
  final String tripEndTime;
  final String vehicleModel;
  final String vehicleNumber;

  TripComptetedModel({
    required this.serviceType,
    required this.tripAmount,
    required this.pickUpLocation,
    required this.dropLocation,
    required this.tripTime,
    required this.tripDistance,
    required this.riderName,
    required this.riderPic,
    required this.riderRating,
    required this.extraKm,
    required this.baseFare,
    required this.dayBata,
    required this.nightBata,
    required this.remainingTime,
    required this.bookingId,
    required this.tripStartTime,
    required this.tripEndTime,
    required this.vehicleModel,
    required this.vehicleNumber,
  });

  factory TripComptetedModel.fromJson(Map<String, dynamic> json) {
    return TripComptetedModel(
      serviceType: json['serviceType'],
      tripAmount: json['tripAmount'],
      pickUpLocation: json['pickUpLocation'],
      dropLocation: json['dropLocation'],
      tripTime: json['tripTime'],
      tripDistance: json['tripDistance'],
      riderName: json['riderName'],
      riderPic: json['riderPic'],
      riderRating: json['riderRating'],
      extraKm: json['extraKm'],
      baseFare: json['baseFare'],
      dayBata: json['dayBata'],
      nightBata: json['nightBata'],
      remainingTime: json['remainingTime'],
      bookingId: json['bookingId'],
      tripStartTime: json['tripStartTime'],
      tripEndTime: json['tripEndTime'],
      vehicleModel: json['vehicleModel'],
      vehicleNumber: json['vehicleNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serviceType': serviceType,
      'tripAmount': tripAmount,
      'pickUpLocation': pickUpLocation,
      'dropLocation': dropLocation,
      'tripTime': tripTime,
      'tripDistance': tripDistance,
      'riderName': riderName,
      'riderPic': riderPic,
      'riderRating': riderRating,
      'extraKm': extraKm,
      'baseFare': baseFare,
      'dayBata': dayBata,
      'nightBata': nightBata,
      'remainingTime': remainingTime,
      'bookingId': bookingId,
      'tripStartTime': tripStartTime,
      'tripEndTime': tripEndTime,
      'vehicleModel': vehicleModel,
      'vehicleNumber': vehicleNumber,
    };
  }
}
