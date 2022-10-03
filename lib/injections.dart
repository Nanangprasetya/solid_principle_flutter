import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'presentation/bloc/blocs.dart';
import 'core/config/flavor.dart';
import 'data/data.dart';
import 'domain/domain.dart';
import 'service/service.dart';

final sl = GetIt.instance;

Future<void> initLocator(FlavorConfig flavor) async {
  sl.allowReassignment = true;

  ///////////////
  //! External
  ///////////////
  ///
  // Base Api
  sl.registerSingleton(BaseApi(flavor));

  // Flavor
  sl.registerSingleton<FlavorConfig>(flavor);

  // Connectivity
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(Connectivity()));

  ///////////////
  //! Bloc / Cubit
  ///////////////
  // Main Tab
  sl.registerFactory(() => MainCubit());
  // Article
  sl.registerFactory(
    () => ArticleCubit(
      articleGetData: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerFactory(() => ArticleDetailCubit());
  sl.registerFactory(() => ArticlePostCubit(sl()));
  sl.registerFactory(() => ArticleDeleteCubit(sl()));
  // Photos
  sl.registerFactory(
    () => PhotosCubit(
      photosGetData: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerFactory(() => PhotosDetailCubit());
  // User
  sl.registerFactory(
    () => UserCubit(
      userGetData: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerFactory(() => UserDetailCubit());

  ///////////////
  //! Usecase
  ///////////////
  // Article
  sl.registerLazySingleton(() => ArticleGetData(sl()));
  sl.registerLazySingleton(() => ArticlePostData(sl()));
  sl.registerLazySingleton(() => ArticlePutData(sl()));
  sl.registerLazySingleton(() => ArticleDeleteData(sl()));
  // Photos
  sl.registerLazySingleton(() => PhotosGetData(sl()));
  // User
  sl.registerLazySingleton(() => UserGetData(sl()));

  ///////////////
  //! Repository
  ///////////////
  // Article
  sl.registerLazySingleton<ArticleRepository>(
    () => ArticleRepositoryImpl(
      remoteDatasource: sl(),
      localDatasource: sl(),
      networkInfo: sl(),
    ),
  );
  // Photo
  sl.registerLazySingleton<PhotoRepository>(
    () => PhotoRepositoryImpl(
      remoteDatasource: sl(),
      localDatasource: sl(),
      networkInfo: sl(),
    ),
  );
  // User
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDatasource: sl(),
      localDatasource: sl(),
      networkInfo: sl(),
    ),
  );

  ///////////////
  //! DataSource
  ///////////////
  // Article
  sl.registerLazySingleton<ArticleRemoteDatasource>(() => ArticleRemoteDatasourceImpl(sl()));
  sl.registerLazySingleton<ArticleLocalDatasource>(() => ArticleLocalDatasourceImpl());
  // Photo
  sl.registerLazySingleton<PhotoRemoteDatasource>(() => PhotoRemoteDatasourceImpl(sl()));
  sl.registerLazySingleton<PhotoLocalDatasource>(() => PhotoLocalDatasourceImpl());
  // User
  sl.registerLazySingleton<UserRemoteDatasource>(() => UserRemoteDatasourceImpl(sl()));
  sl.registerLazySingleton<UserLocalDatasource>(() => UserLocalDatasourceImpl());
}
