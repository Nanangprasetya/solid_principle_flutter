import 'package:equatable/equatable.dart';

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

class ProcessFailure extends Failure {
  final String? message;

  const ProcessFailure({this.message}) : super(message: message);

  @override
  List<Object?> get props => [message];
}

class UnknownFailure extends Failure {
  final String? message;

  const UnknownFailure({this.message}) : super(message: message);

  @override
  List<Object?> get props => [message];
}
