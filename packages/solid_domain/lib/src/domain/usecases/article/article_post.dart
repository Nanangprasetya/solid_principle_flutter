import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:solid_domain/solid_domain.dart';

@lazySingleton
class ArticlePost extends UseCase<ArticleEntity, ArticlePostEntity> {
  final ArticleRepository articleRepository;

  ArticlePost(this.articleRepository);

  @override
  Future<Either<Failure, ArticleEntity>> call(ArticlePostEntity params) async {
    Either<Failure, ArticleEntity> data = await articleRepository.postArticle(params);

    return data.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}