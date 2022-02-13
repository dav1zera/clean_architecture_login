import 'package:clean_login/app/core/stores/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'splash_screen_controller.g.dart';

@Injectable()
class SplashScreenController = _SplashScreenControllerBase
    with _$SplashScreenController;

abstract class _SplashScreenControllerBase with Store {
  final AuthStore store;

  _SplashScreenControllerBase({
    required this.store,
  });

  init() async {
    await Future.delayed(const Duration(
      seconds: 3,
    ));
    store.checkLogin().then((value) {
      if (value) {
        Modular.to.pushNamedAndRemoveUntil("/home", (_) => false);
      } else {
        Modular.to.pushNamed("/login");
      }
    }).onError((error, stackTrace) {
      Modular.to.pushNamed("/login");
    });
  }
}
