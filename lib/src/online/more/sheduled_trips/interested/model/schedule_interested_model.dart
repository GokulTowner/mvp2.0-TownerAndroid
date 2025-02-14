class ScheduledInterestedModel {
  final String tripId;
  final String serviceType;
  final String vehicleType;
  final String driverPhoto;
  final String driverName;
  final String vehicleNumber;
  final String vehicleModel;
  final String tripAmount;
  final String tripDate;
  final String tripTime;
  final String tripStatus;
  final String tripCancelledReason;
  final String pickUpLocation;
  final String dropLocation;
  final String convenientCharges;
  final String discount;
  final String gst;
  final String sgst;
  final String riderName;
  final String riderPic;
  final String riderRating;
  final String channelpartner;
  final String bookingStyle;
  final String remainingKms;
  final String remainingTime;
  final String tripDistance;
  final String tripDuration;
  final String extraKms;
  final String extraMinutes;
  final String baseFare;

  ScheduledInterestedModel({
    required this.tripId,
    required this.serviceType,
    required this.vehicleType,
    required this.driverPhoto,
    required this.driverName,
    required this.vehicleNumber,
    required this.vehicleModel,
    required this.tripAmount,
    required this.tripDate,
    required this.tripTime,
    required this.tripStatus,
    required this.tripCancelledReason,
    required this.pickUpLocation,
    required this.dropLocation,
    required this.convenientCharges,
    required this.discount,
    required this.gst,
    required this.sgst,
    required this.riderName,
    required this.riderPic,
    required this.riderRating,
    required this.channelpartner,
    required this.bookingStyle,
    required this.remainingKms,
    required this.remainingTime,
    required this.tripDistance,
    required this.tripDuration,
    required this.extraKms,
    required this.extraMinutes,
    required this.baseFare,
  });

  factory ScheduledInterestedModel.fromJson(Map<String, dynamic> json) {
    return ScheduledInterestedModel(
      tripId: json['tripId'],
      serviceType: json['serviceType'],
      vehicleType: json['vehicleType'],
      driverPhoto: json['driverPhoto'],
      driverName: json['driverName'],
      vehicleNumber: json['vehicleNumber'],
      vehicleModel: json['vehicleModel'],
      tripAmount: json['tripAmount'],
      tripDate: json['tripDate'],
      tripTime: json['tripTime'],
      tripStatus: json['tripStatus'],
      tripCancelledReason: json['tripCancelledReason'],
      pickUpLocation: json['pickUpLocation'],
      dropLocation: json['dropLocation'],
      convenientCharges: json['convenientCharges'],
      discount: json['discount'],
      gst: json['gst'],
      sgst: json['sgst'],
      riderName: json['riderName'],
      riderPic: json['riderPic'],
      riderRating: json['riderRating'],
      channelpartner: json['channelpartner'],
      bookingStyle: json['bookingStyle'],
      remainingKms: json['remainingKms'],
      remainingTime: json['remainingTime'],
      tripDistance: json['tripDistance'],
      tripDuration: json['tripDuration'],
      extraKms: json['extraKms'],
      extraMinutes: json['extraMinutes'],
      baseFare: json['baseFare'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tripId': tripId,
      'serviceType': serviceType,
      'vehicleType': vehicleType,
      'driverPhoto': driverPhoto,
      'driverName': driverName,
      'vehicleNumber': vehicleNumber,
      'vehicleModel': vehicleModel,
      'tripAmount': tripAmount,
      'tripDate': tripDate,
      'tripTime': tripTime,
      'tripStatus': tripStatus,
      'tripCancelledReason': tripCancelledReason,
      'pickUpLocation': pickUpLocation,
      'dropLocation': dropLocation,
      'convenientCharges': convenientCharges,
      'discount': discount,
      'gst': gst,
      'sgst': sgst,
      'riderName': riderName,
      'riderPic': riderPic,
      'riderRating': riderRating,
      'channelpartner': channelpartner,
      'bookingStyle': bookingStyle,
      'remainingKms': remainingKms,
      'remainingTime': remainingTime,
      'tripDistance': tripDistance,
      'tripDuration': tripDuration,
      'extraKms': extraKms,
      'extraMinutes': extraMinutes,
      'baseFare': baseFare,
    };
  }
}
