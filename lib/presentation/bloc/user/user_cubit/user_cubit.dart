import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:solid_data/solid_data.dart';
import 'package:solid_domain/solid_domain.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserGetData userGetData;
  final NetworkInfo networkInfo;

  UserCubit({required this.userGetData, required this.networkInfo}) : super(UserInitial());

  void getAllData() async {
    bool isConnected = await networkInfo.isConnected;

    if (state.hasMax) return;

    if (state is UserInitial) emit(UserLoading());

    if (state is UserLoading || state is UserNotLoaded) return refreshUsers();

    Either<Failure, List<UserEntity>> data = await userGetData.call(UserParamsEntity(
      start: (state as UserLoaded).data.length,
      isInit: false,
    ));

    data.fold(
      (failure) => emit(UserNotLoaded(message: failure.message!)),
      (value) => emit(UserLoaded(
        data: isConnected ? [...(state as UserLoaded).data, ...value] : value,
        hasMax: value.isEmpty || !isConnected,
      )),
    );
  }

  Future<void> refreshUsers() async {
    bool isConnected = await networkInfo.isConnected;

    Either<Failure, List<UserEntity>> data = await userGetData.call(UserParamsEntity());

    data.fold(
      (failure) => emit(UserNotLoaded(message: failure.message!)),
      (value) => emit(UserLoaded(
        data: value,
        hasMax: value.length < UserParamsEntity().limit || !isConnected,
      )),
    );
  }
}
