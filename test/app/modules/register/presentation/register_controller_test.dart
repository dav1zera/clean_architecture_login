import 'package:clean_login/app/commons/domain/entities/user_entity.dart';
import 'package:clean_login/app/commons/presentation/stores/auth_store.dart';
import 'package:clean_login/app/modules/home/domain/errors/messages.dart';
import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/register/domain/errors/errors.dart';
import 'package:clean_login/app/modules/register/domain/usecases/create_user_email.dart';
import 'package:clean_login/app/modules/register/presentation/pages/user/register_controller.dart';
import 'package:clean_login/app/modules/register/presentation/pages/user/register_store.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ModularNavigatorMock extends Mock implements IModularNavigator {}

class CreateUserEmailUseCaseMock extends Mock
    implements CreateUserEmailUseCase {}

class CredentialsFake extends Fake implements Credentials {}

main() {
  //late = iniciciar váriaveis não nulas
  late RegisterStore registerStore;
  late AuthStore authStore;
  late RegisterController sut;
  late CreateUserEmailUseCase createUserEmailUseCase;
  late UserEntity userEntity;
  late IModularNavigator navigator;

  //declaração do pushNamedAndRemovalUntil
  mockPushNamed() {
    when(
      () => navigator.pushNamed(
        any(),
        arguments: any(named: "arguments"),
      ),
    ).thenAnswer((_) async => null);
  }

  //Registros das funções antes de sua execução
  setUpAll(
    () {
      authStore = AuthStore();
      registerStore = RegisterStore();
      createUserEmailUseCase = CreateUserEmailUseCaseMock();
      sut = RegisterController(
        registerStore,
        createUserEmailUseCase,
        authStore,
      );
      userEntity = UserEntity(
        uid: "00000",
        name: "teste teste",
        email: "teste@mail.com",
      );

      //substtituir o objeto de navegção por um mock/fake
      //mock do pushNamedAndRemoveUntil
      navigator = ModularNavigatorMock();
      Modular.navigatorDelegate = navigator;
      mockPushNamed();

      //Poder usar o any(qualquer argumento)
      registerFallbackValue(
        CredentialsFake(),
      );
    },
  );

  test(
    ''' Dados as credenciais digitadas pelo usuário
        Quando ele tentar fazer um cadastro
        Então será cadastrado com sucesso ''',
    () async {
      when(
        () => createUserEmailUseCase(
          any(),
        ),
      ).thenAnswer(
        (_) async => Right(userEntity),
      );

      registerStore.emailRegister = TextEditingController(
        text: "teste@mail.com",
      );
      registerStore.nameRegister = TextEditingController(
        text: "teste teste",
      );
      registerStore.passowordRegister = TextEditingController(
        text: "372130D4v1;",
      );
      await sut.onTapRegister();

      //Espera uma status.Description = null
      expect(registerStore.statusDescription, null);
      //Espera uma userEntity
      expect(authStore.user, userEntity);

      verify(
        () => navigator.pushNamed(
          any(),
          arguments: any(named: "arguments"),
        ),
      );
    },
  );

  test(
    ''' Dado as credenciais digitadas pelo usuário
        Quando tentar fazer o cadastro 
        Então quero que retorne um erro ''',
    () async {
      when(
        () => createUserEmailUseCase(
          any(),
        ),
      ).thenAnswer(
        (_) async => Left(
          ErrorRegister(message: FailureHomeMessages.Failed_To_Logout),
        ),
      );
      await sut.onTapRegister();

      expect(
        registerStore.statusDescription,
        FailureHomeMessages.Failed_To_Logout,
      );
    },
  );
}
