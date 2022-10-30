import 'package:dartz/dartz.dart';
import 'package:solid_data/solid_data.dart';
import 'package:solid_domain/solid_domain.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final ArticleRemoteDatasource remoteDatasource;
  final ArticleLocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  ArticleRepositoryImpl({
    required this.localDatasource,
    required this.networkInfo,
    required this.remoteDatasource,
  });

  @override
  Future<Either<Failure, List<ArticleEntity>>> getArticleData(ArticleParamsEntity params) async {
    return _checkArticleCache(
      () {
        try {
          return remoteDatasource.getArticleData(params);
        } catch (e) {
          if (e is ServerException) {
            return Left(ServerFailure(message: e.message));
          } else {
            return Left(UnknownFailure(message: FAILURE_UNKNOWN));
          }
        }
      },
      isInit: params.isInit,
    );
  }

  @override
  Future<Either<Failure, bool>> postArticle(ArticlePostEntity params) async {
    try {
      bool data = await remoteDatasource.postAticle(params);

      return Right(data);
    } catch (e) {
      if (e is ServerException) {
        return Left(ServerFailure(message: e.message));
      } else {
        return Left(UnknownFailure(message: FAILURE_UNKNOWN));
      }
    }
  }

  @override
  Future<Either<Failure, bool>> putArticle(ArticlePutEntity params) async {
    try {
      bool data = await remoteDatasource.putArticle(params);

      return Right(data);
    } catch (e) {
      if (e is ServerException) {
        return Left(ServerFailure(message: e.message));
      } else {
        return Left(UnknownFailure(message: FAILURE_UNKNOWN));
      }
    }
  }

  @override
  Future<Either<Failure, bool>> deleteArticle(ArticleDeleteEntity params) async {
    try {
      bool data = await remoteDatasource.deleteArticle(params);

      return Right(data);
    } catch (e) {
      if (e is ServerException) {
        return Left(ServerFailure(message: e.message));
      } else {
        return Left(UnknownFailure(message: FAILURE_UNKNOWN));
      }
    }
  }

  Future<Either<Failure, List<ArticleModel>>> _checkArticleCache(Function() getArticle, {required bool isInit}) async {
    try {
      if (await networkInfo.isConnected) {
        if (isInit) {
          localDatasource.articleDeleteCache();
        }

        final getArticleRemote = await getArticle();
        localDatasource.articleToCache(getArticleRemote);

        return Right(getArticleRemote);
      } else {
        List<ArticleModel> localData = await localDatasource.getArticleFromCache();

        return Right(localData);
      }
    } catch (e) {
      if (e is CacheException) {
        return Left(CacheFailure(message: e.message));
      } else {
        return Left(UnknownFailure(message: FAILURE_UNKNOWN));
      }
    }
  }
}
