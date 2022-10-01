import 'package:equatable/equatable.dart';

class ArticleParamsEntity extends Equatable {
  final int start;
  final int limit;
  final bool isInit;

  const ArticleParamsEntity({
    this.start = 0,
    this.limit = 10,
    this.isInit = true,
  });

  @override
  List<Object> get props => [start, limit, isInit];
}
