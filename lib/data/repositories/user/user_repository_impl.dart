import 'package:dartz/dartz.dart';
import '../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../data.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDatasource userRemoteDatasource;

  UserRepositoryImpl(this.userRemoteDatasource);

  @override
  Future<Either<Failure, List<UserEntity>>> getUserData(UserParamsEntity params) async {
    try {
      List<UserEntity> data = await userRemoteDatasource.getUserData(params);

      return Right(data);
    } catch (e) {
      if (e is ServerException) {
        return Left(ServerFailure(message: e.message));
      } else {
        return Left(UnknownFailure(message: FAILURE_UNKNOWN));
      }
    }
  }
}
