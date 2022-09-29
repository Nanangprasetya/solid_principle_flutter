import 'package:dartz/dartz.dart';
import '../../../core/core.dart';
import '../../domain.dart';

class PhotosGetData extends UseCase<List<PhotosEntity>, PhotosParamsEntity> {
  final PhotoRepository photoRepository;

  PhotosGetData(this.photoRepository);

  @override
  Future<Either<Failure, List<PhotosEntity>>> call(PhotosParamsEntity params) async {
    Either<Failure, List<PhotosEntity>> data = await photoRepository.getPhotosData(params);

    return data.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}
