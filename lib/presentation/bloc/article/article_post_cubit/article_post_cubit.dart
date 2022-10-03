import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../../../models/models.dart';

part 'article_post_state.dart';

class ArticlePostCubit extends Cubit<ArticlePostState> {
  final ArticlePostData articlePostData;

  ArticlePostCubit(this.articlePostData) : super(ArticlePostState());

  void onTitleChanged(String value) {
    final title = TitleValidator.dirty(value);

    emit(state.copyWith(
      title: title,
      status: Formz.validate([state.body, title]),
    ));
  }

  void onBodyChanged(String value) {
    final body = BodyValidator.dirty(value);

    emit(state.copyWith(
      body: body,
      status: Formz.validate([body, state.title]),
    ));
  }

  Future<void> onSubmitted() async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      Either<Failure, bool> data = await articlePostData.call(ArticlePostEntity(
        title: state.title.value,
        body: state.body.value,
      ));

      data.fold(
        (failure) => emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          message: failure.message,
        )),
        (value) => emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          message: SUCCESS_POST,
        )),
      );
    }
  }
}
