import 'package:hive/hive.dart';
import 'package:solid_principle_app/domain/domain.dart';
import 'package:solid_principle_app/hive_helper/fields/photos_model_fields.dart';
import 'package:solid_principle_app/hive_helper/hive_adapters.dart';
import 'package:solid_principle_app/hive_helper/hive_types.dart';

part 'photos_model.g.dart';

@HiveType(typeId: HiveTypes.photosModel, adapterName: HiveAdapters.photosModel)
class PhotosModel extends PhotosEntity {
  @HiveField(PhotosModelFields.albumId)
  final int albumId;
  @HiveField(PhotosModelFields.id)
  final int id;
  @HiveField(PhotosModelFields.title)
  final String title;
  @HiveField(PhotosModelFields.url)
  final String url;
  @HiveField(PhotosModelFields.thumbnailUrl)
  final String thumbnailUrl;

  PhotosModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  }) : super(
          albumId: albumId,
          id: id,
          title: title,
          url: url,
          thumbnailUrl: thumbnailUrl,
        );

  factory PhotosModel.fromJson(Map<String, dynamic> json) {
    return PhotosModel(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}
