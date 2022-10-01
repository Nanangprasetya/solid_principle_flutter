import 'package:hive/hive.dart';
import 'package:solid_principle_app/data/models/article/article_model.dart';
import 'package:solid_principle_app/data/models/photos/photos_model.dart';
import 'package:solid_principle_app/data/models/user/user_model.dart';
import 'package:solid_principle_app/data/models/user/user_address_model.dart';

void registerAdapters() {
	Hive.registerAdapter(ArticleModelAdapter());
	Hive.registerAdapter(PhotosModelAdapter());
	Hive.registerAdapter(UserModelAdapter());
	Hive.registerAdapter(UserAddressModelAdapter());
}
