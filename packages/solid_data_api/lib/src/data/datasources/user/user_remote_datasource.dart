import 'package:injectable/injectable.dart';
import 'package:solid_data_api/solid_data_api.dart';
import 'package:solid_data_api/src/service/service.dart';
import 'package:solid_domain/solid_domain.dart';


abstract class UserRemoteDatasource {
  Future<List<UserEntity>> getUserData(UserParamsEntity params);
}

@lazySingleton
class UserRemoteDatasourceImpl extends UserRemoteDatasource {
  final BaseApi baseApi;

  UserRemoteDatasourceImpl({required this.baseApi});

  @override
  Future<List<UserEntity>> getUserData(UserParamsEntity params) async {
    final data = await baseApi.get('users/', queryParameters: {'_start': params.start, '_limit': params.limit});
    return (data as Iterable).map<UserModel>((value) => UserModel.fromJson(value)).toList();
  }
}
