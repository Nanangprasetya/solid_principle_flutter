import 'package:hive/hive.dart';

import '../../../core/core.dart';
import '../../data.dart';

abstract class PhotoLocalDatasource {
  Future<List<PhotosModel>> getPhotosFromCache();
  Future<void> photosToCache(List<PhotosModel> params);
  Future<void> photosDeleteCache();
}

class PhotoLocalDatasourceImpl implements PhotoLocalDatasource {
  Future<Box> _getBox() async {
    return await Hive.openBox(BOX_KEY_PHOTOS).onError((e, s) => throw CacheException());
  }

  @override
  Future<List<PhotosModel>> getPhotosFromCache() async {
    Box box = await _getBox();
    try {
      if (box.containsKey(BOX_KEY_PHOTOS)) {
        List<dynamic> data = await box.get(BOX_KEY_PHOTOS);
        return data.map((e) => e as PhotosModel).toList();
      } else {
        throw CacheException(message: EXCEPTION_UNKNOWN);
      }
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> photosToCache(List<PhotosModel> params) async {
    Box box = await _getBox();

    List<PhotosModel> local = await box.get(BOX_KEY_PHOTOS) ?? [];

    local.addAll(params);

    box.put(BOX_KEY_PHOTOS, local).onError((e, s) => throw CacheException());
  }

  @override
  Future<void> photosDeleteCache() async {
    Box box = await _getBox();
    print('Photos cache has been deleted');

    box.delete(BOX_KEY_PHOTOS).onError((e, s) => throw CacheException());
  }
}
