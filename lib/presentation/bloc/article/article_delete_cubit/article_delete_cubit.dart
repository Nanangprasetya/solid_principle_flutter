import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:solid_data/solid_data.dart';
import 'package:solid_domain/solid_domain.dart';

part 'article_delete_state.dart';

class ArticleDeleteCubit extends Cubit<ArticleDeleteState> {
  final ArticleDeleteData articleDeleteData;

  ArticleDeleteCubit(this.articleDeleteData) : super(ArticleDeleteInitial());

  void delete(ArticleDeleteEntity params) async {
    emit(ArticleDeleteLoading());
    Either<Failure, bool> data = await articleDeleteData.call(params);

    data.fold(
      (failure) => emit(ArticleDeleteNotLoaded(message: failure.message!)),
      (value) => emit(ArticleDeleteLoaded(message: SUCCESS_DELETE)),
    );
  }
}
