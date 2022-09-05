part of 'user_cubit.dart';

@immutable
abstract class UserState extends Equatable {
  final String? message;
  final bool hasMax;

  UserState(this.message, this.hasMax);

  @override
  List<Object?> get props => [message];
}

class UserInitial extends UserState {
  UserInitial() : super(null, false);
}

class UserLoading extends UserState {
  UserLoading() : super(null, false);
}

class UserLoaded extends UserState {
  final List<UserEntity> data;
  final bool hasMax;
  final String? message;

  UserLoaded({
    required this.data,
    required this.hasMax,
    this.message,
  }) : super(message, hasMax);

  @override
  List<Object?> get props => [data, hasMax, message];
}

class UserNotLoaded extends UserState {
  final String message;

  UserNotLoaded({
    required this.message,
  }) : super(message, false);

  @override
  List<Object?> get props => [message];
}
