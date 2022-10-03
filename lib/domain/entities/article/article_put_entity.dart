import 'package:equatable/equatable.dart';

class ArticlePutEntity extends Equatable {
  final int id;
  final int userId;
  final String title;
  final String body;
  
  ArticlePutEntity({
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
