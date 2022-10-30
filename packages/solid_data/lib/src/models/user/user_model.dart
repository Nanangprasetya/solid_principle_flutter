import 'package:hive/hive.dart';
import 'package:solid_data/solid_data.dart';
import 'package:solid_domain/solid_domain.dart';

part 'user_model.g.dart';

@HiveType(typeId: HiveTypes.userModel, adapterName: HiveAdapters.userModel)
class UserModel extends UserEntity {
	@HiveField(UserModelFields.id)
  final int id;
	@HiveField(UserModelFields.name)
  final String name;
	@HiveField(UserModelFields.username)
  final String username;
	@HiveField(UserModelFields.email)
  final String email;
	@HiveField(UserModelFields.phone)
  final String phone;
	@HiveField(UserModelFields.website)
  final String website;
	@HiveField(UserModelFields.address)
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