import 'package:clean_login/app/commons/domain/entities/user_entity.dart';
import 'package:clean_login/app/modules/login/domain/repositories/login_repository.dart';
import 'package:clean_login/app/modules/login/domain/usecases/get_logged_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

main() {
  final repository = LoginRepositoryMock();
  final useCase = GetLoggedUserUseCaseImpl(repository);

  test(
    ''' Dado a credenciais logadas pelo usuário
        Quando ele estiver concectado
        Então será retornando suas credenciais ''',
    () async {
      final user =
          UserEntity(uid: "123456", email: "zeca@hotmail.com", name: "Davi");
      when(() => repository.currentUser()).thenAnswer(
        (_) async => Right(user),
      );
      final result = await useCase();
      expect(
        result,
        Right(user),
      );
      expect(
        result.fold(id, (user) => user.name),
        "Davi",
      );
      expect(
        result.fold(id, (user) => user.email),
        "zeca@hotmail.com",
      );
      expect(
        result.fold(id, (user) => user.uid),
        "123456",
      );
    },
  );
}
