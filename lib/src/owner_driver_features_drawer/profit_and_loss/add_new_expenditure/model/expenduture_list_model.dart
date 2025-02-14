class ExpenditureModel {
  final String name;

  ExpenditureModel({required this.name});

  // Convert a ExpenditureModel object into a Map object
  Map<String, dynamic> toJson() => {
        'name': name,
      };

  // Extract a ExpenditureModel object from a Map object
  factory ExpenditureModel.fromJson(Map<String, dynamic> json) {
    return ExpenditureModel(
      name: json['name'],
    );
  }
}
