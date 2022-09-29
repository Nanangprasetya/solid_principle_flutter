import 'package:dartz/dartz.dart';
import '../../../core/core.dart';
import '../../domain.dart';

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
