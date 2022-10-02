import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/domain.dart';
part 'photos_detail_state.dart';

class PhotosDetailCubit extends Cubit<PhotosDetailState> {
  PhotosDetailCubit() : super(PhotosDetailState());

  void setDetail(PhotosEntity params, bool isInit) => emit(PhotosDetailState(isInit: isInit, photosEntity: params));
}
