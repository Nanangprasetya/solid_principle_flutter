import 'package:hive/hive.dart';
import 'package:solid_data/solid_data.dart';

void registerAdapters() {
	Hive.registerAdapter(ArticleModelAdapter());
	Hive.registerAdapter(PhotosModelAdapter());
	Hive.registerAdapter(UserModelAdapter());
	Hive.registerAdapter(UserAddressModelAdapter());
}
