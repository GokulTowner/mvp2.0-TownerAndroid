class ForgotPasswordModel {
  String mobNumber;
  String appSingnature;
  bool isOwner;

  ForgotPasswordModel(
      {required this.mobNumber,
      required this.appSingnature,
      required this.isOwner});

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordModel(
      mobNumber: json['mobNumber'],
      appSingnature: json['appSingnature'],
      isOwner: json['isOwner'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mobNumber': mobNumber,
      'appSingnature': appSingnature,
      'isOwner': isOwner,
    };
  }
}
