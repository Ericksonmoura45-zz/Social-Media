import 'address.dart';

// DTO - Data Transfer Object
class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address.toJson(),
      'phone': phone,
      'website': website,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt(),
      name: map['name'],
      username: map['username'],
      email: map['email'],
      address: Address.fromJson(map['address']),
      phone: map['phone'],
      website: map['website'],
    );
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, username: $username, email: $email, address: $address, phone: $phone, website: $website)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.username == username &&
        other.email == email &&
        other.address == address &&
        other.phone == phone &&
        other.website == website;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        username.hashCode ^
        email.hashCode ^
        address.hashCode ^
        phone.hashCode ^
        website.hashCode;
  }
}
