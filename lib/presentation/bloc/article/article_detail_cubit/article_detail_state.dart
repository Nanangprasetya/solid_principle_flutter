part of 'article_detail_cubit.dart';

class ArticleDetailState extends Equatable {
  final bool isInit;
  final ArticleEntity articleEntity;
  final TypePage typePage;
  final TypeForm typeForm;

  ArticleDetailState({
    this.isInit = true,
    this.articleEntity = ArticleEntity.empty,
    this.typePage = TypePage.detail,
    this.typeForm = TypeForm.add,
  });
  
  ArticleDetailState copyWith({
    bool? isInit,
    ArticleEntity? articleEntity,
    TypePage? typePage,
    TypeForm? typeForm,
  }) {
    return ArticleDetailState(
      isInit: isInit ?? this.isInit,
      articleEntity: articleEntity ?? this.articleEntity,
      typePage: typePage ?? this.typePage,
      typeForm: typeForm ?? this.typeForm,
    );
  }

  @override
  List<Object> get props => [isInit, typePage, typeForm, articleEntity];
}
