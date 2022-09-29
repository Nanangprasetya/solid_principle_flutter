import 'package:equatable/equatable.dart';

class ArticleDeleteEntity extends Equatable {
  final int id;
  final int userId;
  final String title;
  final String body;
  
  ArticleDeleteEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
    };
  }

  @override
  List<Object> get props => [id, userId, title, body];
}
