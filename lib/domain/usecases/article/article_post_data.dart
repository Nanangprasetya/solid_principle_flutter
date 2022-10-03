import 'package:dartz/dartz.dart';
import '../../../core/core.dart';
import '../../domain.dart';

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