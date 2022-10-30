import 'package:solid_domain/solid_domain.dart';
import 'package:solid_data/solid_data.dart';

abstract class PhotoRemoteDatasource {
  Future<List<PhotosEntity>> getPhotosData(PhotosParamsEntity params);
}

class PhotoRemoteDatasourceImpl implements PhotoRemoteDatasource {
  final BaseApi baseApi;

  PhotoRemoteDatasourceImpl(this.baseApi);

  @override
  Future<List<PhotosEntity>> getPhotosData(PhotosParamsEntity params) async {
    final data = await baseApi.get(PHOTOS, queryParameters: {'_start': params.start, '_limit': params.limit});
    return (data as Iterable).map<PhotosModel>((value) => PhotosModel.fromJson(value)).toList();
  }
}
