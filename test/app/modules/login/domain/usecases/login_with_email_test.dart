import 'package:clean_login/app/core/connectivity/domain/connectivity_service.dart';
import 'package:clean_login/app/core/connectivity/domain/errors/errors.dart';
import 'package:clean_login/app/commons/domain/entities/user_entity.dart';
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

//Começando os testes unitários

/*
Given/Arrange: definir um estado conhecido;
When/Act: rodar a aplicação;
Then/Assert: certificar-se de que o novo estado é o estado esperado.
*/

main() {
  final repository = LoginRepositoryMock();
  final connectivityService = ConnectivityServiceMock();

  final useCase = LoginWithEmailUseCaseImpl(repository, connectivityService);
  final credentials =
      Credentials(email: "teste@mail.com", password: "372130D4v1;");
  final invalidCredentials =
      Credentials(email: "teste@mail.com", password: "372130");

  setUpAll(
    () {
      when(() => connectivityService.isOnline()).thenAnswer(
        (_) async => Right(unit),
      );
    },
  );

  //Teste de validar as credenciais(Segundo teste)

  test(
    ''' Dado as credenciais digitadas pelo usuário
        Quando tentar fazer login
        Então será logado com sucesso ''',
    () async {
      final user =
          UserEntity(uid: "123456", email: "zeca@hotmail.com", name: "Davi");

      when(
        () => repository.executeLoginEmail(credentials: credentials),
      ).thenAnswer(
        (_) async => Right(user),
      );

      final result = await useCase(credentials);
      expect(
        result,
        Right(user),
      );
      expect(result.fold(id, (user) => user.name), "Davi");
      expect(result.fold(id, (user) => user.email), "zeca@hotmail.com");
      expect(result.fold(id, (user) => user.uid), "123456");
    },
  );

  //Teste de credenciais inválidas
  test(
    ''' Dado as credenciais digitadas pelo usuário
        Quando tentar fazer login
        Então eu quero que retorne um erro de credenciais inválidas ''',
    () async {
      final result = await useCase(invalidCredentials);

      expect(
          result.leftMap((failure) => failure is ErrorLoginEmail), left(true));

      expect(result.fold((failure) => failure.message, id),
          FailureMessages.Invalid_User_Credentials);
    },
  );

  //Teste de conexão (Primeiro teste)
  test(
    ''' Dado que o usuário está offline 
        Quando ele tentar fazer login
        Então eu quero que ele retorne um erro de conexão ''',
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
}
