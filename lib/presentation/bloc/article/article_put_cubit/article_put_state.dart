part of 'article_put_cubit.dart';

class ArticlePutState extends Equatable with FormzMixin {
  final FormzStatus status;
  final TitleValidator title;
  final BodyValidator body;
  final String message;

  const ArticlePutState({
    this.status = FormzStatus.pure,
    this.title = const TitleValidator.pure(),
    this.body = const BodyValidator.pure(),
    this.message = '',
  });

  ArticlePutState copyWith({
    FormzStatus? status,
    TitleValidator? title,
    BodyValidator? body,
    String? message,
  }) {
    return ArticlePutState(
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
