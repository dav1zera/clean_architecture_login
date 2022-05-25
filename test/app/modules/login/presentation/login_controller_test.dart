import 'package:clean_login/app/commons/domain/entities/user_entity.dart';
import 'package:clean_login/app/commons/presentation/stores/auth_store.dart';
import 'package:clean_login/app/core/connectivity/domain/errors/errors.dart';
import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/login/domain/errors/messages.dart';
import 'package:clean_login/app/modules/login/domain/usecases/login_with_email.dart';
import 'package:clean_login/app/modules/login/presentation/login_controller.dart';
import 'package:clean_login/app/modules/login/presentation/login_store.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ModularNavigateMock extends Mock implements IModularNavigator {}

class LoginWithEmailUseCaseMock extends Mock implements LoginWithEmailUseCase {}

class CredentialsFake extends Fake implements Credentials {}

main() {
  late LoginStore loginStore;
  late AuthStore authStore;
  late LoginController sut;
  late LoginWithEmailUseCase loginWithEmailUseCase;
  late UserEntity userEntity;
  late IModularNavigator navigator;

  mockPushNamedAndRemoveUntil() {
    when(
      () => navigator.pushNamedAndRemoveUntil(
        any(),
        any(),
        arguments: any(named: "arguments"),
      ),
    ).thenAnswer((_) async => null);
  }

  setUpAll(
    () {
      authStore = AuthStore();
      loginStore = LoginStore();
      loginWithEmailUseCase = LoginWithEmailUseCaseMock();
      sut = LoginController(loginWithEmailUseCase, authStore, loginStore);

      navigator = ModularNavigateMock();
      Modular.navigatorDelegate = navigator;

      mockPushNamedAndRemoveUntil();
      userEntity = UserEntity(
          uid: "123456", name: "davi alves", email: "teste@mail.com");

      registerFallbackValue(CredentialsFake());
    },
  );

  test(
    "Testando Fluxo de controller",
    () async {
      when(
        () => loginWithEmailUseCase(
          any(),
        ),
      ).thenAnswer(
        (_) async => Right(userEntity),
      );

      loginStore.emailLogin = TextEditingController(text: "teste@mail.com");
      loginStore.passwordLogin = TextEditingController(text: "372130D4v1;");
      await sut.enterLoginEmail();

      expect(loginStore.statusDescription, null);
      expect(authStore.user, userEntity);

      verify(
        () => navigator.pushNamedAndRemoveUntil(
          any(),
          any(),
          arguments: any(named: "arguments"),
        ),
      );
    },
  );

  test(
    "Testando fluxo de erro",
    () async {
      when(
        () => loginWithEmailUseCase(any()),
      ).thenAnswer(
        (_) async => Left(
          ErrorConnection(
            message: FailureMessages.Offline_Connection,
          ),
        ),
      );

      await sut.enterLoginEmail();

      expect(loginStore.statusDescription, FailureMessages.Offline_Connection);
    },
  );
}
