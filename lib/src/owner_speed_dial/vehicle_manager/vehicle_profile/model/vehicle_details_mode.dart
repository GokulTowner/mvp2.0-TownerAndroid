class VehicleDetailsModel {
  final String vehicleId;
  final String vehImage;
  final String vehicleType;
  final String model;
  final String driver;
  final String rc;
  final String docStatus;

  VehicleDetailsModel({
    required this.vehicleId,
    required this.vehImage,
    required this.vehicleType,
    required this.model,
    required this.driver,
    required this.rc,
    required this.docStatus,
  });

  factory VehicleDetailsModel.fromJson(Map<String, dynamic> json) {
    return VehicleDetailsModel(
      vehicleId: json['vehicleId'],
      vehImage: json['vehImage'],
      vehicleType: json['vehicleType'],
      model: json['model'],
      driver: json['driver'],
      rc: json['rc'],
      docStatus: json['docStatus'],
    );
  }
}
