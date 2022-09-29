import '../../../domain/domain.dart';
import '../../../service/base_api.dart';
import '../../data.dart';

abstract class ArticleRemoteDatasource {
  Future<List<ArticleEntity>> getArticleData(ArticleParamsEntity params);
  Future<ArticleEntity> postAticle(ArticlePostEntity params);
  Future<ArticleEntity> putArticle(ArticlePutEntity params);
  Future<bool> deleteArticle(ArticleDeleteEntity params);
}

class ArticleRemoteDatasourceImpl extends ArticleRemoteDatasource {
  final BaseApi baseApi;

  ArticleRemoteDatasourceImpl(this.baseApi);

  @override
  Future<List<ArticleEntity>> getArticleData(ArticleParamsEntity params) async {
    final data = await baseApi.get('posts/', queryParameters: {'_start': params.start, '_limit': params.limit});
    return (data as Iterable).map<ArticleModel>((value) => ArticleModel.fromJson(value)).toList();
  }

  @override
  Future<ArticleEntity> postAticle(ArticlePostEntity params) async {
    final data = await baseApi.post('post/', data: params.toJson());
    return ArticleModel.fromJson(data);
  }

  @override
  Future<ArticleEntity> putArticle(ArticlePutEntity params) async {
    final data = await baseApi.post('post/${params.id}', data: params.toJson());
    return ArticleModel.fromJson(data);
  }

  @override
  Future<bool> deleteArticle(ArticleDeleteEntity params) async {
    await baseApi.delete('post/${params.id}');
    return true;
  }
}
