import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:solid_principle_app/service/service.dart';
import '../../../../core/core.dart';
import '../../../../domain/domain.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final ArticleGetData articleGetData;
  final NetworkInfo networkInfo;

  ArticleCubit({required this.articleGetData, required this.networkInfo}) : super(ArticleInitial());

  Future<void> getAllData() async {
    bool isConnected = await networkInfo.isConnected;

    if (state.hasMax) return;

    if (state is ArticleInitial) emit(ArticleLoading());

    if (state is ArticleLoading || state is ArticleNotLoaded) return refreshArticles();

    Either<Failure, List<ArticleEntity>> data = await articleGetData.call(ArticleParamsEntity(
      start: (state as ArticleLoaded).data.length,
      isInit: false,
    ));


    data.fold(
      (failure) => emit(ArticleNotLoaded(message: failure.message!)),
      (value) => emit(ArticleLoaded(
        data: isConnected ? [...(state as ArticleLoaded).data, ...value] : value,
        hasMax: value.isEmpty || !isConnected,
      )),
    );
  }

  Future<void> refreshArticles() async {
    bool isConnected = await networkInfo.isConnected;

    Either<Failure, List<ArticleEntity>> data = await articleGetData.call(ArticleParamsEntity());

    data.fold(
      (failure) => emit(ArticleNotLoaded(message: failure.message!)),
      (value) => emit(ArticleLoaded(
        data: value,
        hasMax: value.length < ArticleParamsEntity().limit || !isConnected,
      )),
    );
  }
}
