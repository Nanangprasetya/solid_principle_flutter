import 'package:hive/hive.dart';
import 'package:solid_data/solid_data.dart';
import 'package:solid_domain/solid_domain.dart';

part 'user_address_model.g.dart';

@HiveType(typeId: HiveTypes.userAddressModel, adapterName: HiveAdapters.userAddressModel)
class UserAddressModel extends UserAddressEntity {
  @HiveField(UserAddressModelFields.street)
  final String street;
  @HiveField(UserAddressModelFields.suite)
  final String suite;
  @HiveField(UserAddressModelFields.city)
  final String city;
  @HiveField(UserAddressModelFields.zipcode)
  final String zipcode;
  @HiveField(UserAddressModelFields.lat)
  final String lat;
  @HiveField(UserAddressModelFields.lng)
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
