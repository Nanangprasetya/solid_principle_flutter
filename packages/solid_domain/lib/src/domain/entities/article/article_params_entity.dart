import 'package:equatable/equatable.dart';

class ArticleParamsEntity extends Equatable {
  final int start;
  final int limit;

  const ArticleParamsEntity({
    this.start = 0,
    this.limit = 20,
  });

  @override
  List<Object> get props => [start, limit];
}
