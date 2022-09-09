import 'package:equatable/equatable.dart';

class UserAddressEntity extends Equatable {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final String lat;
  final String lng;
  
  UserAddressEntity({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.lat,
    required this.lng,
  });

  @override
  List<Object> get props {
    return [
      street,
      suite,
      city,
      zipcode,
      lat,
      lng,
    ];
  }
}
