import 'package:equatable/equatable.dart';

class UserParamsEntity extends Equatable {
  final int limit;
  final int start;

  const UserParamsEntity({
    this.limit = 20,
    this.start = 1,
  });

  @override
  List<Object> get props => [limit, start];
}
