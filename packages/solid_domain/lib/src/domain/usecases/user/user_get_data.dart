import 'package:injectable/injectable.dart';
import 'package:solid_domain/src/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:solid_domain/src/core/usecase/usecase.dart';
import 'package:solid_domain/src/domain/entities/user/user_entity.dart';
import 'package:solid_domain/src/domain/entities/user/user_params_entity.dart';
import 'package:solid_domain/src/domain/repositories/user/user_repository.dart';

@lazySingleton
class UserGetData extends UseCase<List<UserEntity>, UserParamsEntity> {
  final UserRepository userRepository;

  UserGetData({required this.userRepository});

  @override
  Future<Either<Failure, List<UserEntity>>> call(UserParamsEntity params) async {
    Either<Failure, List<UserEntity>> data = await userRepository.getUserData(params);

    return data.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }
}
