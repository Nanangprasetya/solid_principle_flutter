import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:solid_domain/solid_domain.dart';

@lazySingleton
class ArticlePut extends UseCase<ArticleEntity, ArticlePutEntity> {
  final ArticleRepository articleRepository;

  ArticlePut(this.articleRepository);
  @override
  Future<Either<Failure, ArticleEntity>> call(ArticlePutEntity params) async {
    Either<Failure, ArticleEntity> data = await articleRepository.putArticle(params);

    return data.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}
