import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:solid_domain/solid_domain.dart';

part 'photos_detail_state.dart';

class PhotosDetailCubit extends Cubit<PhotosDetailState> {
  PhotosDetailCubit() : super(PhotosDetailState());

  void set(PhotosEntity params, bool isInit) => emit(PhotosDetailState(isInit: isInit, photosEntity: params));
}
