import 'package:injectable/injectable.dart';
import 'package:solid_data_api/solid_data_api.dart';
import 'package:solid_data_api/src/service/base_api.dart';
import 'package:solid_domain/solid_domain.dart';

abstract class PhotosRemoteDatasource {
  Future<List<PhotosEntity>> getPhotosData(PhotosParamsEntity params);
}

@lazySingleton
class PhotosRemoteDatasourceImpl extends PhotosRemoteDatasource {
  final BaseApi baseApi;

  PhotosRemoteDatasourceImpl({required this.baseApi});

  @override
  Future<List<PhotosEntity>> getPhotosData(PhotosParamsEntity params) async {
    final data = await baseApi.get('photos/', queryParameters: {'_start': params.start, '_limit': params.limit});
    return (data as Iterable).map<PhotosModel>((value) => PhotosModel.fromJson(value)).toList();
  }
}
