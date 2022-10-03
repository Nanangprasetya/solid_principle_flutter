part of 'article_delete_cubit.dart';

abstract class ArticleDeleteState extends Equatable {
  final String? message;

  ArticleDeleteState(this.message);

  @override
  List<Object?> get props => [message];
}

class ArticleDeleteInitial extends ArticleDeleteState {
  ArticleDeleteInitial() : super(null);
}

class ArticleDeleteLoading extends ArticleDeleteState {
  ArticleDeleteLoading() : super(null);
}

class ArticleDeleteLoaded extends ArticleDeleteState {
  final String? message;

  ArticleDeleteLoaded({this.message}) : super(message);

  @override
  List<Object?> get props => [message];
}

class ArticleDeleteNotLoaded extends ArticleDeleteState {
  final String message;

  ArticleDeleteNotLoaded({
    required this.message,
  }) : super(message);

  @override
  List<Object?> get props => [message];
}
