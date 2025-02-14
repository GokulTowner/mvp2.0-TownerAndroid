class VehicleProfileDriverModel {
  final String type;
  final String model;
  final String driverAlloted;
  final String rc;
  final String status;
  final String imagePath;

  VehicleProfileDriverModel({
    required this.type,
    required this.model,
    required this.driverAlloted,
    required this.rc,
    required this.status,
    required this.imagePath,
  });

  factory VehicleProfileDriverModel.fromJson(Map<String, dynamic> json) {
    return VehicleProfileDriverModel(
      type: json['type'],
      model: json['model'],
      driverAlloted: json['driverAlloted'],
      rc: json['rc'],
      status: json['status'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'model': model,
      'driverAlloted': driverAlloted,
      'rc': rc,
      'status': status,
      'imagePath': imagePath,
    };
  }
}
