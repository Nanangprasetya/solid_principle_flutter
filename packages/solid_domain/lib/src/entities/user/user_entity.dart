import 'package:equatable/equatable.dart';
import '../entities.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final UserAddressEntity address;

  const UserEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
  });

  static const empty = UserEntity(
    id: 0,
    name: '',
    username: '',
    email: '',
    phone: '',
    website: '',
    address: UserAddressEntity.empty,
  );

  bool get isEmpty => this == UserEntity.empty;

  bool get isNotEmpty => this != UserEntity.empty;

  @override
  List<Object> get props {
    return [
      id,
      name,
      username,
      email,
      phone,
      website,
      address,
    ];
  }
}
