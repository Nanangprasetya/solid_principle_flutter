import 'package:solid_domain/solid_domain.dart';

class ServerFailure extends Failure {
  final String? message;

  const ServerFailure({this.message}) : super(message: message);

  @override
  List<Object?> get props => [message];
}
