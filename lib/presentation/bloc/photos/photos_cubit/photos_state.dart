part of 'photos_cubit.dart';


abstract class PhotosState extends Equatable {
  final String? message;
  final bool hasMax;

  PhotosState(this.message, this.hasMax);

  @override
  List<Object?> get props => [message];
}

class PhotosInitial extends PhotosState {
  PhotosInitial() : super(null, false);
}

class PhotosLoading extends PhotosState {
  PhotosLoading() : super(null, false);
}

class PhotosLoaded extends PhotosState {
  final List<PhotosEntity> data;
  final bool hasMax;
  final String? message;

  PhotosLoaded({
    required this.data,
    required this.hasMax,
    this.message,
  }) : super(message, hasMax);

  @override
  List<Object?> get props => [data, hasMax, message];
}

class PhotosNotLoaded extends PhotosState {
  final String message;

  PhotosNotLoaded({
    required this.message,
  }) : super(message, false);

  @override
  List<Object?> get props => [message];
}
