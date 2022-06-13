import 'package:clean_login/app/commons/presentation/stores/auth_store.dart';
import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/login/domain/usecases/login_with_email.dart';
import 'package:clean_login/app/modules/login/presentation/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginWithEmailUseCase loginWithEmailUseCase;

  final AuthStore authStore;
  final LoginStore store;

  _LoginControllerBase(
    this.loginWithEmailUseCase,
    this.authStore,
    this.store,
  );

  enterLoginEmail() async {
    store.isLoading.value = true;

    final credentials = Credentials(
      email: store.emailLogin.text,
      password: store.passwordLogin.text,
    );
    final result = await loginWithEmailUseCase(credentials);

    store.isLoading.value = false;
    result.fold(
      (failure) {
        store.statusDescription = failure.message;
      },
      (user) {
        store.statusDescription = null;
        authStore.user = user;
        Modular.to.pushNamedAndRemoveUntil("/home", (_) => false);
      },
    );
  }
}
