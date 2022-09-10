// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../solid_domain.dart' as _i4;
import '../domain/repositories/user/user_repository.dart' as _i10;
import '../domain/usecases/article/article_delete.dart' as _i3;
import '../domain/usecases/article/article_get_data.dart' as _i5;
import '../domain/usecases/article/article_post.dart' as _i6;
import '../domain/usecases/article/article_put.dart' as _i7;
import '../domain/usecases/photos/photos_get_data.dart' as _i8;
import '../domain/usecases/user/user_get_data.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.ArticleDelete>(
      () => _i3.ArticleDelete(get<_i4.ArticleRepository>()));
  gh.lazySingleton<_i5.ArticleGetData>(() =>
      _i5.ArticleGetData(articleRepository: get<_i4.ArticleRepository>()));
  gh.lazySingleton<_i6.ArticlePost>(
      () => _i6.ArticlePost(get<_i4.ArticleRepository>()));
  gh.lazySingleton<_i7.ArticlePut>(
      () => _i7.ArticlePut(get<_i4.ArticleRepository>()));
  gh.lazySingleton<_i8.PhotosGetData>(
      () => _i8.PhotosGetData(photoRepository: get<_i4.PhotoRepository>()));
  gh.lazySingleton<_i9.UserGetData>(
      () => _i9.UserGetData(userRepository: get<_i10.UserRepository>()));
  return get;
}
