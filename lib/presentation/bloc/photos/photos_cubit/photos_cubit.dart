import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:solid_data/solid_data.dart';
import 'package:solid_domain/solid_domain.dart';

part 'photos_state.dart';

class PhotosCubit extends Cubit<PhotosState> {
  final PhotosGetData photosGetData;
  final NetworkInfo networkInfo;

  PhotosCubit({required this.networkInfo, required this.photosGetData}) : super(PhotosInitial());

  void getAllData() async {
    bool isConnected = await networkInfo.isConnected;

    if (state.hasMax) return;

    if (state is PhotosInitial) emit(PhotosLoading());

    if (state is PhotosLoading || state is PhotosNotLoaded) return refreshPhotoss();

    Either<Failure, List<PhotosEntity>> data = await photosGetData.call(PhotosParamsEntity(
      start: (state as PhotosLoaded).data.length,
      isInit: false,
    ));

    data.fold(
      (failure) => emit(PhotosNotLoaded(message: failure.message!)),
      (value) => emit(PhotosLoaded(
        data: isConnected ? [...(state as PhotosLoaded).data, ...value] : value,
        hasMax: value.isEmpty || !isConnected,
      )),
    );
  }

  Future<void> refreshPhotoss() async {
    bool isConnected = await networkInfo.isConnected;

    Either<Failure, List<PhotosEntity>> data = await photosGetData.call(PhotosParamsEntity());

    data.fold(
      (failure) => emit(PhotosNotLoaded(message: failure.message!)),
      (value) => emit(PhotosLoaded(
        data: value,
        hasMax: value.length < PhotosParamsEntity().limit || !isConnected,
      )),
    );
  }
}
