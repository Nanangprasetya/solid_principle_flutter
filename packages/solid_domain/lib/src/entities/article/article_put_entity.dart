import 'package:equatable/equatable.dart';

class ArticlePutEntity extends Equatable {
  final int id;
  final String title;
  final String body;
  
  ArticlePutEntity({
    required this.id,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
    };
  }

  @override
  List<Object> get props => [id, title, body];
}
