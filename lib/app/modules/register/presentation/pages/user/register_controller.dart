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

  final RegisterStore store;

  _RegisterControllerBase(
    this.store,
    this.createUserEmailUseCase,
  );

  onTapRegister(context) async {
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
      (uid) {
        store.statusDescription = null;

        Modular.to.pushNamedAndRemoveUntil("register/adress", (_) => false,
            arguments: uid);
      },
    );
  }
}
