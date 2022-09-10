import 'package:dartz/dartz.dart';
import 'package:solid_domain/solid_domain.dart';

abstract class PhotoRepository {
  Future<Either<Failure, List<PhotosEntity>>> getPhotosData(PhotosParamsEntity params);
}