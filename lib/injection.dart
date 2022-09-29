import 'package:get_it/get_it.dart';
import 'app/bloc/blocs.dart';
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

  ///////////////
  //! Bloc / Cubit
  ///////////////
  // Article
  sl.registerFactory(() => ArticleCubit(sl()));
  // Photos
  sl.registerFactory(() => PhotosCubit(sl()));
  // User
  sl.registerFactory(() => UserCubit(sl()));

  ///////////////
  //! Usecase
  ///////////////
  // Article
  sl.registerLazySingleton(() => ArticleGetData(sl()));
  sl.registerLazySingleton(() => ArticlePost(sl()));
  sl.registerLazySingleton(() => ArticlePut(sl()));
  sl.registerLazySingleton(() => ArticleDelete(sl()));
  // Photos
  sl.registerLazySingleton(() => PhotosGetData(sl()));
  // User
  sl.registerLazySingleton(() => UserGetData(sl()));

  ///////////////
  //! Repository
  ///////////////  
  // Article
  sl.registerLazySingleton<ArticleRepository>(() => ArticleRepositoryImpl(sl()));
  // Photo
  sl.registerLazySingleton<PhotoRepository>(() => PhotoRepositoryImpl(sl()));
  // User
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));
  
  ///////////////
  //! DataSource
  ///////////////
  // Article
  sl.registerLazySingleton<ArticleRemoteDatasource>(() => ArticleRemoteDatasourceImpl(sl()));
  // Photo
  sl.registerLazySingleton<PhotoRemoteDatasource>(() => PhotoRemoteDatasourceImpl(sl()));
  // User
  sl.registerLazySingleton<UserRemoteDatasource>(() => UserRemoteDatasourceImpl(sl()));

}
