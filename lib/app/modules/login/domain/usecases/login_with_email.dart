import 'package:clean_login/app/core/connectivity/domain/connectivity_service.dart';
import 'package:clean_login/app/core/errors/errors.dart';
import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/login/domain/entities/user.dart';
import 'package:clean_login/app/modules/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'login_with_email.g.dart';

abstract class LoginWithEmailUseCase {
  Future<Either<Failure, UserInfoData>> call(Credentials credentials);
}

@Injectable()
class LoginWithEmailUseCaseImpl implements LoginWithEmailUseCase {
  final LoginRepository loginRepository;
  final ConnectivityService connectivityService;

  LoginWithEmailUseCaseImpl(this.loginRepository, this.connectivityService);
  @override
  Future<Either<Failure, UserInfoData>> call(Credentials credentials) async {
    final result = await connectivityService.isOnline();
    if (result.isLeft()) {
      return result.map(
        (r) => UserInfoData(uid: "7777", name: "Davi", email: "teste@mail.com"),
      );
    }
    return await loginRepository.executeLoginEmail(credentials: credentials);
  }
}
