import 'package:equatable/equatable.dart';
import 'package:solid_data/solid_data.dart';

abstract class Failure extends Equatable {
  final String? message;

  const Failure({this.message});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  final String? message;

  const ServerFailure({this.message}) : super(message: message);

  @override
  List<Object?> get props => [message];
}

class NotFoundFailure extends Failure {
  final String? message;

  const NotFoundFailure({this.message = FAILURE_NOT_FOUND}) : super(message: message);

  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  final String? message;

  const CacheFailure({this.message}) : super(message: message);

  @override
  List<Object?> get props => [message];
}

class UnknownFailure extends Failure {
  final String? message;

  const UnknownFailure({this.message}) : super(message: message);

  @override
  List<Object?> get props => [message];
}
