import 'package:dartz/dartz.dart';
import '../../../core/core.dart';
import '../../domain.dart';

class ArticlePutData extends UseCase<bool, ArticlePutEntity> {
  final ArticleRepository articleRepository;

  ArticlePutData(this.articleRepository);
  @override
  Future<Either<Failure, bool>> call(ArticlePutEntity params) async {
    Either<Failure, bool> data = await articleRepository.putArticle(params);

    return data.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}
