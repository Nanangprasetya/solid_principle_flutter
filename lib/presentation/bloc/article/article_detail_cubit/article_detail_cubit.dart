import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';
import '../../../../domain/domain.dart';

part 'article_detail_state.dart';

class ArticleDetailCubit extends Cubit<ArticleDetailState> {
  ArticleDetailCubit() : super(ArticleDetailState());

  void set(ArticleEntity params, bool isInit) => emit(state.copyWith(isInit: isInit, articleEntity: params));
  void setToForm() => emit(state.copyWith(typePage: TypePage.form));
  void setToDetail() => emit(state.copyWith(typePage: TypePage.detail));
}
