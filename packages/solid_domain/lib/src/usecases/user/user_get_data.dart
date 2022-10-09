import 'package:dartz/dartz.dart';
import 'package:solid_data/solid_data.dart';
import 'package:solid_domain/solid_domain.dart';

class UserGetData extends UseCase<List<UserEntity>, UserParamsEntity> {
  final UserRepository userRepository;

  UserGetData(this.userRepository);

  @override
  Future<Either<Failure, List<UserEntity>>> call(UserParamsEntity params) async {
    Either<Failure, List<UserEntity>> data = await userRepository.getUserData(params);

    return data.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}
