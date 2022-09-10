import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:solid_domain/solid_domain.dart';

@lazySingleton
class PhotosGetData extends UseCase<List<PhotosEntity>, PhotosParamsEntity> {
  final PhotoRepository photoRepository;

  PhotosGetData({required this.photoRepository});

  @override
  Future<Either<Failure, List<PhotosEntity>>> call(PhotosParamsEntity params) async {
    Either<Failure, List<PhotosEntity>> data = await photoRepository.getPhotosData(params);

    return data.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}
