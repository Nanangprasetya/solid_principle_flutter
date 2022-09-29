import 'package:dartz/dartz.dart';
import '../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../data.dart';

class PhotoRepositoryImpl extends PhotoRepository {
  final PhotoRemoteDatasource photoRemoteDatasource;

  PhotoRepositoryImpl(this.photoRemoteDatasource);

  @override
  Future<Either<Failure, List<PhotosEntity>>> getPhotosData(PhotosParamsEntity params) async {
    try {
      List<PhotosEntity> data = await photoRemoteDatasource.getPhotosData(params);

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
