import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import 'package:solid_data/solid_data.dart';
import 'package:solid_domain/solid_domain.dart';
import '../../../models/models.dart';

part 'article_put_state.dart';

class ArticlePutCubit extends Cubit<ArticlePutState> {
  final ArticlePutData articlePutData;

  ArticlePutCubit(this.articlePutData) : super(ArticlePutState());

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

  void onPut(int id) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      Either<Failure, bool> data = await articlePutData.call(ArticlePutEntity(
        id: id,
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
          message: SUCCESS_PUT,
        )),
      );
    }
  }
}
