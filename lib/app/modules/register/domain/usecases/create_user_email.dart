import 'package:clean_login/app/commons/domain/entities/user_entity.dart';
import 'package:clean_login/app/core/connectivity/domain/connectivity_service.dart';
import 'package:clean_login/app/core/errors/errors.dart';
import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/register/domain/errors/errors.dart';
import 'package:clean_login/app/modules/register/domain/errors/messages.dart';
import 'package:clean_login/app/modules/register/domain/repositories/register_repository.dart';
import 'package:dartz/dartz.dart';

abstract class CreateUserEmailUseCase {
  Future<Either<Failure, String>> call(Credentials credentials);
}

class CreateUserEmailUseCaseImpl implements CreateUserEmailUseCase {
  final RegisterRepository registerRepository;
  final ConnectivityService connectivityService;

  CreateUserEmailUseCaseImpl(this.registerRepository, this.connectivityService);
  @override
  Future<Either<Failure, String>> call(Credentials credentials) async {
    final result = await connectivityService.isOnline();
    if (result.isLeft()) {
      return Left(
          ErrorGetRegisterUser(message: FailureMessages.Offline_Connection));
    }

    if (!credentials.isEmailValid ||
        !credentials.isPasswordValid ||
        !credentials.isNameValid) {
      return Left(
        ErrorRegister(
          message: FailureMessages.Invalid_User_Credentials,
        ),
      );
    }

    return await registerRepository.createUserEmail(credentials: credentials);
  }
}
