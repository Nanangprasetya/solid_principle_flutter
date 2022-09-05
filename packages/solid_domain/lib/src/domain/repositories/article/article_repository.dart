import 'package:dartz/dartz.dart';
import 'package:solid_domain/src/core/core.dart';

import '../../domain.dart';

abstract class ArticleRepository {
  Future<Either<Failure, List<ArticleEntity>>> getArticleData(ArticleParamsEntity params);
  Future<Either<Failure, ArticleEntity>> postArticle(ArticlePostEntity params);
  Future<Either<Failure, ArticleEntity>> putArticle(ArticlePutEntity params);
  Future<Either<Failure, bool>> deleteArticle(ArticleDeleteEntity params);
}