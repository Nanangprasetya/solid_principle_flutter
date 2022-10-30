import 'package:dartz/dartz.dart';
import 'package:solid_data/core/core.dart';
import '../../entities/user/user_entity.dart';
import '../../entities/user/user_params_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getUserData(UserParamsEntity params);
}