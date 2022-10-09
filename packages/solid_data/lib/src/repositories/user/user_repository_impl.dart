import 'package:dartz/dartz.dart';
import 'package:solid_data/solid_data.dart';
import 'package:solid_domain/solid_domain.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDatasource remoteDatasource;
  final UserLocalDatasource localDatasource;
  final NetworkInfo networkInfo;
  UserRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<UserEntity>>> getUserData(UserParamsEntity params) async {
    return _checkUserCache(
      () {
        try {
          return remoteDatasource.getUserData(params);
        } catch (e) {
          if (e is ServerException) {
            return Left(ServerFailure(message: e.message));
          } else {
            return Left(UnknownFailure(message: FAILURE_UNKNOWN));
          }
        }
      },
      isInit: params.isInit,
    );
  }

  Future<Either<Failure, List<UserModel>>> _checkUserCache(Function() getUsers, {required bool isInit}) async {
    try {
      if (await networkInfo.isConnected) {
        if (isInit) {
          localDatasource.usersDeleteCache();
        }

        final getUsersRemote = await getUsers();
        localDatasource.usersToCache(getUsersRemote);

        return Right(getUsersRemote);
      } else {
        List<UserModel> localData = await localDatasource.getUsersFromCache();

        return Right(localData);
      }
    } catch (e) {
      if (e is CacheException) {
        return Left(CacheFailure(message: e.message));
      } else {
        return Left(UnknownFailure(message: FAILURE_UNKNOWN));
      }
    }
  }
}
