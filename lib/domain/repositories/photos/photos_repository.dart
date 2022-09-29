import 'package:dartz/dartz.dart';
import '../../../../core/failures/failure.dart';
import '../../entities/photos/photos_entity.dart';
import '../../entities/photos/photos_params_entity.dart';

abstract class PhotoRepository {
  Future<Either<Failure, List<PhotosEntity>>> getPhotosData(PhotosParamsEntity params);
}