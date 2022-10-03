part of 'photos_detail_cubit.dart';

class PhotosDetailState extends Equatable {
  final bool isInit;
  final PhotosEntity photosEntity;

  PhotosDetailState({
    this.isInit = true,
    this.photosEntity = PhotosEntity.empty,
  });

  @override
  List<Object> get props => [isInit, photosEntity];
}
