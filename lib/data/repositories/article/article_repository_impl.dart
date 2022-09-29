import 'package:dartz/dartz.dart';
import '../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../data.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final ArticleRemoteDatasource articleRemoteDatasource;

  ArticleRepositoryImpl(this.articleRemoteDatasource);

  @override
  Future<Either<Failure, List<ArticleEntity>>> getArticleData(ArticleParamsEntity params) async {
    try {
      List<ArticleEntity> data = await articleRemoteDatasource.getArticleData(params);

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
  Future<Either<Failure, ArticleEntity>> postArticle(ArticlePostEntity params) async {
    try {
      ArticleEntity data = await articleRemoteDatasource.postAticle(params);

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
  Future<Either<Failure, ArticleEntity>> putArticle(ArticlePutEntity params) async {
    try {
      ArticleEntity data = await articleRemoteDatasource.putArticle(params);

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
      bool data = await articleRemoteDatasource.deleteArticle(params);

      return Right(data);
    } catch (e) {
      if (e is ServerException) {
        return Left(ServerFailure(message: e.message));
      } else {
        return Left(UnknownFailure(message: FAILURE_UNKNOWN));
      }
    }
  }
}
