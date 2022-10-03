import 'package:dartz/dartz.dart';
import '../../../../core/failures/failure.dart';
import '../../domain.dart';

abstract class ArticleRepository {
  Future<Either<Failure, List<ArticleEntity>>> getArticleData(ArticleParamsEntity params);
  Future<Either<Failure, bool>> postArticle(ArticlePostEntity params);
  Future<Either<Failure, bool>> putArticle(ArticlePutEntity params);
  Future<Either<Failure, bool>> deleteArticle(ArticleDeleteEntity params);
}