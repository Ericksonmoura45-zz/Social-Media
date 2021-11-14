class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
  });

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
    };
  }

  factory Address.fromJson(Map<String, dynamic> map) {
    return Address(
      street: map['street'],
      suite: map['suite'],
      city: map['city'],
      zipcode: map['zipcode'],
    );
  }

  @override
  String toString() {
    return 'Address(street: $street, suite: $suite, city: $city, zipcode: $zipcode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Address &&
        other.street == street &&
        other.suite == suite &&
        other.city == city &&
        other.zipcode == zipcode;
  }

  @override
  int get hashCode {
    return street.hashCode ^ suite.hashCode ^ city.hashCode ^ zipcode.hashCode;
  }
}
