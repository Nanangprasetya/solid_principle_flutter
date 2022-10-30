import 'package:dartz/dartz.dart';
import 'package:solid_data/solid_data.dart';
import 'package:solid_domain/solid_domain.dart';

class PhotoRepositoryImpl extends PhotoRepository {
  final PhotoRemoteDatasource remoteDatasource;
  final PhotoLocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  PhotoRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PhotosEntity>>> getPhotosData(PhotosParamsEntity params) async {
    return _checkPhotosCache(
      () {
        try {
          return remoteDatasource.getPhotosData(params);
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

  Future<Either<Failure, List<PhotosModel>>> _checkPhotosCache(Function() getPhotos, {required bool isInit}) async {
    try {
      if (await networkInfo.isConnected) {
        if (isInit) {
          localDatasource.photosDeleteCache();
        }

        final getPhotosRemote = await getPhotos();
        localDatasource.photosToCache(getPhotosRemote);

        return Right(getPhotosRemote);
      } else {
        List<PhotosModel> localData = await localDatasource.getPhotosFromCache();

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
