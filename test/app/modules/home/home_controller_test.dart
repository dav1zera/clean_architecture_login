import 'package:clean_login/app/commons/domain/entities/adress_entity.dart';
import 'package:clean_login/app/commons/presentation/controllers/auth_controller.dart';
import 'package:clean_login/app/commons/presentation/stores/auth_store.dart';
import 'package:clean_login/app/modules/home/domain/errors/messages.dart';
import 'package:clean_login/app/modules/home/domain/usecases/get_user_data.dart';
import 'package:clean_login/app/modules/home/home_controller.dart';
import 'package:clean_login/app/modules/home/presentation/home_store.dart';
import 'package:clean_login/app/modules/register/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetUserDataUseCaseMock extends Mock implements GetUserDataUseCase {}

class AuthControllerMock extends Mock implements AuthController {}

main() {
  late AuthStore authStore;
  late GetUserDataUseCase getUserDataUseCase;
  late HomeStore homeStore;
  late AuthController authController;
  late AdressEntity adressEntity;
  late HomeController sut;

  setUpAll(
    () {
      adressEntity = AdressEntity(
        cep: "39878-000",
        rua: "Rua chico",
        bairro: "ine",
        complemento: "csa",
        cidade: "texas",
        numero: "190",
      );
      authStore = AuthStore();
      getUserDataUseCase = GetUserDataUseCaseMock();
      homeStore = HomeStore();
      authController = AuthControllerMock();
      sut = HomeController(
        getUserDataUseCase: getUserDataUseCase,
        authStore: authStore,
        store: homeStore,
        authController: authController,
      );
    },
  );

  test(
    "Testando fluxo de controller",
    () async {
      when(() => getUserDataUseCase()).thenAnswer(
        (_) async => Right(adressEntity),
      );

      await sut.getInfoUser();
      expect(homeStore.adress, adressEntity);
    },
  );

  test(
    "fluxo de erro",
    () async {
      when(() => getUserDataUseCase()).thenAnswer(
        (_) async => Left(
          ErrorAdress(message: FailureHomeMessages.Get_Current_User),
        ),
      );

      await sut.getInfoUser();
      expect(homeStore.hasError, true);
    },
  );

  test(
    "Fluxo de logout",
    () async {
      when(() => authController.signOut()).thenAnswer(
        (_) async => null,
      );
      await sut.onTapLogout();
      verify(() => sut.onTapLogout());
    },
  );
}
