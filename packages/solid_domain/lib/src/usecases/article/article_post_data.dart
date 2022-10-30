import 'package:dartz/dartz.dart';
import 'package:solid_data/solid_data.dart';
import 'package:solid_domain/solid_domain.dart';

class ArticlePostData extends UseCase<bool, ArticlePostEntity> {
  final ArticleRepository articleRepository;

  ArticlePostData(this.articleRepository);

  @override
  Future<Either<Failure, bool>> call(ArticlePostEntity params) async {
    Either<Failure, bool> data = await articleRepository.postArticle(params);

    return data.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}