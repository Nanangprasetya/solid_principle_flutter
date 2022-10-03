import 'package:dartz/dartz.dart';
import '../../../core/core.dart';
import '../../domain.dart';

class ArticleGetData extends UseCase<List<ArticleEntity>, ArticleParamsEntity> {
  final ArticleRepository articleRepository;

  ArticleGetData( this.articleRepository);

  @override
  Future<Either<Failure, List<ArticleEntity>>> call(ArticleParamsEntity params) async {
    Either<Failure, List<ArticleEntity>> data = await articleRepository.getArticleData(params);

    return data.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}
