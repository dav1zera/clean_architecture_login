import 'package:clean_login/app/commons/presentation/controllers/auth_controller.dart';
import 'package:clean_login/app/commons/presentation/controllers/splash_screen_controller.dart';
import 'package:clean_login/app/commons/presentation/stores/auth_store.dart';
import 'package:clean_login/app/modules/login/domain/errors/errors.dart';
import 'package:clean_login/app/modules/login/domain/errors/messages.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AuthControllerMock extends Mock implements AuthController {}

class ModularNavigateMock extends Mock implements IModularNavigator {}

main() {
  late AuthController authController;
  late AuthStore authStore;
  late SplashScreenController sut;
  late IModularNavigator navigator;

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
      authStore = AuthStore();
      authController = AuthControllerMock();
      navigator = ModularNavigateMock();
      sut = SplashScreenController(
        authController: authController,
        store: authStore,
      );
      Modular.navigatorDelegate = navigator;

      mokcPushReplacementNamed();
    },
  );

  test(
    "Fluxo de init(Splash screen) = true",
    () async {
      when(() => authController.checkLogin()).thenAnswer(
        (_) async => true,
      );

      await sut.init();
      verifyNever(
        () => navigator.pushReplacementNamed(
          "/home",
          arguments: any(named: "arguments"),
        ),
      );
    },
  );

  test(
    "Fluxo de init(Splash screen) = false",
    () async {
      when(() => authController.checkLogin()).thenAnswer(
        (_) async => false,
      );

      await sut.init();
      verifyNever(
        () => navigator.pushReplacementNamed(
          "/login",
          arguments: any(named: "arguments"),
        ),
      );
    },
  );

  test(
    "Fluxo de on error",
    () async {
      when(() => authController.checkLogin()).thenAnswer(
        (_) async => Future.error(
          ErrorSplashScreen(message: FailureMessages.Splash_Screen_Load_Error),
        ),
      );
      await sut.init();
      verifyNever(
        () => navigator.pushReplacementNamed(
          "/login",
          arguments: any(named: "arguments"),
        ),
      );
    },
  );
}
