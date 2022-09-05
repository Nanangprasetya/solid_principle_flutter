// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/datasources/article/article_remote_datasource.dart' as _i3;
import '../data/datasources/datasources.dart' as _i6;
import '../data/datasources/user/user_remote_datasource.dart' as _i7;
import '../data/repositories/article/article_repository_impl.dart' as _i5;
import '../data/repositories/user/user_repository_impl.dart' as _i8;
import '../service/service.dart' as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.ArticleRemoteDatasourceImpl>(
      () => _i3.ArticleRemoteDatasourceImpl(baseApi: get<_i4.BaseApi>()));
  gh.lazySingleton<_i5.ArticleRepositoryImpl>(
      () => _i5.ArticleRepositoryImpl(get<_i6.ArticleRemoteDatasource>()));
  gh.lazySingleton<_i7.UserRemoteDatasourceImpl>(
      () => _i7.UserRemoteDatasourceImpl(baseApi: get<_i4.BaseApi>()));
  gh.lazySingleton<_i8.UserRepositoryImpl>(() => _i8.UserRepositoryImpl(
      userRemoteDatasource: get<_i6.UserRemoteDatasource>()));
  return get;
}
