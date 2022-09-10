import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:solid_domain/solid_domain.dart';

part 'user_state.dart';

@injectable
class UserCubit extends Cubit<UserState> {
  final UserGetData userGetData;

  UserCubit(this.userGetData) : super(UserInitial());

  void getAllData() async {
    if (state.hasMax) return;

    if (state is UserInitial) emit(UserLoading());

    if (state is UserLoading) return refreshUsers();

    Either<Failure, List<UserEntity>> data = await userGetData.call(UserParamsEntity());

    data.fold(
      (failure) => emit(UserNotLoaded(message: failure.message!)),
      (value) => emit(UserLoaded(data: [...(state as UserLoaded).data, ...value], hasMax: value.isEmpty)),
    );
  }

  Future<void> refreshUsers() async {
    Either<Failure, List<UserEntity>> data = await userGetData.call(UserParamsEntity());

    data.fold(
      (failure) => emit(UserNotLoaded(message: failure.message!)),
      (value) => emit(UserLoaded(data: value, hasMax: false)),
    );
  }
}