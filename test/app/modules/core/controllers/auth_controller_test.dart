import 'package:clean_login/app/commons/domain/entities/user_entity.dart';
import 'package:clean_login/app/commons/helpers/asuka_helper.dart';
import 'package:clean_login/app/commons/presentation/controllers/auth_controller.dart';
import 'package:clean_login/app/commons/presentation/stores/auth_store.dart';
import 'package:clean_login/app/modules/login/domain/errors/errors.dart';
import 'package:clean_login/app/modules/login/domain/errors/messages.dart';
import 'package:clean_login/app/modules/login/domain/usecases/get_logged_user.dart';
import 'package:clean_login/app/modules/login/domain/usecases/logout.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ModularNavigateMock extends Mock implements IModularNavigator {}

class AuthControllerMock extends Mock implements AuthController {}

class UserEntityFake extends Fake implements UserEntity {}

class GetLoggedUserUseCaseMock extends Mock implements GetLoggedUserUseCase {}

class LogoutMock extends Mock implements Logout {}

class AsukaHelperMock extends Mock implements AsukaHelper {}

main() {
  late AuthController sut;
  late AuthStore authStore;
  late GetLoggedUserUseCase getLoggedUserUseCase;
  late UserEntity userEntity;
  late Logout logout;
  late IModularNavigator navigator;
  late AsukaHelper asukaHelper;

  mockPushNamedAndRemoveUntil() {
    when(
      () => navigator.pushNamedAndRemoveUntil(
        any(),
        any(),
        arguments: any(named: "arguments"),
      ),
    ).thenAnswer((_) async => null);
  }

  mockAsukaHelper() {
    when(
      () => asukaHelper.showSnackBar(
        any(),
      ),
    ).thenAnswer(
      (_) async => null,
    );
  }

  setUpAll(
    () {
      authStore = AuthStore();
      getLoggedUserUseCase = GetLoggedUserUseCaseMock();
      logout = LogoutMock();
      asukaHelper = AsukaHelperMock();
      sut = AuthController(
        authStore,
        getLoggedUserUseCase,
        logout,
        asukaHelper,
      );

      userEntity = UserEntity(
        uid: "123456",
        name: "Davi Alves",
        email: "teste@teste.com",
      );

      navigator = ModularNavigateMock();
      Modular.navigatorDelegate = navigator;
      mockPushNamedAndRemoveUntil();
      mockAsukaHelper();
      registerFallbackValue(
        UserEntityFake(),
      );
    },
  );

  test(
    ''' Dado as informações cadastradas do usuário
        Quando ele tentar fazer login
        Então retornar esses dados ''',
    () async {
      when(() => getLoggedUserUseCase()).thenAnswer(
        (_) async => Right(
          userEntity,
        ),
      );

      await sut.checkLogin();
      expect(userEntity.email, "teste@teste.com");
      expect(userEntity.name, "Davi Alves");
      expect(userEntity.uid, "123456");
      expect(authStore.user, userEntity);
    },
  );

  test(
    ''' Dado as informações cadastradas do usuário
        Quando ele tentar fazer login
        Então retornar um erro ''',
    () async {
      when(() => getLoggedUserUseCase()).thenAnswer(
        (_) async => Left(
          ErrorGetLoggedUser(message: FailureMessages.Error_Get_Logged_User),
        ),
      );

      await sut.checkLogin();
    },
  );

  test(
    ''' Dado que o usuário esteja cadastrado 
        Quando ele tentar fazer logout 
        Então quero que navegue para tela de login ''',
    () async {
      when(() => logout()).thenAnswer(
        (_) async => Right(
          unit,
        ),
      );
      await sut.signOut();

      expect(authStore.user, null);

      verify(
        () => navigator.pushNamedAndRemoveUntil(
          "/login",
          any(),
          arguments: any(named: "arguments"),
        ),
      );
    },
  );

  test(
    ''' Dado que o usuário esteja cadastrado 
        Quando ele tentar fazer logout 
        Então quero retorne um erro ''',
    () async {
      when(() => logout()).thenAnswer(
        (_) async => Left(
          ErrorSignOut(message: FailureMessages.Failed_To_Logout),
        ),
      );
      await sut.signOut();
      verify(
        () => asukaHelper.showSnackBar(
          any(),
        ),
      );
    },
  );
}
