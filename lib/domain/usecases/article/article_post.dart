import 'package:dartz/dartz.dart';
import '../../../core/core.dart';
import '../../domain.dart';

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