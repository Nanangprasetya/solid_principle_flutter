import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/core.dart';
import '../../../../domain/domain.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final ArticleGetData articleGetData;

  ArticleCubit(this.articleGetData) : super(ArticleInitial());

  void getAllData() async {
    if (state.hasMax) return;

    if (state is ArticleInitial) emit(ArticleLoading());

    if (state is ArticleLoading) return refreshArticles();

    Either<Failure, List<ArticleEntity>> data = await articleGetData.call(ArticleParamsEntity(
      start: (state as ArticleLoaded).data.length,
    ));

    data.fold(
      (failure) => emit(ArticleNotLoaded(message: failure.message!)),
      (value) => emit(ArticleLoaded(
        data: [...(state as ArticleLoaded).data, ...value],
        hasMax: value.isEmpty,
      )),
    );
  }

  Future<void> refreshArticles() async {
    Either<Failure, List<ArticleEntity>> data = await articleGetData.call(ArticleParamsEntity());

    data.fold(
      (failure) => emit(ArticleNotLoaded(message: failure.message!)),
      (value) => emit(ArticleLoaded(data: value, hasMax: false)),
    );
  }
}