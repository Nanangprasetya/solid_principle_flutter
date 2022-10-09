import 'package:solid_domain/solid_domain.dart';
import 'package:solid_data/solid_data.dart';

abstract class UserRemoteDatasource {
  Future<List<UserEntity>> getUserData(UserParamsEntity params);
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final BaseApi baseApi;

  UserRemoteDatasourceImpl(this.baseApi);

  @override
  Future<List<UserEntity>> getUserData(UserParamsEntity params) async {
    final data = await baseApi.get(USERS, queryParameters: {'_start': params.start, '_limit': params.limit});
    return (data as Iterable).map<UserModel>((value) => UserModel.fromJson(value)).toList();
  }
}
