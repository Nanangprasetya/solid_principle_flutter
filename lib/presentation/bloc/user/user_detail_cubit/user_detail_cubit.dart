import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/domain.dart';

part 'user_detail_state.dart';

class UserDetailCubit extends Cubit<UserDetailState> {
  UserDetailCubit() : super(UserDetailState());

  void set(UserEntity params, bool isInit) => emit(UserDetailState(isInit: isInit, userEntity: params));
}
