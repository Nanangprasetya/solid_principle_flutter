import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:solid_data_api/src/core/core.dart';
import 'package:solid_data_api/src/data/datasources/datasources.dart';
import 'package:solid_domain/solid_domain.dart';

@lazySingleton
class UserRepositoryImpl extends UserRepository {
  final UserRemoteDatasource userRemoteDatasource;

  UserRepositoryImpl({required this.userRemoteDatasource});

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
