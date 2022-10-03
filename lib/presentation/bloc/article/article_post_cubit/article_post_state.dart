part of 'article_post_cubit.dart';

class ArticlePostState extends Equatable with FormzMixin {
  final FormzStatus status;
  final TitleValidator title;
  final BodyValidator body;
  final String message;

  const ArticlePostState({
    this.status = FormzStatus.pure,
    this.title = const TitleValidator.pure(),
    this.body = const BodyValidator.pure(),
    this.message = '',
  });

  ArticlePostState copyWith({
    FormzStatus? status,
    TitleValidator? title,
    BodyValidator? body,
    String? message,
  }) {
    return ArticlePostState(
      status: status ?? this.status,
      title: title ?? this.title,
      body: body ?? this.body,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, title, body, message];
  
  @override
  List<FormzInput> get inputs =>[title, body];
}
