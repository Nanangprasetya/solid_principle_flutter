import '../../../domain/domain.dart';
import '../../../service/service.dart';
import '../../data.dart';

abstract class UserRemoteDatasource {
  Future<List<UserEntity>> getUserData(UserParamsEntity params);
}

class UserRemoteDatasourceImpl extends UserRemoteDatasource {
  final BaseApi baseApi;

  UserRemoteDatasourceImpl(this.baseApi);

  @override
  Future<List<UserEntity>> getUserData(UserParamsEntity params) async {
    final data = await baseApi.get('users/', queryParameters: {'_start': params.start, '_limit': params.limit});
    return (data as Iterable).map<UserModel>((value) => UserModel.fromJson(value)).toList();
  }
}
