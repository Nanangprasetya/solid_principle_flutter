part of 'user_detail_cubit.dart';

class UserDetailState extends Equatable {
  final bool isInit;
  final UserEntity userEntity;

  const UserDetailState({
    this.isInit = true,
    this.userEntity = UserEntity.empty,
  });

  @override
  List<Object> get props => [isInit, userEntity];
}