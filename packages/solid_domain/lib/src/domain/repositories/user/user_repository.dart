import 'package:dartz/dartz.dart';
import 'package:solid_domain/src/core/failures/failure.dart';
import 'package:solid_domain/src/domain/entities/user/user_entity.dart';
import 'package:solid_domain/src/domain/entities/user/user_params_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getUserData(UserParamsEntity params);
}