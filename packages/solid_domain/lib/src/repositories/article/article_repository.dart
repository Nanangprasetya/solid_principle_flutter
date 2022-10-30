import 'package:dartz/dartz.dart';
import 'package:solid_data/solid_data.dart';

import '../../entities/entities.dart';

abstract class ArticleRepository {
  Future<Either<Failure, List<ArticleEntity>>> getArticleData(ArticleParamsEntity params);
  Future<Either<Failure, bool>> postArticle(ArticlePostEntity params);
  Future<Either<Failure, bool>> putArticle(ArticlePutEntity params);
  Future<Either<Failure, bool>> deleteArticle(ArticleDeleteEntity params);
}