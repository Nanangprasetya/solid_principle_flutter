import '../../../domain/domain.dart';

class ArticleModel extends ArticleEntity {
  final int id;
  final int userId;
  final String title;
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
