import 'package:clean_login/app/commons/domain/entities/user_entity.dart';
import 'package:clean_login/app/core/connectivity/domain/connectivity_service.dart';
import 'package:clean_login/app/core/connectivity/domain/errors/errors.dart';
import 'package:clean_login/app/core/errors/errors.dart';
import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/login/domain/errors/errors.dart';
import 'package:clean_login/app/modules/login/domain/errors/messages.dart';
import 'package:clean_login/app/modules/login/domain/repositories/login_repository.dart';
import 'package:clean_login/app/modules/login/domain/usecases/login_with_email.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

class ConnectivityServiceMock extends Mock implements ConnectivityService {}

main() {
  final repository = LoginRepositoryMock();
  final connectivityService = ConnectivityServiceMock();

  final useCase = LoginWithEmailUseCaseImpl(repository, connectivityService);
  final credentials = Credentials(email: "teste@mail.com", password: "123456");

  setUpAll(
    () {
      when(() => connectivityService.isOnline())
          .thenAnswer((_) async => Right(unit));
    },
  );

  //Teste de conexão (Primeiro teste)
  test(
    "test Failure when user is offline",
    () async {
      when(() => connectivityService.isOnline()).thenAnswer(
        (_) async => Left(
          ErrorConnection(message: FailureMessages.Offline_Connection),
        ),
      );
      final result = await useCase(credentials);

      expect(
          result.leftMap((failure) => failure is ErrorLoginEmail), left(true));

      expect(result.fold((failure) => failure.message, id),
          FailureMessages.Offline_Connection);
    },
  );

  //Teste de validar as Credenciais(Segundo teste)

  test("Validate user credentials", () async {});

//   test("test sucess call usecase", () async {
//     final user =
//         UserEntity(uid: "123456", name: "Davi", email: "zeca@hotmail.com");
//     when(() => connectivityService.isOnline())
//         .thenAnswer((_) async => Right(unit));
//     when(() => repository.executeLoginEmail())
//         .thenAnswer((_) async => Right(user));
//   });
// }
}
