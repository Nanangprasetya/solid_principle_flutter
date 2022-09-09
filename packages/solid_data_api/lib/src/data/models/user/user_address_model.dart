import 'package:solid_domain/solid_domain.dart';

class UserAddressModel extends UserAddressEntity {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final String lat;
  final String lng;

  UserAddressModel({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.lat,
    required this.lng,
  }) : super(
          street: street,
          suite: suite,
          city: city,
          zipcode: zipcode,
          lat: lat,
          lng: lng,
        );

  factory UserAddressModel.fromJson(Map<String, dynamic> json) {
    return UserAddressModel(
      street: json['street'] as String,
      suite: json['suite'] as String,
      city: json['city'] as String,
      zipcode: json['zipcode'] as String,
      lat: json['geo']['lat'] as String,
      lng: json['geo']['lng'] as String,
    );
  }
}
