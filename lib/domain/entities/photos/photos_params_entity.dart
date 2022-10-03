import 'package:equatable/equatable.dart';

class PhotosParamsEntity extends Equatable {
  final int limit;
  final int start;
  final bool isInit;

  const PhotosParamsEntity({
    this.limit = 20,
    this.start = 1,
    this.isInit = true,
  });

  @override
  List<Object> get props => [limit, start, isInit];
}
