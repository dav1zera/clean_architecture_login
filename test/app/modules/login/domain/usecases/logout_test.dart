import 'package:clean_login/app/modules/login/domain/repositories/login_repository.dart';
import 'package:clean_login/app/modules/login/domain/usecases/logout.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

main() {
  final repository = LoginRepositoryMock();
  final useCase = LogoutImpl(repository);

  test(
    ''' Dado que o usuário está logado
        Quando ele tentar fazer logout
        Então quero que ocorra o logout  ''',
    () async {
      when(
        () => repository.logout(),
      ).thenAnswer(
        (_) async => Right(unit),
      );

      final result = await useCase();
      expect(
        result,
        Right(unit),
      );
    },
  );
}
