import 'package:equatable/equatable.dart';

class ArticlePostEntity extends Equatable {
  final String title;
  final String body;
  
  ArticlePostEntity({
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'body': body,
    };
  }

  @override
  List<Object> get props => [title, body];
}
