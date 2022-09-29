import '../../../domain/domain.dart';
import '../../../service/service.dart';
import '../../models/models.dart';

abstract class PhotoRemoteDatasource {
  Future<List<PhotosEntity>> getPhotosData(PhotosParamsEntity params);
}

class PhotoRemoteDatasourceImpl extends PhotoRemoteDatasource {
  final BaseApi baseApi;

  PhotoRemoteDatasourceImpl(this.baseApi);

  @override
  Future<List<PhotosEntity>> getPhotosData(PhotosParamsEntity params) async {
    final data = await baseApi.get('photos/', queryParameters: {'_start': params.start, '_limit': params.limit});
    return (data as Iterable).map<PhotosModel>((value) => PhotosModel.fromJson(value)).toList();
  }
}
