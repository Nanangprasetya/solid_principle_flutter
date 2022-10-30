import 'package:dartz/dartz.dart';
import 'package:solid_data/solid_data.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}