part of 'article_cubit.dart';

abstract class ArticleState extends Equatable {
  final String? message;
  final bool hasMax;

  ArticleState(this.message, this.hasMax);

  @override
  List<Object?> get props => [message];
}

class ArticleInitial extends ArticleState {
  ArticleInitial() : super(null, false);
}

class ArticleLoading extends ArticleState {
  ArticleLoading() : super(null, false);
}

class ArticleLoaded extends ArticleState {
  final List<ArticleEntity> data;
  final bool hasMax;
  final String? message;

  ArticleLoaded({
    required this.data,
    required this.hasMax,
    this.message,
  }) : super(message, hasMax);

  @override
  List<Object?> get props => [data, hasMax, message];
}

class ArticleNotLoaded extends ArticleState {
  final String message;

  ArticleNotLoaded({
    required this.message,
  }) : super(message, false);

  @override
  List<Object?> get props => [message];
}
