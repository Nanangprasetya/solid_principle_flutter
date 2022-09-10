// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:solid_domain/solid_domain.dart' as _i4;

import '../bloc/article/article_cubit/article_cubit.dart' as _i3;
import '../bloc/photos/photos_cubit/photos_cubit.dart' as _i5;
import '../bloc/user/user_cubit/user_cubit.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ArticleCubit>(
      () => _i3.ArticleCubit(get<_i4.ArticleGetData>()));
  gh.factory<_i5.PhotosCubit>(() => _i5.PhotosCubit(get<_i4.PhotosGetData>()));
  gh.factory<_i6.UserCubit>(() => _i6.UserCubit(get<_i4.UserGetData>()));
  return get;
}
