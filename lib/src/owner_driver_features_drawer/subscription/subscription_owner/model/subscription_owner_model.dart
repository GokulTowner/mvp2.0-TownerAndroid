class VehicleSubscriptionModel {
  final String vehicleId;
  final String vehicleNo;
  final String vehicleType;
  final String vehicleModel;
  final bool isProfileAccepted;
  final String planName;
  final int planValidity;
  final double planAmount;
  final int remainingDays;
  final String validityType;
  final String startDate;
  final String endDate;
  final InvoiceData invoiceData;

  VehicleSubscriptionModel({
    required this.vehicleId,
    required this.vehicleNo,
    required this.vehicleType,
    required this.vehicleModel,
    required this.isProfileAccepted,
    required this.planName,
    required this.planValidity,
    required this.planAmount,
    required this.remainingDays,
    required this.validityType,
    required this.startDate,
    required this.endDate,
    required this.invoiceData,
  });

  factory VehicleSubscriptionModel.fromJson(Map<String, dynamic> json) {
    return VehicleSubscriptionModel(
      vehicleId: json['vehicleId'],
      vehicleNo: json['vehicleNo'],
      vehicleType: json['vehicleType'],
      vehicleModel: json['vehicleModel'],
      isProfileAccepted: json['isProfileAccepted'],
      planName: json['planName'],
      planValidity: json['planValidity'],
      planAmount: json['planAmount'].toDouble(),
      remainingDays: json['remainingDays'],
      validityType: json['validityType'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      invoiceData: InvoiceData.fromJson(json['invoiceData']),
    );
  }
}

class InvoiceData {
  final String invoiceId;
  final String startDate;
  final String endDate;
  final String businessName;
  final String businessPrfId;
  final String driverName;
  final String vehicleRegNo;
  final String vehicleType;
  final String panNumber;
  final String gstNumber;
  final double subGrossAmount;
  final double cgstValue;
  final double sgstValue;
  final double discount;
  final double convCharges;

  InvoiceData({
    required this.invoiceId,
    required this.startDate,
    required this.endDate,
    required this.businessName,
    required this.businessPrfId,
    required this.driverName,
    required this.vehicleRegNo,
    required this.vehicleType,
    required this.panNumber,
    required this.subGrossAmount,
    required this.gstNumber,
    required this.cgstValue,
    required this.sgstValue,
    required this.discount,
    required this.convCharges,
  });

  factory InvoiceData.fromJson(Map<String, dynamic> json) {
    return InvoiceData(
      invoiceId: json['invoiceId'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      businessName: json['businessName'],
      businessPrfId: json['businessPrfId'],
      driverName: json['driverName'],
      vehicleRegNo: json['vehicleRegNo'],
      vehicleType: json['vehicleType'],
      panNumber: json['panNumber'],
      subGrossAmount: json['subGrossAmount'],
      gstNumber: json['gstNumber'],
      cgstValue: json['cgstValue'].toDouble(),
      sgstValue: json['sgstValue'].toDouble(),
      discount: json['discount'].toDouble(),
      convCharges: json['convCharges'].toDouble(),
    );
  }
}
