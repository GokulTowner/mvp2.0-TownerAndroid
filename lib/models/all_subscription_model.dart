class AllSubscriptionModel {
  final String licenceNumber;
  final String carModel;
  final String licenseProfile;
  final String isProfileAccepted;
  final int remainingDays;

  const AllSubscriptionModel({
    required this.licenceNumber,
    required this.carModel,
    required this.licenseProfile,
    required this.isProfileAccepted,
    required this.remainingDays,
  });
}
