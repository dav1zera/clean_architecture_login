import 'package:clean_login/app/commons/domain/entities/user_entity.dart';
import 'package:clean_login/app/commons/infra/models/user_model.dart';
import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/login/infra/datasource/login_datasource.dart';
import 'package:clean_login/app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LoginDataSourceMock extends Mock implements LoginDataSource {}

main() {
  final dataSource = LoginDataSourceMock();
  final sut = LoginRepositoryImpl(dataSource);

  final credentials = Credentials(
    email: "testando@mail.com",
    password: "372130D4v1;",
  );
  final userModel = UserModel(
    uid: "123456",
    name: "davi zera",
    email: "zera@mail.com",
  );

  //Execute Login Email(Primeiro teste)
  group(
    ''' Dado as credenciais digitadas 
        Quando ele tentar fazer login 
        Então será logado com sucesso ou caso as credenciais estejam inválidas retornará um erro ''',
    () {
      test(
        ''' Dado as credenciais digitadas pelo usuário
            Quando ele tentar fazer login
            Então será logado com sucesso ''',
        () async {
          when(
            () => dataSource.executeLoginEmail(credentials: credentials),
          ).thenAnswer(
            (_) async => userModel,
          );
          var result = await sut.executeLoginEmail(credentials: credentials);
          expect(
            result,
            isA<Right<dynamic, UserEntity>>(),
          );
        },
      );

      test(
        ''' Dado que o usuário esteja tentando fazer login
            Quando as credenciais forem digitadas
            Então quero que ocorra uma exceção ''',
        () async {
          when(() => dataSource.executeLoginEmail(credentials: credentials))
              .thenThrow(Exception());
          sut.executeLoginEmail(credentials: credentials);
        },
      );
    },
  );

  //Logout (Segundo teste)
  group(
    ''' Dado que o usuário esteja logado
        Quando ele tentar fazer logout 
        Então ele será deslogado com sucesso ou vai ocorrer um erro''',
    () {
      test(
        ''' Dado que o usuário esteja logado
            Quando ele fazer logout
            Então ele será deslogado com sucesso ''',
        () async {
          when(
            () => dataSource.logout(),
          ).thenAnswer(
            (_) async => Right(unit),
          );

          var result = await sut.logout();
          expect(result, isA<Right<dynamic, Unit>>());
          expect(result.fold(id, (result) => result), isA<Unit>());
        },
      );

      test(
        ''' Dado que o usuário esteja logado
            Quando ele tentar fazer logout
            Então quero que retorne uma execeção ''',
        () async {
          when(() => dataSource.logout()).thenThrow(
            Exception(),
          );
          sut.logout();
        },
      );
    },
  );

  group(
    ''' Dado que o usuário esteja conectado
        Quando ele estiver conectado
        Então será retornado uma User Entity ou uma exceção ''',
    () {
      test(
        ''' Dado que o usuário esteja conectado 
            Quando ele estiver conectado
            Então será retornado uma User Entity ''',
        () async {
          when(() => dataSource.currentUser()).thenAnswer(
            (_) async => userModel,
          );
          var result = await sut.currentUser();
          expect(
            result,
            isA<Right<dynamic, UserEntity>>(),
          );
        },
      );

      test(
        ''' Dado que o usuário esteja conectado
            Quando ele não estiver conectado
            Então será retornado uma exceção ''',
        () async {
          when(
            () => dataSource.currentUser(),
          ).thenThrow(
            Exception(),
          );
          sut.currentUser();
        },
      );
    },
  );
}
