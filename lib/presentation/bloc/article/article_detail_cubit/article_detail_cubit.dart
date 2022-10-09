import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solid_domain/solid_domain.dart';
import 'package:solid_principle_app/core/core.dart';

part 'article_detail_state.dart';

class ArticleDetailCubit extends Cubit<ArticleDetailState> {
  ArticleDetailCubit() : super(ArticleDetailState());

  void set(ArticleEntity params, bool isInit) => emit(state.copyWith(isInit: isInit, articleEntity: params));

  void setToForm(ArticleEntity params) => emit(
        state.copyWith(
          typePage: TypePage.form,
          typeForm: TypeForm.edit,
          articleEntity: params,
        ),
      );
      
  void setToDetail() => emit(state.copyWith(typePage: TypePage.detail, typeForm: TypeForm.add));
}
