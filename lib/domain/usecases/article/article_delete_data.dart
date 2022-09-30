import 'package:dartz/dartz.dart';
import '../../../core/core.dart';
import '../../domain.dart';

class ArticleDeleteData extends UseCase<bool, ArticleDeleteEntity> {
  final ArticleRepository articleRepository;

  ArticleDeleteData(this.articleRepository);

  @override
  Future<Either<Failure, bool>> call(ArticleDeleteEntity params) async {
    Either<Failure, bool> data = await articleRepository.deleteArticle(params);

    return data.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}