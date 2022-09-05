import 'package:injectable/injectable.dart';
import 'package:solid_domain/solid_domain.dart';
import 'package:dartz/dartz.dart';

@lazySingleton
class ArticleGetData extends UseCase<List<ArticleEntity>, ArticleParamsEntity> {
  final ArticleRepository articleRepository;

  ArticleGetData({required this.articleRepository});

  @override
  Future<Either<Failure, List<ArticleEntity>>> call(ArticleParamsEntity params) async {
    Either<Failure, List<ArticleEntity>> data = await articleRepository.getArticleData(params);

    return data.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}
