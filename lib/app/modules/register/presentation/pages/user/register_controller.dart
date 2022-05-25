import 'package:clean_login/app/commons/presentation/stores/auth_store.dart';
import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/register/domain/usecases/create_user_email.dart';
import 'package:clean_login/app/modules/register/presentation/pages/user/register_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'register_controller.g.dart';

@Injectable()
class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final CreateUserEmailUseCase createUserEmailUseCase;
  final AuthStore authStore;
  final RegisterStore store;

  _RegisterControllerBase(
    this.store,
    this.createUserEmailUseCase,
    this.authStore,
  );

  onTapRegister() async {
    final credentials = Credentials(
      email: store.emailRegister.text,
      password: store.passowordRegister.text,
      name: store.nameRegister.text,
    );
    final result = await createUserEmailUseCase(credentials);
    result.fold(
      (failure) => {
        store.statusDescription = failure.message,
      },
      (user) {
        store.statusDescription = null;
        authStore.user = user;
        Modular.to.pushNamed("adress", arguments: user.uid);
      },
    );
  }
}
