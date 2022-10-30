import 'package:hive/hive.dart';
import 'package:solid_data/solid_data.dart';

abstract class ArticleLocalDatasource {
  Future<List<ArticleModel>> getArticleFromCache();
  Future<void> articleToCache(List<ArticleModel> params);
  Future<void> articleDeleteCache();
}

class ArticleLocalDatasourceImpl implements ArticleLocalDatasource {
  Future<Box> _getBox() async {
    return await Hive.openBox(BOX_ARTICLE).onError((e, s) => throw CacheException(message: FAILURE_UNKNOWN));
  }

  @override
  Future<void> articleToCache(List<ArticleModel> params) async {
    Box box = await _getBox();

    List<ArticleModel> local = await box.get(BOX_KEY_ARTICLE) ?? [];

    local.addAll(params);

    box.put(BOX_KEY_ARTICLE, local).onError((e, s) => throw CacheException(message: FAILURE_UNKNOWN));
  }

  @override
  Future<List<ArticleModel>> getArticleFromCache() async {
    Box box = await _getBox();
    try {
      if (box.containsKey(BOX_KEY_ARTICLE)) {
        List<dynamic> data = await box.get(BOX_KEY_ARTICLE);
        return data.map((e) => e as ArticleModel).toList();
      } else {
        throw CacheException(message: EXCEPTION_UNKNOWN);
      }
    } catch (e) {
      throw CacheException(message: FAILURE_UNKNOWN);
    }
  }

  @override
  Future<void> articleDeleteCache() async {
    Box box = await _getBox();
    print('Article cache has been deleted');

    box.delete(BOX_KEY_ARTICLE).onError((e, s) => throw CacheException(message: FAILURE_UNKNOWN));
  }
}
