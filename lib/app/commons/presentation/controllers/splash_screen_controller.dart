import 'package:clean_login/app/commons/presentation/controllers/auth_controller.dart';
import 'package:clean_login/app/commons/presentation/stores/auth_store.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'splash_screen_controller.g.dart';

@Injectable()
class SplashScreenController = _SplashScreenControllerBase
    with _$SplashScreenController;

abstract class _SplashScreenControllerBase with Store {
  final AuthStore store;
  final AuthController authController;

  _SplashScreenControllerBase(
      {required this.store, required this.authController});

  init() async {
    await Future.delayed(
      Duration(
        seconds: 3,
      ),
    );
    authController.checkLogin().then(
      (value) {
        if (value) {
          Modular.to.pushReplacementNamed("/home");
        } else {
          Modular.to.pushReplacementNamed("/login");
        }
      },
    ).onError(
      (error, stackTrace) {
        Modular.to.pushReplacementNamed("/login");
      },
    );
  }
}
