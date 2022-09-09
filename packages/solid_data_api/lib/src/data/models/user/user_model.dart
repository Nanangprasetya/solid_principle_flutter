import 'package:solid_data_api/src/data/models/user/user_address_model.dart';
import 'package:solid_domain/solid_domain.dart';

class UserModel extends UserEntity {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final UserAddressModel address;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
  }) : super(
            id: id,
            name: name,
            username: username,
            email: email,
            phone: phone,
            website: website,
            address: address,
          );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      website: json['website'] as String, 
      address: UserAddressModel.fromJson(json['address']),
    );
  }
}
