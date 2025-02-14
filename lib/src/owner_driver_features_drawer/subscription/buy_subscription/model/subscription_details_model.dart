class SubscriptionPlan {
  final String id;
  final String name;
  final double price;

  SubscriptionPlan({
    required this.id,
    required this.name,
    required this.price,
  });

  factory SubscriptionPlan.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlan(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
}
