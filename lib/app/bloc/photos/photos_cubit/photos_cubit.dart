import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';
import '../../../../domain/domain.dart';

part 'photos_state.dart';

class PhotosCubit extends Cubit<PhotosState> {
  final PhotosGetData photosGetData;

  PhotosCubit(this.photosGetData) : super(PhotosInitial());

  void getAllData() async {
    if (state.hasMax) return;

    if (state is PhotosInitial) emit(PhotosLoading());

    if (state is PhotosLoading) return refreshPhotoss();

    Either<Failure, List<PhotosEntity>> data = await photosGetData.call(PhotosParamsEntity(
      start: (state as PhotosLoaded).data.length,
    ));

    data.fold(
      (failure) => emit(PhotosNotLoaded(message: failure.message!)),
      (value) => emit(PhotosLoaded(
        data: [...(state as PhotosLoaded).data, ...value],
        hasMax: value.isEmpty,
      )),
    );
  }

  Future<void> refreshPhotoss() async {
    Either<Failure, List<PhotosEntity>> data = await photosGetData.call(PhotosParamsEntity());

    data.fold(
      (failure) => emit(PhotosNotLoaded(message: failure.message!)),
      (value) => emit(PhotosLoaded(data: value, hasMax: false)),
    );
  }
}
