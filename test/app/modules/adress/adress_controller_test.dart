import 'package:clean_login/app/commons/domain/entities/adress_entity.dart';
import 'package:clean_login/app/commons/presentation/controllers/auth_controller.dart';
import 'package:clean_login/app/commons/presentation/stores/auth_store.dart';
import 'package:clean_login/app/modules/login/domain/errors/messages.dart';
import 'package:clean_login/app/modules/register/domain/errors/errors.dart';
import 'package:clean_login/app/modules/register/domain/usecases/get_adress_by_cep.dart';
import 'package:clean_login/app/modules/register/domain/usecases/register_adress.dart';
import 'package:clean_login/app/modules/register/presentation/pages/adress/adress_controller.dart';
import 'package:clean_login/app/modules/register/presentation/pages/adress/adress_store.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ModularNavigateMock extends Mock implements IModularNavigator {}

class RegisterAdressUseCaseMock extends Mock implements RegisterAdressUseCase {}

class GetAdressByCepUseCaseMock extends Mock implements GetAdressByCepUseCase {}

class AuthControllerMock extends Mock implements AuthController {}

class AdressEntityFake extends Fake implements AdressEntity {}

main() {
  late GetAdressByCepUseCase getAdressByCepUseCase;
  late RegisterAdressUseCase registerAdressUseCase;
  late AdressStore adressStore;
  late AuthStore authStore;
  late AuthController authController;
  late IModularNavigator navigator;
  late AdressController sut;
  late AdressEntity adressEntity;

  mokcPushReplacementNamed() {
    when(
      () => navigator.pushReplacementNamed(
        any(),
        arguments: any(named: "arguments"),
      ),
    ).thenAnswer(
      (_) async => null,
    );
  }

  setUpAll(
    () {
      adressStore = AdressStore();
      authStore = AuthStore();
      authController = AuthControllerMock();
      registerAdressUseCase = RegisterAdressUseCaseMock();
      getAdressByCepUseCase = GetAdressByCepUseCaseMock();

      adressEntity = AdressEntity(
        cep: "39878-000",
        rua: "rua chico",
        bairro: "cocal",
        complemento: "csa",
        cidade: "texas",
        numero: "190",
      );
      sut = AdressController(
        adressStore,
        getAdressByCepUseCase,
        registerAdressUseCase,
        authStore,
        authController,
      );

      adressStore.cepTextController = TextEditingController(
        text: "39878-000",
      );
      adressStore.bairroTextController = TextEditingController(
        text: "cocal",
      );
      adressStore.cidadeTextController = TextEditingController(
        text: "texas",
      );
      adressStore.compleTextController = TextEditingController(
        text: "csa",
      );
      adressStore.numTextController = TextEditingController(
        text: "190",
      );
      adressStore.ruaTextController = TextEditingController(
        text: "rua chico",
      );

      sut.uid = "121545454545";

      navigator = ModularNavigateMock();
      Modular.navigatorDelegate = navigator;
      mokcPushReplacementNamed();
      registerFallbackValue(AdressEntityFake());
    },
  );

  test(
    "Fluxo de controller(call adress repository)",
    () async {
      when(
        () => getAdressByCepUseCase(
          cep: adressStore.cepTextController.text,
        ),
      ).thenAnswer(
        (_) async => Right(adressEntity),
      );

      await sut.onChangedCep(adressStore.cepTextController.text);

      expect(adressStore.cepTextController.text, adressEntity.cep);
      expect(adressStore.bairroTextController.text, adressEntity.bairro);
      expect(adressStore.cidadeTextController.text, adressEntity.cidade);
      expect(adressStore.ruaTextController.text, adressEntity.rua);
    },
  );

  test(
    "Fluxo de erro(call adress)",
    () async {
      when(
        () => getAdressByCepUseCase(cep: adressStore.cepTextController.text),
      ).thenAnswer(
        (_) async => Left(
          ErrorGetAdress(message: FailureMessages.Failed_Register_Adress),
        ),
      );

      await sut.onChangedCep(adressStore.cepTextController.text);
      expect(adressStore.hasError, true);
    },
  );

  test(
    "Testando fluxo de controller(on tap register) true",
    () async {
      when(
        () => registerAdressUseCase(
          uid: any(
            named: "uid",
          ),
          adressEntity: any(
            named: "adressEntity",
          ),
        ),
      ).thenAnswer(
        (_) async => Right(unit),
      );

      when(() => authController.checkLogin()).thenAnswer(
        (_) async => true,
      );

      await sut.onTapRegisterAdress();

      expect(adressStore.statusDescription, null);

      verify(
        () => navigator.pushReplacementNamed(
          "/home",
          arguments: any(named: "arguments"),
        ),
      );
    },
  );

  test(
    "Testando fluxo de controller(on tap register) false",
    () async {
      when(
        () => registerAdressUseCase(
          uid: any(
            named: "uid",
          ),
          adressEntity: any(
            named: "adressEntity",
          ),
        ),
      ).thenAnswer(
        (_) async => Right(unit),
      );

      when(() => authController.checkLogin()).thenAnswer(
        (_) async => false,
      );

      await sut.onTapRegisterAdress();

      expect(adressStore.statusDescription, null);

      verify(
        () => navigator.pushReplacementNamed(
          "/login",
          arguments: any(named: "arguments"),
        ),
      );
    },
  );

  test(
    "Testando fluxo de erro(on tap)",
    () async {
      when(
        () => registerAdressUseCase(
          uid: any(
            named: "uid",
          ),
          adressEntity: any(
            named: "adressEntity",
          ),
        ),
      ).thenAnswer(
        (_) async => Left(
          ErrorGetAdress(
            message: FailureMessages.Error_Register_Adress,
          ),
        ),
      );
      await sut.onTapRegisterAdress();
      expect(
        adressStore.statusDescription,
        FailureMessages.Error_Register_Adress,
      );
    },
  );

  test(
    "Fluxo de on error",
    () async {
      when(
        () => registerAdressUseCase(
          uid: any(
            named: "uid",
          ),
          adressEntity: any(
            named: "adressEntity",
          ),
        ),
      ).thenAnswer(
        (_) async => Right(unit),
      );

      when(
        () => authController.checkLogin(),
      ).thenAnswer(
        (_) async => Future.error(
          ErrorAdress(
            message: FailureMessages.Error_Execute_Login,
          ),
        ),
      );

      await sut.onTapRegisterAdress();
      expect(adressStore.statusDescription, null);

      verify(
        () => navigator.pushReplacementNamed(
          "/login",
          arguments: any(named: "arguments"),
        ),
      );
    },
  );
}
