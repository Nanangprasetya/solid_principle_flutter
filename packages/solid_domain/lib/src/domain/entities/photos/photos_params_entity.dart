import 'package:equatable/equatable.dart';

class PhotosParamsEntity extends Equatable {
  final int limit;
  final int start;

  const PhotosParamsEntity({
    this.limit = 20,
    this.start = 1,
  });

  @override
  List<Object> get props => [limit, start];
}
