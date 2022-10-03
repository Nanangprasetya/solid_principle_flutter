import 'package:dartz/dartz.dart';
import '../../../../core/failures/failure.dart';
import '../../entities/user/user_entity.dart';
import '../../entities/user/user_params_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getUserData(UserParamsEntity params);
}