import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final int id;
  final int userId;
  final String title;
  final String body;

  const ArticleEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  static const empty = ArticleEntity(id: 0, userId: 0, title: '', body: '');

  bool get isEmpty => this == ArticleEntity.empty;

  bool get isNotEmpty => this != ArticleEntity.empty;

  @override
  List<Object> get props => [id, userId, title, body];
}
