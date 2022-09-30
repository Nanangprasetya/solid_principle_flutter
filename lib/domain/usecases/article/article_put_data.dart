import 'package:dartz/dartz.dart';
import '../../../core/core.dart';
import '../../domain.dart';

class ArticlePutData extends UseCase<ArticleEntity, ArticlePutEntity> {
  final ArticleRepository articleRepository;

  ArticlePutData(this.articleRepository);
  @override
  Future<Either<Failure, ArticleEntity>> call(ArticlePutEntity params) async {
    Either<Failure, ArticleEntity> data = await articleRepository.putArticle(params);

    return data.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}
