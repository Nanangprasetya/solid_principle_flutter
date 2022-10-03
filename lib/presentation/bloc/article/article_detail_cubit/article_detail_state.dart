part of 'article_detail_cubit.dart';

class ArticleDetailState extends Equatable {
  final bool isInit;
  final ArticleEntity articleEntity;
  final TypePage typePage;

  ArticleDetailState({
    this.isInit = true,
    this.articleEntity = ArticleEntity.empty,
    this.typePage = TypePage.detail,
  });

  @override
  List<Object> get props => [isInit, articleEntity];

  ArticleDetailState copyWith({
    bool? isInit,
    ArticleEntity? articleEntity,
    TypePage? typePage,
  }) {
    return ArticleDetailState(
      isInit: isInit ?? this.isInit,
      articleEntity: articleEntity ?? this.articleEntity,
      typePage: typePage ?? this.typePage,
    );
  }
}
