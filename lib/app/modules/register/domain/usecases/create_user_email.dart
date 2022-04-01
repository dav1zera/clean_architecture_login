import 'package:clean_login/app/commons/domain/entities/user_entity.dart';
import 'package:clean_login/app/core/connectivity/domain/connectivity_service.dart';
import 'package:clean_login/app/core/errors/errors.dart';
import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/login/domain/errors/messages.dart';
import 'package:clean_login/app/modules/register/domain/errors/errors.dart';
import 'package:clean_login/app/modules/register/domain/repositories/register_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'create_user_email.g.dart';

abstract class CreateUserEmailUseCase {
  Future<Either<Failure, UserEntity>> call(Credentials credentials);
}

@Injectable(singleton: false)
class CreateUserEmailUseCaseImpl implements CreateUserEmailUseCase {
  final RegisterRepository registerRepository;
  final ConnectivityService connectivityService;

  CreateUserEmailUseCaseImpl(this.registerRepository, this.connectivityService);
  @override
  Future<Either<Failure, UserEntity>> call(Credentials credentials) async {
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
          message: FailureMessages.Invalid_Data_User,
        ),
      );
    }

    return await registerRepository.createUserEmail(credentials: credentials);
  }
}
