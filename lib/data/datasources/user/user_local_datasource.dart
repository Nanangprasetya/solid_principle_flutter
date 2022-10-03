import 'package:hive/hive.dart';

import '../../../core/core.dart';
import '../../data.dart';

abstract class UserLocalDatasource {
  Future<List<UserModel>> getUsersFromCache();
  Future<void> usersToCache(List<UserModel> params);
  Future<void> usersDeleteCache();
}

class UserLocalDatasourceImpl implements UserLocalDatasource {
  Future<Box> _getBox() async {
    return await Hive.openBox(BOX_KEY_USERS).onError((e, s) => throw CacheException());
  }

  @override
  Future<List<UserModel>> getUsersFromCache() async {
    Box box = await _getBox();
    try {
      if (box.containsKey(BOX_KEY_USERS)) {
        List<dynamic> data = await box.get(BOX_KEY_USERS);
        return data.map((e) => e as UserModel).toList();
      } else {
        throw CacheException(message: EXCEPTION_UNKNOWN);
      }
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> usersToCache(List<UserModel> params) async {
    Box box = await _getBox();

    List<UserModel> local = await box.get(BOX_KEY_USERS) ?? [];

    local.addAll(params);

    box.put(BOX_KEY_USERS, local).onError((e, s) => throw CacheException());
  }

  @override
  Future<void> usersDeleteCache() async {
    Box box = await _getBox();
    print('Users cache has been deleted');

    box.delete(BOX_KEY_USERS).onError((e, s) => throw CacheException());
  }
}
