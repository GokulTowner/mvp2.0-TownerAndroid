class SubscriptionInvoiceModel {
  final String startDate;
  final String endDate;
  final String businessName;
  final String driverName;
  final String vehicleRegNo;
  final String vehicleType;
  final String panNumber;
  final String gstNumber;
  final int gstValue;
  final int sgstValue;
  final int discount;
  final int convCharges;

  SubscriptionInvoiceModel({
    required this.startDate,
    required this.endDate,
    required this.businessName,
    required this.driverName,
    required this.vehicleRegNo,
    required this.vehicleType,
    required this.panNumber,
    required this.gstNumber,
    required this.gstValue,
    required this.sgstValue,
    required this.discount,
    required this.convCharges,
  });

  factory SubscriptionInvoiceModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionInvoiceModel(
      startDate: json['startDate'],
      endDate: json['endDate'],
      businessName: json['businessName'],
      driverName: json['driverName'],
      vehicleRegNo: json['vehicleRegNo'],
      vehicleType: json['vehicleType'],
      panNumber: json['panNumber'],
      gstNumber: json['gstNumber'],
      gstValue: json['gstValue'],
      sgstValue: json['sgstValue'],
      discount: json['discount'],
      convCharges: json['convCharges'],
    );
  }
}
