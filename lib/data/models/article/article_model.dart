import 'package:hive/hive.dart';
import 'package:solid_principle_app/domain/domain.dart';

import '../../../helper/helper.dart';

part 'article_model.g.dart';

@HiveType(typeId: HiveTypes.articleModel, adapterName: HiveAdapters.articleModel)
class ArticleModel extends ArticleEntity {
  @HiveField(ArticleModelFields.id)
  final int id;
  @HiveField(ArticleModelFields.userId)
  final int userId;
  @HiveField(ArticleModelFields.title)
  final String title;
  @HiveField(ArticleModelFields.body)
  final String body;

  ArticleModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  }) : super(
          id: id,
          userId: userId,
          title: title,
          body: body,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}
