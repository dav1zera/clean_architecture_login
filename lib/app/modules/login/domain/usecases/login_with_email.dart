import 'package:clean_login/app/core/connectivity/domain/connectivity_service.dart';
import 'package:clean_login/app/core/errors/errors.dart';
import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/login/domain/entities/user.dart';
import 'package:clean_login/app/modules/login/domain/errors/errors.dart';
import 'package:clean_login/app/modules/login/domain/errors/messages.dart';
import 'package:clean_login/app/modules/login/domain/repositories/login_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'login_with_email.g.dart';

abstract class LoginWithEmail {
  Future<Either<Failure, UserInfoData>> call(Credentials credentials);
}

@Injectable()
class LoginWithEmailImpl implements LoginWithEmail {
  final LoginRepository loginRepository;
  final ConnectivityService connectivityService;

  LoginWithEmailImpl(this.loginRepository, this.connectivityService);
  @override
  Future<Either<Failure, UserInfoData>> call(Credentials credentials) async {
    final isOnline = await connectivityService.isOnline();

    if (!(isOnline)) {
      return Left(ErrorLoginEmail(message: FailureMessages.Offline_Connection));
    }
    if (!credentials.isEmailValid) {
      return Left(ErrorLoginEmail(message: FailureMessages.Invalid_Email));
    }
    if (!credentials.isPasswordValid) {
      return Left(ErrorLoginEmail(message: FailureMessages.Invalid_Password));
    }
    return await loginRepository.executeLoginEmail();
  }
}
