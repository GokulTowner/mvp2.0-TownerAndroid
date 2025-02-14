class User {
  final String? id;
  final String name;
  final String email;
  final String? phoneNumber;
  final DateTime? dateOfBirth;
  final String? profilePicture;

  User({
    this.id,
    required this.name,
    required this.email,
    this.phoneNumber,
    this.dateOfBirth,
    this.profilePicture,
  });

  // Create a User from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.parse(json['dateOfBirth'])
          : null,
      profilePicture: json['profilePicture'],
    );
  }

  // Convert a User to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'profilePicture': profilePicture,
    };
  }

  // Create a copy of User with some fields changed
  User copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? profilePicture,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  // Override toString for easier debugging
  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, profilePicture: $profilePicture)';
  }

  // Override == operator for equality check
  @override
  // bool operator = (Object other){

  // }

  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.dateOfBirth == dateOfBirth &&
        other.profilePicture == profilePicture;
  }

  // Override hashCode
  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        dateOfBirth.hashCode ^
        profilePicture.hashCode;
  }
}

class A {
  slkdfj() {
    User.fromJson({});

    User(name: 'name', email: 'email').toJson();
  }
}
