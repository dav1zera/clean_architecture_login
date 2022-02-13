import 'package:clean_login/app/core/connectivity/domain/services/connectivity_service.dart';
import 'package:clean_login/app/modules/login/domain/entities/user_entity.dart';
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
  final connectivityservice = ConnectivityServiceMock();

  final usecase = LoginWithEmailUseCaseImpl(repository, connectivityservice);

  test(
    "test Failure call usecase",
    () async {
      when(() => connectivityservice.isOnline()).thenAnswer((_) async => false);
      final result = await usecase();

      expect(
          result.leftMap((failure) => failure is ErrorLoginEmail), left(true));

      expect(result.fold((failure) => failure.message, id),
          FailureMessages.Offline_Connection);
    },
  );

  test(
    "test Success call usecase",
    () async {
      final user =
          UserEntity(uid: "123456", email: "zeca@hotmail.com", name: "Davi");

      when(() => connectivityservice.isOnline()).thenAnswer((_) async => true);
      when(() => repository.executeLoginEmail())
          .thenAnswer((_) async => Right(user));

      final result = await usecase();
      expect(result, Right(user));
      expect(result.fold(id, (user) => user.name), "Davi");
    },
  );
}
